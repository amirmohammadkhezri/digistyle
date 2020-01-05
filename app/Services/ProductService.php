<?php


namespace App\Services;


use App\AttributeGroup;
use App\Category;
use App\Product;

class ProductService extends BaseService
{

    public static function getAllProduct($slug)
    {
        $product = Product::with(['photos', 'attributeValues.attributeGroup', 'brand', 'categories'])->whereSlug($slug)->first();
        $relatedProducts = Product::with('categories')->whereHas('categories', function ($q) use ($product) {
            $q->whereIn('id', $product->categories);
        })->get();
        return view('frontend.products.index', compact(['product', 'relatedProducts']));
    }

    public static function getProductCategory($id)
    {

        $category = Category::whereId($id)->first();
        return view('frontend.categories.index', compact(['category']));
    }

    public static function apiGetAllProduct($id)
    {
        $products = Product::with('photos')->whereHas('categories', function ($q) use ($id) {
            $q->where('id', $id);
        })->paginate(3);
        $response = [
            'products' => $products
        ];
        return response()->json($response, 200);
    }

    public static function apiGetSortAllProduct($id, $sort, $paginate)
    {
        $products = Product::with('photos')->whereHas('categories', function ($q) use ($id) {
            $q->where('id', $id);
        })
            ->orderBy('price', $sort)
            ->paginate($paginate);
        $response = [
            'products' => $products
        ];
        return response()->json($response, 200);
    }

    public static function apiGetCategoryAllAttributes($id)
    {
        $attributeGroups = AttributeGroup::with('attributesValue')
            ->whereHas('categories', function ($q) use ($id) {
                $q->where('category_id', $id);
            })
            ->get();
        $response = [
            'attributeGroups' => $attributeGroups
        ];
        return response()->json($response, 200);
    }

    public static function apiGetFilterAllProducts($id, $sort, $paginate, $attributes)
    {
        $attributesArray = json_decode($attributes, true);
        $products = Product::with('photos')
            ->whereHas('categories', function ($q) use ($id) {
                $q->where('id', $id);
            })
            ->whereHas('attributeValues', function ($q) use ($attributesArray) {
                $q->whereIn('attributeValue_id', $attributesArray);
            })
            ->orderBy('price', $sort)
            ->paginate($paginate);

        $response = [
            'products' => $products
        ];
        return response()->json($response, 200);
    }
}