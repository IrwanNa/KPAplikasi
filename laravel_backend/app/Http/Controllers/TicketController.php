<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Models\Ticket;
use App\Models\Visitor;
use App\Models\Reservation;
use App\Models\ReservationDetail;
use App\Models\Payment;

class TicketController extends Controller
{
    public function checkAvailability(Request $request)
    {
        $dewasa = $request->input('dewasa');

        $availableDewasa = Ticket::where('type', 'dewasa')->where('status', 'available')->sum('stock');

        if ($dewasa > $availableDewasa) {
            return response()->json([
                'status' => 'failed',
                'message' => 'Mohon Maaf tiket sudah habis',
                'availableDewasa' => $availableDewasa,
            ], 200);
        } else {
            return response()->json([
                'status' => 'success',
                'message' => 'Tiket tersedia',
            ], 200);
        }
    }

    public function submitReservation(Request $request)
    {
        // validasi inputan
        $validatedData = $request->validate([
            'name' => 'required|string|max:255',
            'phone' => 'required|string|max:15',
            'jumlah' => 'required|integer',
            'totalBayar' => 'required|integer',
        ]);

        // Ambil data dari input yang sudah divalidasi
        $name = $validatedData['name'];
        $phone = $validatedData['phone'];
        $dewasa = $validatedData['jumlah'];
        $totalBayar = $validatedData['totalBayar'];

        // simpan dt ke tb visitor
        $visitor = Visitor::create([
        'name' => $name, 
        'phone' => $phone
    ]);

        // simpan dt ke tb reservasi
        $reservation = Reservation::create([
            'visitor_id' => $visitor->id,
            'total_price' => $totalBayar,
            'status' => 'pending',
        ]);

        // simpan dt ke tb reservasi_detail
        ReservationDetail::create([
            'reservation_id' => $reservation->id,
            'ticket_id' => 1, // misal ticket_id 1 utk'dewasa'
            'quantity' => $dewasa,
            'price' => 15000, // hrga per ticket
        ]);

        return response()->json([
            'status' => 'success',
            'message' => 'Reservasi berhasil diterima. Lanjutkan ke pembayaran.',
        ], 200);
    }

    public function submitPayment(Request $request)
    {
        try {
            $validatedData = $request->validate([
                'name' => 'required',
                'phone' => 'required',
                'jumlah' => 'required|integer',
                'totalBayar' => 'required|integer',
                'payment_method' => 'required',
                'buktiTransfer' => 'required|file',
            ]);

             // Cari reservasi berdasarkan nama dan nomor telepon
             $reservation = Reservation::whereHas('visitor', function ($query) use ($validatedData) {
                $query->where('name', $validatedData['name'])
                    ->where('phone', $validatedData['phone']);
            })->first();

            if (!$reservation) {
                return response()->json(['message' => 'Reservasi tidak ditemukan'], 404);
            }

            // simpan bukti gbr ke db
            $buktiTransfer = $request->file('buktiTransfer')->store('bukti_transfer', 'public');
    
            Payment::create([
                'reservation_id' => $reservation->id,
                'name' => $validatedData['name'],
                'jumlah' => $validatedData['jumlah'],
                'totalBayar' => $validatedData['totalBayar'],
                'payment_method' => $validatedData['payment_method'],
                'buktiTransfer' => $buktiTransfer,
            ]);
            return response()->json(['message' => 'Bukti pembayaran berhasil diunggah'], 200);
            
        } catch (\Illuminate\Validation\ValidationException $e) {
            return response()->json(['message' => 'Bukti transfer tidak terkirim'], 400);
        }
    }
 }

