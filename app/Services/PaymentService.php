<?php


namespace App\Services;


use App\Order;
use App\Payment;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Session;

class PaymentService extends BaseService
{
    public static function getVerify(Request $request, $id)
    {
        $cart = Session::has('cart') ? Session::get('cart') : null;

        $payment = new Payment($cart->totalPrice);
        $result = $payment->verifyPayment($request->Authority, $request->Status);

        if ($result) {

            $order = Order::findOrFail($id);
            $order->status = 1;
            $order->save();

            $newPayment = new Payment($cart->totalPrice);
            $newPayment->authority = $request->Authority;
            $newPayment->status = $request->Status;
            $newPayment->RefID = $result->RefID;
            $newPayment->order_id = $id;
            $newPayment->save();

            Session::forget('cart');
            Session::flash('success', 'پرداخت شما با موفقیت انجام شد');
            return redirect('/profile');

        } else {
            Session::flash('warning', 'در پرداخت شما خطایی به وجود آمده است لطفا مجددا تلاش کنید.');
            return redirect('/cart');
        }
    }
}