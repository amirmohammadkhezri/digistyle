<?php

namespace App\Services;

use App\Address;


class AddressService extends BaseService
{
    public static function getaddress($id)
    {
        $address = Address::findOrfail($id)->get();
        
      
        
    
        return view('frontend.profile.address',compact('address'));
    }

}