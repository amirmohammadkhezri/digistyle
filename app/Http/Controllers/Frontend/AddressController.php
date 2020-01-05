<?php

namespace App\Http\Controllers\Frontend;
use App\Http\Controllers\Controller;

use App\Services\AddressService;

class AddressController extends Controller
{
    public function index($id)
    {
     return AddressService::getaddress($id);
    }
}
