<?php


namespace App\Services;

use App\Brand;
use App\Product;

class HomeService extends BaseService
{

    public static function getAll()
    {
        $brands = Brand::orderBy('created_at', 'desc')->limit(10)->get();
        $latestProduct = Product::orderBy('created_at', 'desc')->limit(10)->get();
        $favourites = Product::orderBy('created_at', 'asc')->limit(10)->get();
        return view('frontend.home.index', compact(['latestProduct', 'brands', 'favourites']));
    }
}
