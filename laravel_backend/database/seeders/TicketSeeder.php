<?php

namespace Database\Seeders;

// use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Console\Seeds\WithoutModelEvents;
use Illuminate\Database\Seeder;
use App\Models\Ticket;
use Illuminate\Support\Facades\DB;



class TicketSeeder extends Seeder
{
    /**
     * Run the database seeds.
     */

     public function run()
    {
        DB::table('tickets')->insert(
            [
                'type' => 'dewasa',
                'stock' => 200, // jumlah stok tiket dewasa
                'status' => 'available',
                'created_at' => now(),
                'updated_at' => now(),
            ]);
    }
}