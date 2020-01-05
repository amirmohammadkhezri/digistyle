<!DOCTYPE html>
<html dir="rtl">
<head>
    <meta charset="UTF-8"/>
    <meta name="format-detection" content="telephone=no"/>
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
    <link href="/image/favicon.png" rel="icon"/>
    <title>نمونه کار خضری</title>
    <meta name="description" content="Responsive and clean html template design for any kind of ecommerce webshop">
    <!-- CSS Part Start-->
    <link rel="stylesheet" type="text/css" href="/js/bootstrap/css/bootstrap.min.css"/>
    <link rel="stylesheet" type="text/css" href="/js/bootstrap/css/bootstrap-rtl.min.css"/>
    <link rel="stylesheet" type="text/css" href="/css/font-awesome/css/font-awesome.min.css"/>
    <link rel="stylesheet" type="text/css" href="/css/stylesheet.css"/>
    <link rel="stylesheet" type="text/css" href="/css/owl.carousel.css"/>
    <link rel="stylesheet" type="text/css" href="/css/owl.transitions.css"/>
    <link rel="stylesheet" type="text/css" href="/css/responsive.css"/>
    <link rel="stylesheet" type="text/css" href="/css/stylesheet-rtl.css"/>
    <link rel="stylesheet" type="text/css" href="/css/responsive-rtl.css"/>
    <link rel="stylesheet" type="text/css" href="/css/stylesheet-skin2.css"/>
    <meta name="csrf-token" content="{{ csrf_token() }}">

    <!-- CSS Part End-->
</head>
<body>
<div class="wrapper-wide" id="app">
    <div id="header">
        <!-- Top Bar Start-->
        {{-- <nav id="top" class="htop">
            <div class="container">
                <div class="row"><span class="drop-icon visible-sm visible-xs"><i
                                class="fa fa-align-justify"></i></span>
                
                    <div id="top-links" class="nav pull-right flip">
                        
                    </div>
                </div>
            </div>
        </nav> --}}
        <!-- Top Bar End-->
        <!-- Header Start-->
        <header class="header-row">
            <div class="container">
                <div class="table-container">
                    <!-- Logo Start -->
                    <div class="col-table-cell col-lg-6 col-md-6 col-sm-12 col-xs-12 inner">
                        <div id="logo"><a href="{{url('/')}}"><img class="img-responsive" src="/image/logo.png"
                                                                   title="MarketShop" alt="MarketShop"/></a></div>
                    </div>
                    <!-- Logo End -->
                    <!-- Mini Cart Start-->
                    {{-- <div class="col-table-cell col-lg-3 col-md-3 col-sm-6 col-xs-12">
                        <div id="cart">
                            <button type="button" data-toggle="dropdown" data-loading-text="بارگذاری ..."
                                    class="heading dropdown-toggle">
                                <span class="cart-icon pull-left flip"></span>
                                <span id="cart-total">{{Session::has('cart') ? Session::get('cart')->totalQty . ' آیتم' : ''}} {{Session::has('cart') ? Session::get('cart')->totalPrice . ' تومان' : ''}}</span>
                            </button>
                            <ul class="dropdown-menu">
                                @if(Session::has('cart'))
                                    <li>
                                        <table class="table">
                                            @foreach(Session::get('cart')->items as $product)
                                                <tbody>
                                                <tr>
                                                    <td class="text-center" width="18%"><img class="img-thumbnail"
                                                                                             src="{{$product['item']->photos[0]->path}}">
                                                    </td>
                                                    <td class="text-left">{{$product['item']->title}}</td>
                                                    <td class="text-right">x {{$product['qty']}}</td>
                                                    <td class="text-right">{{$product['price']}} تومان</td>
                                                    <td class="text-center">
                                                        <button class="btn btn-danger btn-xs remove" title="حذف"
                                                                onclick="event.preventDefault();
                                                                        document.getElementById('remove-cart-item_{{$product['item']->id}}').submit();"
                                                                type="button"><i class="fa fa-times"></i></button>
                                                    </td>
                                                    <form id="remove-cart-item_{{$product['item']->id}}"
                                                          action="{{ route('cart.remove', ['id' => $product['item']->id]) }}"
                                                          method="post" style="display: none;">
                                                        @csrf
                                                    </form>
                                                </tr>

                                                </tbody>
                                            @endforeach
                                        </table>
                                    </li>
                                    <li>
                                        <div>
                                            <table class="table table-bordered">
                                                <tbody>
                                                <tr>
                                                    <td class="text-right"><strong>جمع کل</strong></td>
                                                    <td class="text-right">{{Session::get('cart')->totalPurePrice}}
                                                        تومان
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td class="text-right"><strong>تخفیف</strong></td>
                                                    <td class="text-right">{{Session::get('cart')->totalDiscountPrice}}
                                                        تومان
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td class="text-right"><strong>قابل پرداخت</strong></td>
                                                    <td class="text-right">{{Session::get('cart')->totalPrice}}تومان
                                                    </td>
                                                </tr>
                                                </tbody>
                                            </table>
                                            <p class="checkout"><a href="{{route('cart.cart')}}"
                                                                   class="btn btn-primary"><i
                                                            class="fa fa-shopping-cart"></i> مشاهده سبد</a>&nbsp;</p>

                                        </div>
                                    </li>

                                @else
                                    <p>سبد خرید شما خالی است.</p>
                                @endif
                            </ul>
                        </div>
                    </div> --}}
                    <!-- Mini Cart End-->
                    <!-- جستجو Start-->
                    <div class="col-table-cell col-lg-3 col-md-3 col-sm-6 col-xs-12 inner">
                        <div id="search" class="input-group">
                            <input id="filter_name" type="text" name="search" value="" placeholder="کالای مورد نظر خود را جستجو کنید"
                                   class="form-control input-lg"/>
                            <button type="button" class="button-search"><i class="fa fa-search"></i></button>
                        </div>
                    </div>
                    <!-- جستجو End-->
                </div>
            </div>
        </header>
        <!-- Header End-->
        <!-- Main آقایانu Start-->

        <nav id="menu" class="navbar">
            <div class="navbar-header"><span class="visible-xs visible-sm"> منو <b></b></span></div>
            <div class="container">
                <div class="collapse navbar-collapse navbar-ex1-collapse">
                    <ul class="nav navbar-nav">
                        <li><a class="home_link" title="خانه" href="{{url('/')}}">خانه</a></li>
                        <li class="dropdown"><a href="{{route('category.index', ['id' => 1])}}">آقایان</a>
                            <div class="dropdown-menu">
                                <ul>
                                    <li><a href="category.html">سویشرت و هودی</a>
                                    </li>
                                    <li><a href="category.html">پلیور</a></li>
                                    <li><a href="category.html">پیراهن</a>
                                    </li>
                                    <li><a href="category.html">شلوار جین</a></li>
                                    <li><a href="category.html">شلوارک</a></li>
                                    <li><a href="category.html">لباس زیر</a>

                                    </li>
                                </ul>
                            </div>
                        </li>

                        <li class="dropdown"><a href="{{route('category.index', ['id' => 2])}}">بانوان</a>
                            <div class="dropdown-menu">
                                <ul>
                                    <li><a href="category.html">شومیز و بلوز </a>
                                    </li>
                                    <li><a href="category.html">دامن</a></li>
                                    <li><a href="category.html">لباس بارداری</a>
                                    </li>
                                    <li><a href="category.html">شلوار اسپرت</a></li>


                                </ul>
                            </div>
                        </li>

                        <li class="dropdown"><a href="{{route('category.index', ['id' => 3])}}">دخترانه</a>
                            <div class="dropdown-menu">
                                <ul>
                                    <li><a href="category.html">لباس شنا</a>
                                    </li>
                                    <li><a href="category.html">لباس زیر</a></li>
                                    <li><a href="category.html">لباس راحتی</a>
                                    </li>
                                    <li><a href="category.html">پیراهن و تونیک</a></li>
                                    <li><a href="category.html">پلیور</a></li>

                                </ul>
                            </div>
                        </li>
                        <div id="top-links" class="col-table-cell col-lg-8 col-md-3 col-sm-6 col-xs-12">
                            @if(Auth::check())
                                <ul>
                                    <li><a href="{{route('logout')}}" onclick="event.preventDefault();
                                                document.getElementById('logout-form').submit();">خروج</a></li>
                                    <li><a href="{{route('user.profile')}}">پروفایل کاربری</a></li>
                                </ul>
                                <form id="logout-form" action="{{ route('logout') }}" method="post" style="display: none;">
                                    @csrf
                                </form>
                            @else
                                <ul>
                                    <li><a href="{{route('login')}}"><font color="#dddddd" style="cursor:pointer">ورود</font></a></li>
                                    <li><a href="{{route('register')}}"><font color="#dddddd" style="cursor:pointer">ثبت نام</font></a></li>
                                </ul>
                            @endif
                            
                        </div>
                        <div class="col-table-cell col-lg-1 col-md-3 col-sm-6 col-xs-12">
                        <div id="cart" class="">
                            <button colot="red" type="button" data-toggle="dropdown" data-loading-text="بارگذاری ..."
                                    class="heading dropdown-toggle">
                                    <font color="#9a21c0" style="cursor:pointer">سبد خرید</font>
                            </button>
                            <ul class="dropdown-menu">
                                @if(Session::has('cart'))
                                    <li>
                                        <table class="table">
                                            @foreach(Session::get('cart')->items as $product)
                                                <tbody>
                                                <tr>
                                                    <td class="text-center" width="18%"><img class="img-thumbnail"
                                                                                             src="{{$product['item']->photos[0]->path}}">
                                                    </td>
                                                    <td class="text-left">{{$product['item']->title}}</td>
                                                    <td class="text-right">x {{$product['qty']}}</td>
                                                    <td class="text-right">{{$product['price']}} تومان</td>
                                                    <td class="text-center">
                                                        <button class="btn btn-danger btn-xs remove" title="حذف"
                                                                onclick="event.preventDefault();
                                                                        document.getElementById('remove-cart-item_{{$product['item']->id}}').submit();"
                                                                type="button"><i class="fa fa-times"></i></button>
                                                    </td>
                                                    <form id="remove-cart-item_{{$product['item']->id}}"
                                                          action="{{ route('cart.remove', ['id' => $product['item']->id]) }}"
                                                          method="post" style="display: none;">
                                                        @csrf
                                                    </form>
                                                </tr>

                                                </tbody>
                                            @endforeach
                                        </table>
                                    </li>
                                    <li>
                                        <div>
                                            <table class="table table-bordered">
                                                <tbody>
                                                <tr>
                                                    <td class="text-right"><strong>جمع کل</strong></td>
                                                    <td class="text-right">{{Session::get('cart')->totalPurePrice}}
                                                        تومان
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td class="text-right"><strong>تخفیف</strong></td>
                                                    <td class="text-right">{{Session::get('cart')->totalDiscountPrice}}
                                                        تومان
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td class="text-right"><strong>قابل پرداخت</strong></td>
                                                    <td class="text-right">{{Session::get('cart')->totalPrice}}تومان
                                                    </td>
                                                </tr>
                                                </tbody>
                                            </table>
                                            <p class="checkout"><a href="{{route('cart.cart')}}"
                                                                   class="btn btn-primary"><i
                                                            class="fa fa-shopping-cart"></i> مشاهده سبد</a>&nbsp;</p>

                                        </div>
                                    </li>

                                @else
                                    <p>سبد خرید شما خالی است.</p>
                                @endif
                            </ul>
                        </div>
                        </div>
                    </ul>
                </div>
            </div>
        </nav>

        <!-- Main آقایانu End-->
    </div>
    <div id="container">

        <div class="container">
            @yield('content')
        </div>
    </div>

    <!--Footer Start-->
    <footer id="footer">
        <div class="fpart-first">
            <div class="container">
                <div class="row">
                    <div class="contact col-lg-4 col-md-4 col-sm-12 col-xs-12">
                        <h5><a href="about-us.html">درباره خضری
                            </a>
                        </h5>
                        <p> نوشتاری یا تصویری را در آن قرار دهید.</p>
                    </div>
                    <div class="column col-lg-2 col-md-2 col-sm-3 col-xs-12">
                        <h5>اطلاعات</h5>
                        <ul>
                            <li><a href="about-us.html">درباره ما</a></li>
                            <li><a href="about-us.html">اطلاعات 0 تومان</a></li>
                            <li><a href="about-us.html">حریم خصوصی</a></li>
                            <li><a href="about-us.html">شرایط و قوانین</a></li>
                        </ul>
                    </div>
                    <div class="column col-lg-2 col-md-2 col-sm-3 col-xs-12">
                        <h5>خدمات مشتریان</h5>
                        <ul>
                            <li><a href="contact-us.html">تماس با ما</a></li>
                            <li><a href="#">بازگشت</a></li>
                            <li><a href="sitemap.html">نقشه سایت</a></li>
                        </ul>
                    </div>
                    <div class="column col-lg-2 col-md-2 col-sm-3 col-xs-12">
                        <h5>امکانات جانبی</h5>
                        <ul>
                            <li><a href="#">برند ها</a></li>
                            <li><a href="#">کارت هدیه</a></li>
                            <li><a href="#">بازاریابی</a></li>
                            <li><a href="#">ویژه ها</a></li>
                        </ul>
                    </div>
                    <div class="column col-lg-2 col-md-2 col-sm-3 col-xs-12">
                        <h5>حساب من</h5>
                        <ul>
                            <li><a href="#">حساب کاربری</a></li>
                            <li><a href="#">تاریخچه سفارشات</a></li>
                            <li><a href="#">لیست علاقه مندی</a></li>
                            <li><a href="#">خبرنامه</a></li>
                        </ul>
                    </div>
                </div>
            </div>
        </div>
        <div class="fpart-second">
            {{-- footer --}}
        </div>
        <div id="back-top"><a data-toggle="tooltip" title="بازگشت به بالا" href="javascript:void(0)"
                              class="backtotop"><i class="fa fa-chevron-up"></i></a></div>
    </footer>
    <!--Footer End-->

</div>
@yield('script-vuejs')

<!-- JS Part Start-->
<script type="text/javascript" src="/js/jquery-2.1.1.min.js"></script>
<script type="text/javascript" src="/js/bootstrap/js/bootstrap.min.js"></script>
<script type="text/javascript" src="/js/jquery.easing-1.3.min.js"></script>
<script type="text/javascript" src="/js/jquery.dcjqaccordion.min.js"></script>
<script type="text/javascript" src="/js/owl.carousel.min.js"></script>
<script type="text/javascript" src="/js/jquery.elevateZoom-3.0.8.min.js"></script>
<script type="text/javascript" src="/js/swipebox/lib/ios-orientationchange-fix.js"></script>
<script type="text/javascript" src="/js/swipebox/src/js/jquery.swipebox.min.js"></script>
<script type="text/javascript" src="/js/custom.js"></script>
<!-- JS Part End-->
@yield('script')

</body>
</html>