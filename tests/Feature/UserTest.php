<?php

use Tests\TestCase;
use App\Models\User;

test('create a new user', function (TestCase $test) {
    // Within this test, any database changes are wrapped in a transaction
    // Any changes made here won't affect the actual database

    $test->post('/users', [
            'name' => 'Test User',
            'email' => 'test@example.com',
            'password' => 'password'
        ])
        ->assertStatus(201);

    // At the end of the test, the transaction is rolled back automatically
    // So the database is restored to its original state
});