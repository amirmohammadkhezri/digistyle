<?php

namespace App\Http\Controllers\Frontend;

use App\Order;
use App\Payment;
use App\Services\OrderFrontService;
use Illuminate\Http\Request;
use App\Http\Controllers\Controller;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\Session;


class OrderController extends Controller
{
    public function verify()
    {
        return OrderFrontService::verified();
    }
    public function index()
    {
      return OrderFrontService::getAllOrder();
    }
    public function getOrderLists($id)
    {
        return OrderFrontService::allOrderList($id);
    }
}
