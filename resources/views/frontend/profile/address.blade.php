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
                                
                            </tr>
                            </thead>
                            <tbody>
                            @foreach($address as $you)
                            
                                <tr>
                                    {{-- <td class="text-center"><a href="{{route('profile.orders.lists', ['id'=>$addres->id])}}">{{$addres->id}}</a></td> --}}
                                    <td class="text-center">{{$you->address}}</td>
                                   
                                    
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
