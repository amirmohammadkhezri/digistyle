<?php

namespace App\Http\Controllers\Frontend;

use App\Cart;
use App\Product;
use App\Services\CartService;
use Illuminate\Http\Request;
use App\Http\Controllers\Controller;
use Illuminate\Support\Facades\Session;

class CartController extends Controller
{
    public function addToCart(Request $request, $id)
    {
      return CartService::addcard($request ,$id);
    }

    public function removeItem(Request $request, $id)
    {
      return CartService::removecard($request ,$id);
    }

    public function getCart()
    {
      $cart = Session::has('cart') ? Session::get('cart') : null;
      return view('frontend.cart.index', compact(['cart']));
    }
}
