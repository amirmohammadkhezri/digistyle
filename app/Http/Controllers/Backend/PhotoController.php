<?php

namespace App\Http\Controllers\Backend;

use App\Photo;
use App\Services\Backend\PhotoService;
use Illuminate\Http\Request;
use Illuminate\Http\Response;
use Illuminate\Support\Facades\Storage;
use App\Http\Controllers\Controller;

class PhotoController extends Controller
{
    /**
     * Store a newly created resource in storage.
     *
     * @param Request $request
     * @return Response
     */
    public function upload(Request $request)
    {
        return PhotoService::uploadPhoto($request);
    }
}
