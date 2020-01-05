<?php


namespace App\Services;


use App\Address;
use App\User;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Hash;
use Illuminate\Support\Facades\Session;


class UserService extends BaseService
{
    public static function registerUser(Request $request)
    {
        $user = new User();
        $user->name = $request->input('name');
        $user->last_name = $request->input('last_name');
        $user->national_code = $request->input('national_code');
        $user->phone = $request->input('phone');
        $user->email = $request->input('email');
        $user->password = Hash::make($request->input('password'));
        $user->save();

        $address = new Address();
        $address->address = $request->input('address');
        $address->company = $request->input('company');
        $address->province_id = $request->input('province_id');
        $address->city_id = $request->input('city_id');
        $address->post_code = $request->input('post_code');
        $address->user_id = 1;
        $address->save();

        Session::flash('success', 'ثبت نام شما با موفقیت انجام شد. لطفا حساب کاربری خود را تایید کنید');
        return redirect('/login');
    }
}