<?php

namespace Database\Factories;

use App\Models\Student;
use App\Models\User;
use Illuminate\Database\Eloquent\Factories\Factory;

/**
 * @extends \Illuminate\Database\Eloquent\Factories\Factory<\App\Models\Lesson>
 */
class LessonFactory extends Factory
{
    /**
     * Define the model's default state.
     *
     * @return array<string, mixed>
     */
    public function definition(): array
    {
        return [
            'instrument' => 'test instrument',
            'user_id' => User::factory(),
            'student_id' => Student::factory(),
        ];
    }

    // Define a state for associating a user and a student
    public function forUserAndStudent(User $user, Student $student)
    {
        return $this->state(function (array $attributes) use ($user, $student) {
            return [
                'user_id' => $user->id,
                'student_id' => $student->id,
            ];
        });
    }
}
