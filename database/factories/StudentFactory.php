<?php

namespace Database\Factories;

use App\Models\Student;
use Illuminate\Database\Eloquent\Factories\Factory;
use Ramsey\Uuid\Uuid;

/**
 * @extends \Illuminate\Database\Eloquent\Factories\Factory<\App\Models\Student>
 */
class StudentFactory extends Factory
{
    protected $model = Student::class;
    /**
     * Define the model's default state.
     *
     * @return array<string, mixed>
     */
    public function definition(): array
    {
        return [
            'first_name' => "James",
            'last_name' => "Sandles",
            'tutor_group' => $this->faker->randomNumber(3),
            'year_level' => $this->faker->numberBetween(9, 13),
            'identifier' => bin2hex(random_bytes(4)),
            'school_id' => '5f6a486f-ae48-4755-be6c-0d86ef491f68',
        ];
    }
}
