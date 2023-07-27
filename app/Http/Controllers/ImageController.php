<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;

class ImageController extends Controller
{
    public function storeImage(Request $request)
    {
        $path = $request->file('image')->store('public/' . $request->path);

        return $path;
    }

    public function getImage($path, $filename)
    {
        $link = 'app/public/' . $path . '/' . $filename;
        $path = storage_path($link);

        if (!file_exists($path)) {
            abort(404);
        }

        return response()->file($path);
    }
}
