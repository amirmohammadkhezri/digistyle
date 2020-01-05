<?php


namespace App\Services;


use App\Cart;
use App\Coupon;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\Session;

class CouponService extends BaseService
{

    public static function addtoCoupon(Request $request)
    {
        $check = Auth::user()->whereHas('coupons', function ($q) use ($request) {
            $q->where('code', $request->code);
        })->exists();
        if (!$check) {
            $coupon = Coupon::where('code', $request->code)->first();
            $cart = Session::has('cart') ? Session::get('cart') : null;
            $cart = new Cart($cart);
            $cart->addCoupon($coupon);
            $request->session()->put('cart', $cart);

            $user = Auth::user();
            $user->coupons()->attach($coupon->id);
            $user->save();

            return back();
        } else {
            Session::flash('warning', 'شما قبلا از این کد تخفیف استفاده کرده اید');
            return back();
        }
    }
}