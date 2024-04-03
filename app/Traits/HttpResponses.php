<?php

namespace App\Traits;

trait HttpResponses {
    protected function success($data, $status = null, $message = null, $code = 200)
    {
        return response()->json([
            'status' => $status ?: 'Request was successful',
            'message' => $message,
            'data' => $data
        ], $code);
    }

    protected function error($data, $status = null, $message = null, $code)
    {
        return response()->json([
            'status' => $status ?: 'Error has occurred...',
            'message' => $message,
            'data' => $data
        ], $code);
    }

    protected function generalError()
    {
        return response()->json([
            'status' => 'Error has occurred...',
            'message' => 'An unknown error has occured...',
            'data' => null
        ], 500);
    }

    protected function authenticationError()
    {
        return response()->json([
            'status' => 'Unathorized',
            'message' => 'You are not authorized to take this action',
            'data' => null
        ], 403);
    }
}