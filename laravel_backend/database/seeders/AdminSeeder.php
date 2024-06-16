<?php

namespace Database\Seeders;

use Illuminate\Database\Console\Seeds\WithoutModelEvents;
use Illuminate\Database\Seeder;
use Illuminate\Support\Facades\DB;
use App\Models\User;
use Illuminate\Support\Facades\Hash;

class AdminSeeder extends Seeder
{
    /**
     * Run the database seeds.
     */
    public function run(): void
    {
        DB::table('users')->insert([
            'name' => 'Admin Tiket',
            'email' => 'puncakpinus@gmail.com',
            'password' => Hash::make('pinusjaya123'),
            'created_at' => now(),
            'updated_at' => now(),
        ]);
    }
}
