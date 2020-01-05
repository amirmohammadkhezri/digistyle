<?php


namespace App\Services;


use App\Order;

class OrderBackService extends BaseService
{


    public static function getAllOrder()
    {

        $orders = Order::paginate(20);
        return view('admin.orders.index', compact(['orders']));
    }

    public function getOrderLists($id)
    {
        $order = Order::with('user.addresses.province', 'user.addresses.city', 'products.photos')->whereId($id)->first();

        return view('admin.orders.lists', compact(['order']));
    }
}