<?php

namespace Database\Seeders;

// use Illuminate\Database\Console\Seeds\WithoutModelEvents;

use App\Models\School;
use Illuminate\Database\Seeder;

class DatabaseSeeder extends Seeder
{
    /**
     * Seed the application's database.
     */
    public function run(): void
    {
        School::create(['name' => 'Pinecrest School', 'subscription' => 'basic']);
        $this->call(SchoolSeeder::class);
        $this->call(StudentSeeder::class);
    }
}
