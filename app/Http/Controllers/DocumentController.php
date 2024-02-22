<?php

namespace App\Http\Controllers;

use App\Models\Document;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Storage;
use Illuminate\Support\Facades\Validator;

class DocumentController extends Controller
{
    public function upload(Request $request){
        $validator = Validator::make($request->all(), [
            'file' => 'required|max:10240|min:10',
        ]);
        
        if ($validator->fails()) {
            return response()->json(['errors' => $validator->errors()], 422);
        }
        
        $file = $request->file('file');

        $originalName = $file->getClientOriginalName();
        $fileName = time() . '_' . str_replace(' ', '_', $originalName);

        $filePath = $file->storeAs('documents/'.$request->category, $fileName, 'local');
    
        $document = new Document([
            'name' => $fileName,
            'path' => $filePath,
            'school_id' => $request->school_id
        ]);
        $document->save();
    
        return response()->json([
            'message' => 'Document uploaded successfully',
            'document_id' => $document->id
        ]);
    }

    // public function download(string $id)
    public function download(Request $request)
    {
        $document = Document::where('id', $request->document)->first();
        if($document){
            if (Storage::exists($document->path)){
                $path = Storage::path($document->path);
                $content = file_get_contents($path);
                return response($content)->withHeaders([
                    'Content-Type' => mime_content_type($path)
                ]);
            }
        }
        return redirect('/404');
    }

    public function delete(string $id)
    {
        // Find Document
        $document = Document::findOrFail($id);

        // Delete From Storage
        Storage::delete($document->path);

        // Delete Reference in Database
        $document->delete();
    }


}
