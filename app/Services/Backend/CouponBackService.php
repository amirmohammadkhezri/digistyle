<?php


namespace App\Services\Backend;


use App\Coupon;
use App\Services\BaseService;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Session;

class CouponBackService extends BaseService
{

    public static function getAllCoupons()
    {
        $coupons = Coupon::all();
        return view('admin.coupons.index', compact(['coupons']));
    }

    public static function storeCoupon(Request $request)
    {
        $coupon = new Coupon();
        $coupon->title = $request->title;
        $coupon->code = $request->code;
        $coupon->price = $request->price;
        $coupon->status = $request->status;

        $coupon->save();

        Session::flash('success', 'کد تخفیف با موفقیت ایجاد شد.');
        return redirect('/administrator/coupons');
    }

    public static function editCoupon(int $id)
    {
        $coupon = Coupon::findOrFail($id);

        return view('admin.coupons.edit', compact(['coupon']));
    }

    public static function updateCoupon(Request $request, int $id)
    {
        $coupon = Coupon::findOrFail($id);
        $coupon->title = $request->title;
        $coupon->code = $request->code;
        $coupon->price = $request->price;
        $coupon->status = $request->status;

        $coupon->save();

        Session::flash('success', 'کد تخفیف با موفقیت ویرایش شد.');
        return redirect('/administrator/coupons');
    }

    public static function deleteCoupon(int $id)
    {
        $coupon = Coupon::findOrFail($id);
        $coupon->delete();

        Session::flash('error', 'کد تخفیف با موفقیت حذف شد.');
        return redirect('/administrator/coupons');
    }
}