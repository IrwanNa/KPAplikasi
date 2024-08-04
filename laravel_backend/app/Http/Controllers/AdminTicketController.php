<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Models\Reservation;
use App\Models\Ticket;

class AdminTicketController extends Controller
{
    public function showReservations()
    {
        $reservations = Reservation::where('status', 'pending')
                                    ->with(['visitor', 'details.ticket', 'payments'])
                                    ->get();
        return view('admin.reservations', compact('reservations'));
    }

    public function validateReservation($id)
    {
        $reservation = Reservation::find($id);
        if ($reservation) {
            $reservation->status = 'validated';
            $reservation->save();
            
            // Update ticket stock
            foreach ($reservation->details as $detail) {
                $ticket = $detail->ticket;
                $ticket->stock -= $detail->quantity;
                $ticket->save();
            }

            return redirect()->route('admin.reservations')->with('success', 'Reservasi Ditandai Berhasil.');
        }

        return redirect()->route('admin.reservations')->with('error', 'Reservasi Gagal.');
    }

    public function rejectReservation($id)
    {
        $reservation = Reservation::find($id);
        if ($reservation) {
            $reservation->delete();
            return redirect()->route('admin.reservations')->with('success', 'Reservasi Ditolak.');
        }

        return redirect()->route('admin.reservations')->with('error', 'Reservasi Gagal.');
    }

    public function dashboard()
    {
        $successfulReservations = Reservation::where('status', 'validated')->count();
        $totalTicketStock = Ticket::sum('stock');

        return view('admin.dashboard', compact('successfulReservations', 'totalTicketStock'));
    }

    public function showTickets()
    {
        $tickets = Ticket::all();
        return view('admin.tickets', compact('tickets'));
    }

    public function addTicketStock(Request $request)
    {
        $request->validate([
            'ticket_id' => 'required|exists:tickets,id',
            'stock' => 'required|integer|min:1',
        ]);

        $ticket = Ticket::find($request->ticket_id);
        $ticket->stock += $request->stock;
        $ticket->save();

        return redirect()->route('admin.tickets')->with('success', 'Stok tiket berhasil ditambahkan');
    }

    public function resetReservations()
    {
        Reservation::where('status', 'validated')->update(['status' => 'reset']);
        return redirect()->route('admin.tickets')->with('success', 'Reservasi berhasil direset');
    }

    public function laporan(Request $request)
    {

        $reservations = Reservation::where('status', 'validated')
                                    ->with('visitor') // Memastikan relasi visitor dimuat
                                    ->get();
    // Debug: Log hasil query
    // \Log::info('Reservations:', $reservations->toArray());

        return view('admin.laporan', compact('reservations'));
    }

}
