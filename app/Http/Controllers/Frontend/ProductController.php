<?php

namespace App\Http\Controllers\Frontend;

use App\Http\Controllers\Controller;
use App\Services\ProductService;

class ProductController extends Controller
{
    public function getProduct($slug)
    {
      return ProductService::getAllProduct($slug);
    }

    public function getProductByCategory($id)
    {
      return ProductService::getProductCategory($id);
    }

    public function apiGetProduct($id)
    {
      return ProductService::apiGetAllProduct($id);
    }

    public function apiGetSortedProduct($id, $sort, $paginate)
    {
      return ProductService::apiGetSortAllProduct($id, $sort, $paginate);
    }

    public function apiGetCategoryAttributes($id)
    {
      return ProductService::apiGetCategoryAllAttributes($id);
    }

    public function apiGetFilterProducts($id,$sort, $paginate, $attributes)
    {
      return ProductService::apiGetFilterAllProducts($id,$sort,$paginate,$attributes);
    }
}
