<?php

namespace Tests\Feature;

use App\Models\Student;
use App\Models\UserPermission;
use Illuminate\Foundation\Testing\RefreshDatabase;
use Illuminate\Foundation\Testing\WithFaker;
use Tests\TestCase;

class StudentControllerTest extends TestCase
{
    /**
     * A basic feature test example.
     */
    public function test_example(): void
    {
        $response = $this->get('/');

        $response->assertStatus(200);
    }

    /** @test */
    public function it_displays_the_student()
    {
        // Create a student in the database
        $student = Student::factory()->create();

        // Make a GET request to the show method of the studentController
        $response = $this->get(route('students.show', ['student' => $student->id]));
        // echo $response;
    }
}
