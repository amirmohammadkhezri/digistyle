@extends('frontend.layout.master')

@section('content')
    <div class="container">
        @if(Session::has('success'))
            <div class="alert alert-success">
                <div>{{session('success')}}</div>
            </div>
        @endif

        <div class="row">
            <aside id="column-right" class="col-sm-3 hidden-xs">
                <h3 class="subtitle">حساب کاربری</h3>
                <div class="list-group">
                    <ul class="list-item">
                        <li><a href="#">لیست آدرس ها</a></li>
                        <li><a href="wishlist.html">لیست علاقه مندی</a></li>
                        <li><a href="{{route('profile.orders')}}">تاریخچه سفارشات</a></li>
                        <li><a href="#">دانلود ها</a></li>
                        <li><a href="#">امتیازات خرید</a></li>
                        <li><a href="#">بازگشت</a></li>
                        <li><a href="#">تراکنش ها</a></li>
                        <li><a href="#">خبرنامه</a></li>
                        <li><a href="#">پرداخت های تکرار شونده</a></li>
                    </ul>
                </div>
            </aside>
            <!--Middle Part Start-->
            <div id="content" class="col-sm-9">
                <div class="table-responsive">
                    <table class="table no-margin">
                        <thead>
                        <tr>
                            <th class="text-center">تصویر محصول</th>
                            <th class="text-center">نام محصول</th>
                            <th class="text-center">کد محصول</th>
                            <th class="text-center">تعداد</th>
                        </tr>
                        </thead>
                        <tbody>
                        @foreach($order->products as $product)
                            <tr>
                                <td class="text-center"><img width="25%" src="{{$product->photos[0]->path}}"> </td>
                                <td class="text-center">{{$product->title}}</td>
                                <td class="text-center">{{$product->sku}}</td>
                                <td class="text-center">{{$product->pivot->qty}}</td>
                            </tr>
                        @endforeach
                        </tbody>
                    </table>
                </div>
                <div class="customer-data">
                    <p style="margin-top: 20px">
                        <strongt>نام خریدار: </strongt> {{$order->user->name . ' ' . $order->user->last_name}}
                    </p>
                    <p>
                        <strongt>آدرس خریدار: </strongt> {{$order->user->addresses[0]->province->name . ' ' . $order->user->addresses[0]->city->name . ' ' . $order->user->addresses[0]->address}}
                        <strongt>کد پستی خریدار: </strongt> {{$order->user->addresses[0]->post_code}}
                    </p>
                    <p>
                        <strongt>شماره موبایل خریدار: </strongt> {{$order->user->phone}}
                    </p>
                </div>
            </div>
            <!--Middle Part End -->
        </div>
    </div>
@endsection
