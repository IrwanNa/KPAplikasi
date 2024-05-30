<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Models\Ticket;

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
        $name = $request->input('name');
        $dewasa = $request->input('dewasa');
        $totalBayar = $request->input('totalBayar');

        // Validasi data atau lakukan proses penyimpanan reservasi di database

        return response()->json([
            'status' => 'success',
            'message' => 'Reservasi berhasil diterima. Lanjutkan ke pembayaran.',
        ], 200);
    }

    public function submitPayment(Request $request)
    {
        $name = $request->input('name');
        $dewasa = $request->input('dewasa');
        $totalBayar = $request->input('totalBayar');

        if ($request->hasFile('payment_proof')) {
            $path = $request->file('payment_proof')->store('payment_proofs', 'public');

            // Simpan data reservasi beserta bukti pembayaran ke database
            Reservation::create([
                'name' => $name,
                'dewasa' => $dewasa,
                'totalBayar' => $totalBayar,
                'payment_proof' => $path,
                'status' => 'waiting'
            ]);

            return response()->json([
                'status' => 'success',
                'message' => 'Bukti pembayaran berhasil diunggah. Menunggu validasi dari admin.',
            ], 200);
        } else {
            return response()->json([
                'status' => 'failed',
                'message' => 'Bukti pembayaran tidak ditemukan.',
            ], 400);
        }
    }
}
