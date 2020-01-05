<?php

namespace App\Http\Controllers\Backend;

use App\Http\Controllers\Controller;
use App\Services\OrderBackService;

class OrderController extends Controller
{
    public function index()
    {
        return OrderBackService::getAllOrder();
    }
}
