<?php


namespace App\Services\Backend;


use App\Brand;
use App\Product;
use App\Services\BaseService;

class ProductBackService extends BaseService
{

    public static function getAllProduct()
    {
        $products = Product::paginate(10);
        return view('admin.products.index', compact('products'));
    }

    public static function createProduct()
    {
        //        $categories = Category::with('childrenRecursive')->where('parent_id', null)->get();
        $brands = Brand::all();
        return view('admin.products.create', compact(['brands']));
    }

}