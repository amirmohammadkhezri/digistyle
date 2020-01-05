@extends('frontend.layout.master')


@section('content')
    <div class="row">
        <!--Middle Part Start-->
        <div id="content" class="col-xs-12">
            <!-- Slideshow Start-->
            <div class="slideshow single-slider owl-carousel">
                <div class="item"> <a href="#"><img class="img-responsive" src="image/slider/slider1.jpg" alt="banner 2" /></a> </div>
                <div class="item"> <a href="#"><img class="img-responsive" src="image/slider/slider2.jpg" alt="banner 2" /></a> </div>
                <div class="item"> <a href="#"><img class="img-responsive" src="image/slider/slider3.jpg" alt="banner 2" /></a> </div>
                <div class="item"> <a href="#"><img class="img-responsive" src="image/slider/slider4.jpg" alt="banner 1" /></a> </div>
            </div>
            <!-- Slideshow End-->

            <!-- Banner End-->
            <!-- محصولات Tab Start -->
            <div id="product-tab" class="product-tab">
                <ul id="tabs" class="tabs">
                    <li><a href="#tab-latest">جدیدترین</a></li>
                </ul>
                <div id="tab-latest" class="tab_content">
                    <div class="owl-carousel product_carousel_tab">
                        @foreach($latestProduct as $product)
                            <div class="product-thumb clearfix">
                                <div class="image"><a href="{{route('product.single', ['slug'=> $product->slug])}}"><img src="{{$product->photos[0]->path}}" alt="تی شرت کتان مردانه" title="تی شرت کتان مردانه" class="img-responsive" /></a></div>
                                <div class="caption">
                                    <h4><a href="{{route('product.single', ['slug'=> $product->slug])}}">{{$product->title}}</a></h4>
                                    @if($product->discount_price)
                                        <p class="price"><span class="price-new">{{$product->discount_price}} تومان</span> <span class="price-old">{{$product->price}} تومان</span><span class="saving">{{round(abs(($product->price-$product->discount_price)/$product->price * 100))}}%</span></p>
                                    @else
                                        <p class="price"> {{$product->price}} تومان </p>
                                    @endif
                                </div>
                                <div class="button-group">
                                    <a class="btn-primary" href="{{route('cart.add', ['id' => $product->id])}}" ><span>افزودن به سبد</span></a>
                                </div>
                            </div>
                        @endforeach
                    </div>
                </div>
            </div>
            {{-- view count product --}}
            <div id="favourite-tab" class="product-tab">
                <ul class="tabs">
                    <li><a href="#tab-latest">پربازدید ترین ها</a></li>
                </ul>
                <div class="tab_content">
                    <div class="owl-carousel latest_category_carousel">
                        @foreach($favourites as $favourite)
                            <div class="product-thumb clearfix">
                                <div class="image"><a href="{{route('product.single', ['slug'=> $favourite->slug])}}"><img src="{{$favourite->photos[0]->path}}" alt="تی شرت کتان مردانه" title="تی شرت کتان مردانه" class="img-responsive" /></a></div>
                                <div class="caption">
                                    <h4><a href="{{route('product.single', ['slug'=> $favourite->slug])}}">{{$favourite->title}}</a></h4>
                                    @if($favourite->discount_price)
                                        <p class="price"><span class="price-new">{{$favourite->discount_price}} تومان</span> <span class="price-old">{{$favourite->price}} تومان</span><span class="saving">{{round(abs(($favourite->price-$favourite->discount_price)/$favourite->price * 100))}}%</span></p>
                                    @else
                                        <p class="price"> {{$favourite->price}} تومان </p>
                                    @endif
                                </div>
                                <div class="button-group">
                                    <a class="btn-primary" href="{{route('cart.add', ['id' => $favourite->id])}}" ><span>افزودن به سبد</span></a>
                                </div>
                            </div>
                        @endforeach
                    </div>
                </div>
            </div>
            {{-- end view count product --}}

            <!-- دسته ها محصولات Slider Start-->
            
            <!-- دسته ها محصولات Slider End-->

            <!-- دسته ها محصولات Slider Start -->
            {{-- <h3 class="subtitle">البسه - <a class="viewall" href="category.html">نمایش همه</a></h3>
            <div class="owl-carousel latest_category_carousel">
                <div class="product-thumb">
                    <div class="image"><a href="product.html"><img src="image/product/iphone_6-220x330.jpg" alt="کرم مو آقایان" title="کرم مو آقایان" class="img-responsive" /></a></div>
                    <div class="caption">
                        <h4><a href="product.html">کرم مو آقایان</a></h4>
                        <p class="price"> 42300 تومان </p>
                        <div class="rating"> <span class="fa fa-stack"><i class="fa fa-star fa-stack-2x"></i><i class="fa fa-star-o fa-stack-2x"></i></span> <span class="fa fa-stack"><i class="fa fa-star fa-stack-2x"></i><i class="fa fa-star-o fa-stack-2x"></i></span> <span class="fa fa-stack"><i class="fa fa-star fa-stack-2x"></i><i class="fa fa-star-o fa-stack-2x"></i></span> <span class="fa fa-stack"><i class="fa fa-star fa-stack-2x"></i><i class="fa fa-star-o fa-stack-2x"></i></span> <span class="fa fa-stack"><i class="fa fa-star fa-stack-2x"></i><i class="fa fa-star-o fa-stack-2x"></i></span> </div>
                    </div>
                    <div class="button-group">
                        <button class="btn-primary" type="button" onClick=""><span>افزودن به سبد</span></button>
                        <div class="add-to-links">
                            <button type="button" data-toggle="tooltip" title="افزودن به علاقه مندی" onClick=""><i class="fa fa-heart"></i></button>
                            <button type="button" data-toggle="tooltip" title="افزودن به مقایسه" onClick=""><i class="fa fa-exchange"></i></button>
                        </div>
                    </div>
                </div>
                <div class="product-thumb">
                    <div class="image"><a href="product.html"><img src="image/product/nikon_d300_5-220x330.jpg" alt="محصولات مراقبت از مو" title="محصولات مراقبت از مو" class="img-responsive" /></a></div>
                    <div class="caption">
                        <h4><a href="product.html">محصولات مراقبت از مو</a></h4>
                        <p class="price"> <span class="price-new">66000 تومان</span> <span class="price-old">90000 تومان</span> <span class="saving">-27%</span> </p>
                        <div class="rating"> <span class="fa fa-stack"><i class="fa fa-star fa-stack-2x"></i><i class="fa fa-star-o fa-stack-2x"></i></span> <span class="fa fa-stack"><i class="fa fa-star-o fa-stack-2x"></i></span> <span class="fa fa-stack"><i class="fa fa-star-o fa-stack-2x"></i></span> <span class="fa fa-stack"><i class="fa fa-star-o fa-stack-2x"></i></span> <span class="fa fa-stack"><i class="fa fa-star-o fa-stack-2x"></i></span> </div>
                    </div>
                    <div class="button-group">
                        <button class="btn-primary" type="button" onClick=""><span>افزودن به سبد</span></button>
                        <div class="add-to-links">
                            <button type="button" data-toggle="tooltip" title="افزودن به علاقه مندی" onClick=""><i class="fa fa-heart"></i></button>
                            <button type="button" data-toggle="tooltip" title="افزودن به مقایسه" onClick=""><i class="fa fa-exchange"></i></button>
                        </div>
                    </div>
                </div>
                <div class="product-thumb">
                    <div class="image"><a href="product.html"><img src="image/product/nikon_d300_4-220x330.jpg" alt="کرم لخت کننده مو" title="کرم لخت کننده مو" class="img-responsive" /></a></div>
                    <div class="caption">
                        <h4><a href="product.html">کرم لخت کننده مو</a></h4>
                        <p class="price"> 88000 تومان </p>
                    </div>
                    <div class="button-group">
                        <button class="btn-primary" type="button" onClick=""><span>افزودن به سبد</span></button>
                        <div class="add-to-links">
                            <button type="button" data-toggle="tooltip" title="افزودن به علاقه مندی" onClick=""><i class="fa fa-heart"></i></button>
                            <button type="button" data-toggle="tooltip" title="افزودن به مقایسه" onClick=""><i class="fa fa-exchange"></i></button>
                        </div>
                    </div>
                </div>
                <div class="product-thumb">
                    <div class="image"><a href=""><img src="image/product/macbook_5-220x330.jpg" alt="ژل حمام بانوان" title="ژل حمام بانوان" class="img-responsive" /></a></div>
                    <div class="caption">
                        <h4><a href="product.html">ژل حمام بانوان</a></h4>
                        <p class="price"> <span class="price-new">19500 تومان</span> <span class="price-old">21900 تومان</span> <span class="saving">-4%</span> </p>
                    </div>
                    <div class="button-group">
                        <button class="btn-primary" type="button" onClick="cart.add('61');"><span>افزودن به سبد</span></button>
                        <div class="add-to-links">
                            <button type="button" data-toggle="tooltip" title="افزودن به علاقه مندی" onClick="wishlist.add('61');"><i class="fa fa-heart"></i></button>
                            <button type="button" data-toggle="tooltip" title="افزودن به مقایسه" onClick="compare.add('61');"><i class="fa fa-exchange"></i></button>
                        </div>
                    </div>
                </div>
                <div class="product-thumb">
                    <div class="image"><a href="product.html"><img src="image/product/macbook_4-220x330.jpg" alt="عطر گوچی" title="عطر گوچی" class="img-responsive" /></a></div>
                    <div class="caption">
                        <h4><a href="product.html">عطر گوچی</a></h4>
                        <p class="price"> 85000 تومان </p>
                        <div class="rating"> <span class="fa fa-stack"><i class="fa fa-star fa-stack-2x"></i><i class="fa fa-star-o fa-stack-2x"></i></span> <span class="fa fa-stack"><i class="fa fa-star fa-stack-2x"></i><i class="fa fa-star-o fa-stack-2x"></i></span> <span class="fa fa-stack"><i class="fa fa-star fa-stack-2x"></i><i class="fa fa-star-o fa-stack-2x"></i></span> <span class="fa fa-stack"><i class="fa fa-star fa-stack-2x"></i><i class="fa fa-star-o fa-stack-2x"></i></span> <span class="fa fa-stack"><i class="fa fa-star fa-stack-2x"></i><i class="fa fa-star-o fa-stack-2x"></i></span> </div>
                    </div>
                    <div class="button-group">
                        <button class="btn-primary" type="button" onClick=""><span>افزودن به سبد</span></button>
                        <div class="add-to-links">
                            <button type="button" data-toggle="tooltip" title="افزودن به علاقه مندی" onClick=""><i class="fa fa-heart"></i></button>
                            <button type="button" data-toggle="tooltip" title="افزودن به مقایسه" onClick=""><i class="fa fa-exchange"></i></button>
                        </div>
                    </div>
                </div>
                <div class="product-thumb">
                    <div class="image"><a href="product.html"><img src="image/product/macbook_3-220x330.jpg" alt="رژ لب گارنیر" title="رژ لب گارنیر" class="img-responsive" /></a></div>
                    <div class="caption">
                        <h4><a href="product.html">رژ لب گارنیر</a></h4>
                        <p class="price"> 123000 تومان </p>
                    </div>
                    <div class="button-group">
                        <button class="btn-primary" type="button" onClick=""><span>افزودن به سبد</span></button>
                        <div class="add-to-links">
                            <button type="button" data-toggle="tooltip" title="افزودن به علاقه مندی" onClick=""><i class="fa fa-heart"></i></button>
                            <button type="button" data-toggle="tooltip" title="افزودن به مقایسه" onClick=""><i class="fa fa-exchange"></i></button>
                        </div>
                    </div>
                </div>
                <div class="product-thumb">
                    <div class="image"><a href="product.html"><img src="image/product/macbook_2-220x330.jpg" alt="عطر نینا ریچی" title="عطر نینا ریچی" class="img-responsive" /></a></div>
                    <div class="caption">
                        <h4><a href="product.html">عطر نینا ریچی</a></h4>
                        <p class="price"> 110000 تومان </p>
                    </div>
                    <div class="button-group">
                        <button class="btn-primary" type="button" onClick=""><span>افزودن به سبد</span></button>
                        <div class="add-to-links">
                            <button type="button" data-toggle="tooltip" title="افزودن به علاقه مندی" onClick=""><i class="fa fa-heart"></i></button>
                            <button type="button" data-toggle="tooltip" title="افزودن به مقایسه" onClick=""><i class="fa fa-exchange"></i></button>
                        </div>
                    </div>
                </div>
            </div> --}}
            <!-- دسته ها محصولات Slider End -->
                <!-- Banner Start -->
                <div class="marketshop-banner">
                    <div class="row">
                        <div class="col-lg-6 col-md-6 col-sm-6 col-xs-12"><a href="#"><img src="image/banner/sample-banner-4-600x250.jpg" alt="2 Block Banner" title="2 Block Banner" /></a></div>
                        <div class="col-lg-6 col-md-6 col-sm-6 col-xs-12"><a href="#"><img src="image/banner/sample-banner-5-600x250.jpg" alt="2 Block Banner 1" title="2 Block Banner 1" /></a></div>
                    </div>
                </div>
                <!-- Banner End -->
            <!-- برند Logo Carousel Start-->
            <div id="carousel" class="owl-carousel nxt">
                @foreach($brands as $brand)
                    <div class="item text-center" style="padding: 10px;"> <a href="#"><img src="{{$brand->photo->path}}" alt="پالم" class="img-responsive" /></a> </div>
                @endForeach
            </div>
            <!-- برند Logo Carousel End -->
        </div>
        <!--Middle Part End-->
    </div>
@endsection