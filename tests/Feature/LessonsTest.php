<?php

use App\Models\Lesson;
use App\Models\School;
use App\Models\Student;
use App\Models\User;
use Laravel\Sanctum\Sanctum;

beforeEach(function (){
    School::create(['name' => 'Pinecrest School', 'subscription' => 'basic']);
    $this->user = User::factory()->create();
    $this->student = Student::factory()->create();
    Sanctum::actingAs($this->user, ['*']);
});

afterEach(function () {
    if(isset($this->lessons)) {
        foreach ($this->lessons as $lesson) {
            $lesson->forceDelete();
            if($lesson['user_id'] !== $this->user->id) User::find($lesson['user_id'])->forceDelete();
            if($lesson['student_id'] !== $this->student->id) Student::find($lesson['student_id'])->forceDelete();
        }
    }
    $this->user->forceDelete();
    $this->student->forceDelete();
});

test('lesson list can be retrieved by associated user', function () {
    $this->lessons = Lesson::factory()->forUserAndStudent($this->user, $this->student)->count(5)->create();
    $response = $this->get('/api/lessons');
    $response->assertOk();
    // Decode the JSON response
    $responseData = $response->json();
    // Assert that the 'data' array exists in the response
    $this->assertArrayHasKey('data', $responseData);
    // Assert that the count of items in the 'data' array is 5
    $this->assertCount(5, $responseData['data']);
});

test('lesson list returns 0 results for non associated user', function () {
    $this->lessons = Lesson::factory()->count(5)->create();
    $response = $this->get('/api/lessons');
    $response->assertOk();
    // Decode the JSON response
    $responseData = $response->json();
    // Assert that the 'data' array exists in the response
    $this->assertArrayHasKey('data', $responseData);
    // Assert that the count of items in the 'data' array is 5
    $this->assertCount(0, $responseData['data']);
});

test('retrieved lesson data matches expected data', function () {
    $this->lessons = Lesson::factory()->forUserAndStudent($this->user, $this->student)->count(5)->create();
    $response = $this->get('/api/lessons');
    $response->assertOk();

    $responseData = $response->json();
    foreach ($responseData['data'] as $lessonData) {
        $this->assertArrayHasKey('id', $lessonData);
        $this->assertArrayHasKey('id', $lessonData['tutor']);
        $this->assertArrayHasKey('id', $lessonData['student']);
        $this->assertArrayHasKey('instrument', $lessonData['attributes']);
    }
});

test('lesson can be created', function () {
    $response = $this->post('/api/lessons', [
        'user_id' => $this->user->id,
        'student_id' => $this->student->id,
        'instrument' => 'test instrument',
        'experience' => 'No Experience',
        'funding_type' => 'funded'
    ]);

    $response->assertCreated();
    Lesson::find($response['data']['id'])->forceDelete();
});

test('lesson creation fails with invalid data', function () {
    $response = $this->postJson('/api/lessons', [
        'user_id' => $this->user->id,
        'student_id' => $this->student->id,
    ]);
    $response->assertStatus(422);
    $response->assertJsonValidationErrors('instrument');
});

test('lesson creation fails with long data', function () {
    $response = $this->postJson('/api/lessons', [
        'user_id' => $this->user->id,
        'student_id' => $this->student->id,
        'instrument' => 'test instrument',
        'experience' => 'No Experience',
        'funding_type' => 'funded Lorem ipsum dolor sit amet consectetur adipisicing elit. Numquam laudantium quam quos suscipit deserunt fugit ex voluptatibus! Fuga porro a rerum exercitationem. Error minus quas deleniti quia adipisci doloribus et dolorem id accusantium magni ut recusandae aliquid dicta excepturi hic voluptate laborum repudiandae, culpa dolore modi corrupti eligendi inventore. Atque?'
    ]);
    $response->assertStatus(422);
    $response->assertJsonValidationErrors('funding_type');
});

test('lesson can be updated', function () {
    $newLesson = Lesson::factory()->forUserAndStudent($this->user, $this->student)->create();
    $response = $this->patch('api/lessons/' . $newLesson['id'], [
        'start' => '09:00',
        'end' => '09:30',
        'day' => 'Saturday',
        'start_date' => '2024-01-01',
        'end_date' => '2024-02-01',
        'funding_type' => 'updated',
        'term_link' => 2,
        'status' => 'tested',
        'instrument' => 'test instrument edited',
    ]);
    $response->assertOk();
    $lesson = $response['data'];
    $this->assertSame('09:00:00', $lesson['attributes']['start']);
    $this->assertSame('09:30:00', $lesson['attributes']['end']);
    $this->assertSame('Saturday', $lesson['attributes']['day']);
    $this->assertSame('2024-01-01', $lesson['attributes']['startDate']);
    $this->assertSame('2024-02-01', $lesson['attributes']['endDate']);
    $this->assertSame('test instrument', $lesson['attributes']['instrument']);

    Lesson::find($lesson['id'])->forceDelete();
});

test('lesson update fails for non-existent lesson', function () {
    $response = $this->patch('/api/lessons/999');
    $response->assertNotFound();
});

test('Retrieve lessons list from student id who has lessons', function () {
    $this->lessons = Lesson::factory()->forUserAndStudent($this->user, $this->student)->count(5)->create();
    $response = $this->get('api/student-lessons/' . $this->student['id']);
    $response->assertOk();
    // Decode the JSON response
    $responseData = $response->json();
    // Assert that the 'data' array exists in the response
    $this->assertArrayHasKey('data', $responseData);
    // Assert that the count of items in the 'data' array is 5
    $this->assertCount(5, $responseData['data']);
});

test('Retrieve empty array from students who don\'t have lessons', function () {
    $this->lessons = Lesson::factory()->count(5)->create();
    $response = $this->get('api/student-lessons/' . $this->student['id']);
    $response->assertOk();
    // Decode the JSON response
    $responseData = $response->json();
    // Assert that the 'data' array exists in the response
    $this->assertArrayHasKey('data', $responseData);
    // Assert that the count of items in the 'data' array is 5
    $this->assertCount(0, $responseData['data']);
});


test('lesson can be deleted', function () {
    $lesson = Lesson::factory()->create();
    $response = $this->delete('api/lessons/' . $lesson['id']);
    $response->assertNoContent();
    $this->lessons = [$lesson];
});

test('lesson deletion fails for non-existent lesson', function () {
    $response = $this->delete('/api/lessons/999');
    $response->assertNotFound();
});