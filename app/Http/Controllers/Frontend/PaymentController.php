<?php

namespace App\Http\Controllers\Frontend;

use App\Order;
use App\Payment;
use App\Services\PaymentService;
use App\Services\ProductService;
use Illuminate\Http\Request;
use App\Http\Controllers\Controller;
use Illuminate\Support\Facades\Session;

class PaymentController extends Controller
{
    public function verify(Request $request, $id)
    {
          return PaymentService::getVerify($request,$id);
    }
}
