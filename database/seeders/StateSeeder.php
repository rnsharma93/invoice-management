<?php

namespace Database\Seeders;

use Illuminate\Database\Console\Seeds\WithoutModelEvents;
use Illuminate\Database\Seeder;

class StateSeeder extends Seeder
{
    /**
     * Run the database seeds.
     */
    public function run(): void
    {
        $states = [
            ['name' => 'Andhra Pradesh', 'code' => '01'],
            ['name' => 'Arunachal Pradesh', 'code' => '02'],
            ['name' => 'Assam', 'code' => '03'],
            ['name' => 'Bihar', 'code' => '04'],
            ['name' => 'Chhattisgarh', 'code' => '05'],
            ['name' => 'Goa', 'code' => '06'],
            ['name' => 'Gujarat', 'code' => '07'],
            ['name' => 'Haryana', 'code' => '08'],
            ['name' => 'Himachal Pradesh', 'code' => '09'],
            ['name' => 'Jharkhand', 'code' => '10'],
            ['name' => 'Karnataka', 'code' => '11'],
            ['name' => 'Kerala', 'code' => '12'],
            ['name' => 'Madhya Pradesh', 'code' => '13'],
            ['name' => 'Maharashtra', 'code' => '14'],
            ['name' => 'Manipur', 'code' => '15'],
            ['name' => 'Meghalaya', 'code' => '16'],
            ['name' => 'Mizoram', 'code' => '17'],
            ['name' => 'Nagaland', 'code' => '18'],
            ['name' => 'Odisha', 'code' => '19'],
            ['name' => 'Punjab', 'code' => '20'],
            ['name' => 'Rajasthan', 'code' => '21'],
            ['name' => 'Sikkim', 'code' => '22'],
            ['name' => 'Tamil Nadu', 'code' => '23'],
            ['name' => 'Telangana', 'code' => '24'],
            ['name' => 'Tripura', 'code' => '25'],
            ['name' => 'Uttar Pradesh', 'code' => '26'],
            ['name' => 'Uttarakhand', 'code' => '27'],
            ['name' => 'West Bengal', 'code' => '28'],
            ['name' => 'Andaman and Nicobar Islands', 'code' => '29'],
            ['name' => 'Chandigarh', 'code' => '30'],
            ['name' => 'Dadra and Nagar Haveli and Daman and Diu', 'code' => '31'],
            ['name' => 'Delhi', 'code' => '32'],
            ['name' => 'Jammu and Kashmir', 'code' => '33'],
            ['name' => 'Ladakh', 'code' => '34'],
            ['name' => 'Lakshadweep', 'code' => '35'],
            ['name' => 'Puducherry', 'code' => '36'],
        ];

        DB::table('states')->insert($states);
    }
}
