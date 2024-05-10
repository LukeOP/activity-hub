<?php

namespace Database\Factories;

use App\Models\School;
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
        $year_level = $this->faker->numberBetween(9, 13);
        $randomSchool = School::inRandomOrder()->value('id');

        return [
            'first_name' => fake()->firstName(),
            'last_name' => fake()->lastName(),
            'tutor_group' => $year_level . fake()->regexify('[A-Z]{2}'),
            'year_level' => $year_level,
            'identifier' => bin2hex(random_bytes(4)),
            'school_id' => $randomSchool,
        ];
    }
}
