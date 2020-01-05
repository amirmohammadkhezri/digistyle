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
                        <li><a href="{{route('profile.orders')}}">تاریخچه سفارشات</a></li>
                    </ul>
                </div>
            </aside>
            <!--Middle Part Start-->
            <div id="content" class="col-sm-9">
                <div class="alert alert-success">
                    <div class="table-responsive">
                        <table class="table no-margin">
                            <thead>
                            <tr>
                                <th class="text-center">شناسه</th>
                                <th class="text-center">مقدار</th>
                                <th class="text-center">وضعیت</th>

                            </tr>
                            </thead>
                            <tbody>
                            @foreach($orders as $order)
                                <tr>
                                    <td class="text-center"><a href="{{route('profile.orders.lists', ['id'=>$order->id])}}">{{$order->id}}</a></td>
                                    <td class="text-center">{{$order->amount}}</td>
                                    @if($order->status == 0)
                                        <td class="text-center"><span class="label label-danger">پرداخت نشده</span></td>
                                    @else
                                        <td class="text-center"><span class="label label-success">پرداخت شده</span></td>
                                    @endif
                                </tr>
                            @endforeach
                            </tbody>
                        </table>
                    </div>
                </div>
            </div>
            <!--Middle Part End -->
        </div>
    </div>
@endsection
