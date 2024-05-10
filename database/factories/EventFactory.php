<?php

namespace Database\Factories;

use App\Models\School;
use Illuminate\Database\Eloquent\Factories\Factory;

/**
 * @extends \Illuminate\Database\Eloquent\Factories\Factory<\App\Models\Event>
 */
class EventFactory extends Factory
{
    /**
     * Define the model's default state.
     *
     * @return array<string, mixed>
     */
    public function definition(): array
    {
        return [
            'name' => 'testing event',
            'school_id' => School::factory(),
            'description' => 'testing description',
            'location' => 'School Gym',
            'date' => now()->addWeeks(7),
            'time' => '10:40'
        ];
    }

    // Define a state for associating a user and a student
    public function forSchool(School $school)
    {
        return $this->state(function (array $attributes) use ($school) {
            return [
                'school_id' => $school->id,
            ];
        });
    }
}
