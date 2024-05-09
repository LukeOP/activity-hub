<?php

use App\Models\Event;
use App\Models\EventUser;
use App\Models\Lesson;
use App\Models\School;
use App\Models\Student;
use App\Models\User;
use App\Models\UserPermission;
use App\Models\UserSchool;
use Laravel\Sanctum\Sanctum;

beforeEach(function (){
    $this->school = School::create(['name' => 'Pinecrest School', 'subscription' => 'basic']);
    $this->user = User::factory()->create();
    $this->student = Student::factory()->create();
    Sanctum::actingAs($this->user, ['*']);
});

afterEach(function () {
    if(isset($this->event_user)) $this->event_user->forceDelete();
    if(isset($this->user_permission)) $this->user_permission->forceDelete();
    if(isset($this->user_school)) $this->user_school->forceDelete();
    $this->user->forceDelete();
    $this->student->forceDelete();
});

test('Events list can be retrieved by admin user', function () {
    $this->user_school = UserSchool::create(['user_id' => $this->user['id'], 'school_id' => $this->school['id']]);
    $this->user_permission = UserPermission::create(['school_id' => $this->school['id'],'user_id' => $this->user['id'],'permission_type' => 'Administrator']);
    Event::factory()->forSchool($this->school)->count(5)->create();
    $response = $this->get('/api/events');
    $response->assertOk();
    // Decode the JSON response
    $responseData = $response->json();
    // Assert that the 'data' array exists in the response
    $this->assertArrayHasKey('data', $responseData);
    // Assert that the count of items in the 'data' array is 5
    $this->assertCount(5, $responseData['data']);
});

test('Events list can be retrieved by admin user for associated school', function () {
    $this->user_school = UserSchool::create(['user_id' => $this->user['id'], 'school_id' => $this->school['id']]);
    $this->user_permission = UserPermission::create(['school_id' => $this->school['id'],'user_id' => $this->user['id'],'permission_type' => 'Administrator']);
    Event::factory()->forSchool($this->school)->count(5)->create();
    Event::factory()->count(5)->create();
    $response = $this->get('/api/events');
    $response->assertOk();
    // Decode the JSON response
    $responseData = $response->json();
    // Assert that the 'data' array exists in the response
    $this->assertArrayHasKey('data', $responseData);
    // Assert that the count of items in the 'data' array is 5
    $this->assertCount(5, $responseData['data']);
});

test('Events list can be retrieved by EVENTS_V Permission user for associated school', function () {
    $this->user_school = UserSchool::create(['user_id' => $this->user['id'], 'school_id' => $this->school['id']]);
    $this->user_permission = UserPermission::create(['school_id' => $this->school['id'],'user_id' => $this->user['id'],'permission_type' => 'EVENTS_V']);
    Event::factory()->forSchool($this->school)->count(5)->create();
    Event::factory()->count(5)->create();
    $response = $this->get('/api/events');
    $response->assertOk();
    // Decode the JSON response
    $responseData = $response->json();
    // Assert that the 'data' array exists in the response
    $this->assertArrayHasKey('data', $responseData);
    // Assert that the count of items in the 'data' array is 5
    $this->assertCount(5, $responseData['data']);
});

test('Events list can be retrieved by linked user', function () {
    Event::factory()->count(5)->create();
    $this->user_school = Event::factory()->forSchool($this->school)->create();
    $this->event_user = EventUser::create(['event_id' => $this->user_school['id'], 'user_id' => $this->user['id'],]);
    $response = $this->get('/api/events');
    $response->assertOk();
    // Decode the JSON response
    $responseData = $response->json();
    // Assert that the 'data' array exists in the response
    $this->assertArrayHasKey('data', $responseData);
    // Assert that the count of items in the 'data' array is 1
    $this->assertCount(1, $responseData['data']);
});

test('Events list returns 0 results for non associated user', function () {
    $this->events = Lesson::factory()->count(5)->create();
    $response = $this->get('/api/events');
    $response->assertOk();
    // Decode the JSON response
    $responseData = $response->json();
    // Assert that the 'data' array exists in the response
    $this->assertArrayHasKey('data', $responseData);
    // Assert that the count of items in the 'data' array is 0
    $this->assertCount(0, $responseData['data']);
});

test('Retrieved event data matches expected data', function () {
    $this->user_school = Event::factory()->forSchool($this->school)->create();
    $this->event_user = EventUser::create(['event_id' => $this->user_school['id'], 'user_id' => $this->user['id'],]);
    $response = $this->get('/api/events');
    $response->assertOk();

    $responseData = $response->json();
    foreach ($responseData['data'] as $eventData) {
        $this->assertArrayHasKey('id', $eventData);
        $this->assertArrayHasKey('id', $eventData['school']);
        $this->assertArrayHasKey('name', $eventData['attributes']);
    }
});

test('Event can be created', function () {
    $response = $this->post('/api/events', [
        'name' => 'Test Event',
        'school_id' => $this->school['id'],
        'description' => 'Test description',
        'location' => 'Test Location',
        'date' => now()->addWeeks(10),
        'time' => '10:40',
    ]);

    $response->assertCreated();
});

test('Event creation fails with invalid data', function () {
    $response = $this->postJson('/api/events', []);
    $response->assertStatus(422);
    $response->assertJsonValidationErrors('name');
    $response->assertJsonValidationErrors('school_id');
    $response->assertJsonValidationErrors('description');
    $response->assertJsonValidationErrors('location');
    $response->assertJsonValidationErrors('date');
    $response->assertJsonValidationErrors('time');
});

test('Event can be updated', function () {
    $newEvent = Event::factory()->create();
    $response = $this->patch('api/events/' . $newEvent['id'], [
        'name' => 'Updated Test',
        'description' => 'Updated Description',
        'location' => 'Updated Location',
        'date' => '2024-01-01',
        'time' => '12:00',
    ]);
    $response->assertOk();
    $event = $response['data'];
    $this->assertArrayHasKey('id', $event);
    $this->assertArrayHasKey('name', $event['attributes']);
    $this->assertSame('Updated Test', $event['attributes']['name']);
    $this->assertSame('Updated Description', $event['attributes']['description']);
    $this->assertSame('Updated Location', $event['attributes']['location']);
    $this->assertSame('2024-01-01', $event['attributes']['date']);
    $this->assertSame('12:00:00', $event['attributes']['time']);
});

test('Event update fails for non-existent lesson', function () {
    $response = $this->patch('/api/events/999');
    $response->assertNotFound();
});

test('Event can be deleted', function () {
    $event = Event::factory()->create();
    $response = $this->delete('api/events/' . $event['id']);
    $response->assertNoContent();
});

test('lesson deletion fails for non-existent lesson', function () {
    $response = $this->delete('/api/lessons/999');
    $response->assertNotFound();
});