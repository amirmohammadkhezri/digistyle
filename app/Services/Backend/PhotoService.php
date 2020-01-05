<?php


namespace App\Services\Backend;


use App\Photo;
use App\Services\BaseService;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Storage;

class PhotoService extends BaseService
{

    public static function uploadPhoto(Request $request)
    {

        $uploadedFile = $request->file('file');
        $filename = time() . $uploadedFile->getClientOriginalName();
        $original_name = $uploadedFile->getClientOriginalName();

        Storage::disk('local')->putFileAs(
            'public/photos', $uploadedFile, $filename
        );

        $photo = new Photo();
        $photo->original_name = $original_name;
        $photo->path = $filename;
        $photo->user_id = 1;

        $photo->save();

        return response()->json([
            'photo_id' => $photo->id
        ]);
    }
}