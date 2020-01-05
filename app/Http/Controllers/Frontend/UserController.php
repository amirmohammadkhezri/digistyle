<?php

namespace App\Http\Controllers\Frontend;

use App\Http\Controllers\Controller;
use App\Services\UserService;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;

class UserController extends Controller
{
    public function register(Request $request)
    {
        return UserService::registerUser($request);
    }

    public function profile()
    {
        $user = Auth::user();
        return view('frontend.profile.index', compact(['user']));
    }
}
