<template>
  <div>
    <!--Left Part Start -->
    <aside id="column-left" class="col-sm-3 hidden-xs">
      <h3 class="subtitle">فیلتر</h3>
      <div class="box-category">
        <div class="form-group" v-for="(attributeGroup, index) in attributeGroups">
          <label>{{attributeGroup.title}}</label>
          <select class="form-control" @change="addFilter($event, index)">
            <option>انتخاب کنید...</option>
            <option v-for="attributeValue in attributeGroup.attributes_value" :value="attributeValue.id">{{attributeValue.title}}</option>
          </select>
        </div>
        <div class="form-group" style="text-align: left">
          <button type="submit" class="btn btn-danger" @click="getFilterProduct()">اعمال فیلتر</button>
        </div>
      </div>

      <h3 class="subtitle">دسته ها</h3>
      <div class="box-category">
        <ul id="cat_accordion">
          <li><a href="category.html">مد و زیبایی</a> <span class="down"></span>
            <ul>
              <li><a href="category.html">آقایان</a> <span class="down"></span>
                <ul>
                  <li><a href="category.html">زیردسته ها</a></li>
                  <li><a href="category.html">زیردسته ها</a></li>
                  <li><a href="category.html">زیردسته ها</a></li>
                  <li><a href="category.html">زیردسته ها</a></li>
                  <li><a href="category.html">زیردسته جدید</a></li>
                </ul>
              </li>
              <li><a href="category.html">بانوان</a></li>
              <li><a href="category.html">دخترانه</a> <span class="down"></span>
                <ul>
                  <li><a href="category.html">زیردسته ها</a></li>
                  <li><a href="category.html">زیردسته جدید</a></li>
                  <li><a href="category.html">زیردسته جدید</a></li>
                </ul>
              </li>
              <li><a href="category.html">پسرانه</a></li>
              <li><a href="category.html">نوزاد</a></li>
              <li><a href="category.html">لوازم</a> <span class="down"></span>
                <ul>
                  <li><a href="category.html">زیردسته های جدید</a></li>
                </ul>
              </li>
            </ul>
          </li>
          <li><a class="active" href="category.html">الکترونیکی</a> <span class="down"></span>
            <ul style="display:block;">
              <li><a href="category.html">لپ تاپ</a> <span class="down"></span>
                <ul>
                  <li><a href="category.html">زیردسته های جدید</a></li>
                  <li><a href="category.html">زیردسته های جدید</a></li>
                  <li><a href="category.html">زیردسته جدید</a></li>
                </ul>
              </li>
              <li><a href="category.html">رومیزی</a> <span class="down"></span>
                <ul>
                  <li><a href="category.html">زیردسته های جدید</a></li>
                  <li><a href="category.html">زیردسته جدید</a></li>
                  <li><a href="category.html">زیردسته جدید</a></li>
                </ul>
              </li>
              <li><a href="category.html">دوربین</a> <span class="down"></span>
                <ul>
                  <li><a href="category.html">زیردسته های جدید</a></li>
                </ul>
              </li>
              <li><a href="category.html">موبایل و تبلت</a> <span class="down"></span>
                <ul>
                  <li><a href="category.html">زیردسته های جدید</a></li>
                  <li><a href="category.html">زیردسته های جدید</a></li>
                </ul>
              </li>
              <li><a href="category.html">صوتی و تصویری</a> <span class="down"></span>
                <ul>
                  <li><a href="category.html">زیردسته های جدید</a></li>
                  <li><a href="category.html">زیردسته جدید</a></li>
                </ul>
              </li>
              <li><a href="category.html">لوازم خانگی</a></li>
            </ul>
          </li>
          <li><a href="category.html">کفش</a> <span class="down"></span>
            <ul>
              <li><a href="category.html">آقایان</a></li>
              <li><a href="category.html">بانوان</a> <span class="down"></span>
                <ul>
                  <li><a href="category.html">زیردسته های جدید</a></li>
                  <li><a href="category.html">زیردسته ها</a></li>
                </ul>
              </li>
              <li><a href="category.html">دخترانه</a></li>
              <li><a href="category.html">پسرانه</a></li>
              <li><a href="category.html">نوزاد</a></li>
              <li><a href="category.html">لوازم</a><span class="down"></span>
                <ul>
                  <li><a href="category.html">زیردسته های جدید</a></li>
                  <li><a href="category.html">زیردسته های جدید</a></li>
                  <li><a href="category.html">زیردسته ها</a></li>
                </ul>
              </li>
            </ul>
          </li>
          <li><a href="category.html">ساعت</a> <span class="down"></span>
            <ul>
              <li><a href="category.html">ساعت مردانه</a></li>
              <li><a href="category.html">ساعت زنانه</a></li>
              <li><a href="category.html">ساعت بچگانه</a></li>
              <li><a href="category.html">لوازم</a></li>
            </ul>
          </li>
          <li><a href="category.html">زیبایی و سلامت</a> <span class="down"></span>
            <ul>
              <li><a href="category.html">عطر و ادکلن</a></li>
              <li><a href="category.html">آرایشی</a></li>
              <li><a href="category.html">ضد آفتاب</a></li>
              <li><a href="category.html">مراقبت از پوست</a></li>
              <li><a href="category.html">مراقبت از چشم</a></li>
              <li><a href="category.html">مراقبت از مو</a></li>
            </ul>
          </li>
        </ul>
      </div>
      <h3 class="subtitle">پرفروش ها</h3>
      <div class="side-item">
        <div class="product-thumb clearfix">
          <div class="image"><a href="product.html"><img src="/image/product/apple_cinema_30-50x75.jpg" alt="تی شرت کتان مردانه" title="تی شرت کتان مردانه" class="img-responsive" /></a></div>
          <div class="caption">
            <h4><a href="product.html">تی شرت کتان مردانه</a></h4>
            <p class="price"><span class="price-new">110000 تومان</span> <span class="price-old">122000 تومان</span> <span class="saving">-10%</span></p>
          </div>
        </div>
        <div class="product-thumb clearfix">
          <div class="image"><a href="product.html"><img src="/image/product/iphone_1-50x75.jpg" alt="آیفون 7" title="آیفون 7" class="img-responsive" /></a></div>
          <div class="caption">
            <h4><a href="product.html">آیفون 7</a></h4>
            <p class="price"> 2200000 تومان </p>
            <div class="rating"> <span class="fa fa-stack"><i class="fa fa-star fa-stack-2x"></i><i class="fa fa-star-o fa-stack-2x"></i></span> <span class="fa fa-stack"><i class="fa fa-star fa-stack-2x"></i><i class="fa fa-star-o fa-stack-2x"></i></span> <span class="fa fa-stack"><i class="fa fa-star fa-stack-2x"></i><i class="fa fa-star-o fa-stack-2x"></i></span> <span class="fa fa-stack"><i class="fa fa-star fa-stack-2x"></i><i class="fa fa-star-o fa-stack-2x"></i></span> <span class="fa fa-stack"><i class="fa fa-star-o fa-stack-2x"></i></span></div>
          </div>
        </div>
        <div class="product-thumb clearfix">
          <div class="image"><a href="product.html"><img src="/image/product/macbook_1-50x75.jpg" alt="آیدیا پد یوگا" title="آیدیا پد یوگا" class="img-responsive" /></a></div>
          <div class="caption">
            <h4><a href="product.html">آیدیا پد یوگا</a></h4>
            <p class="price"> 900000 تومان </p>
            <div class="rating"> <span class="fa fa-stack"><i class="fa fa-star fa-stack-2x"></i><i class="fa fa-star-o fa-stack-2x"></i></span> <span class="fa fa-stack"><i class="fa fa-star fa-stack-2x"></i><i class="fa fa-star-o fa-stack-2x"></i></span> <span class="fa fa-stack"><i class="fa fa-star fa-stack-2x"></i><i class="fa fa-star-o fa-stack-2x"></i></span> <span class="fa fa-stack"><i class="fa fa-star fa-stack-2x"></i><i class="fa fa-star-o fa-stack-2x"></i></span> <span class="fa fa-stack"><i class="fa fa-star-o fa-stack-2x"></i></span> </div>
          </div>
        </div>
        <div class="product-thumb clearfix">
          <div class="image"><a href="product.html"><img src="/image/product/sony_vaio_1-50x75.jpg" alt="کفش راحتی مردانه" title="کفش راحتی مردانه" class="img-responsive" /></a></div>
          <div class="caption">
            <h4><a href="product.html">کفش راحتی مردانه</a></h4>
            <p class="price"> <span class="price-new">32000 تومان</span> <span class="price-old">12 میلیون تومان</span> <span class="saving">-25%</span> </p>
            <div class="rating"> <span class="fa fa-stack"><i class="fa fa-star fa-stack-2x"></i><i class="fa fa-star-o fa-stack-2x"></i></span> <span class="fa fa-stack"><i class="fa fa-star fa-stack-2x"></i><i class="fa fa-star-o fa-stack-2x"></i></span> <span class="fa fa-stack"><i class="fa fa-star fa-stack-2x"></i><i class="fa fa-star-o fa-stack-2x"></i></span> <span class="fa fa-stack"><i class="fa fa-star fa-stack-2x"></i><i class="fa fa-star-o fa-stack-2x"></i></span> <span class="fa fa-stack"><i class="fa fa-star-o fa-stack-2x"></i></span> </div>
          </div>
        </div>
        <div class="product-thumb clearfix">
          <div class="image"><a href="product.html"><img src="/image/product/FinePix-Long-Zoom-Camera-50x75.jpg" alt="دوربین فاین پیکس" title="دوربین فاین پیکس" class="img-responsive" /></a></div>
          <div class="caption">
            <h4><a href="product.html">دوربین فاین پیکس</a></h4>
            <p class="price">122000 تومان</p>
          </div>
        </div>
      </div>
      <h3 class="subtitle">ویژه</h3>
      <div class="side-item">
        <div class="product-thumb clearfix">
          <div class="image"><a href="product.html"><img src="/image/product/macbook_pro_1-50x75.jpg" alt=" کتاب آموزش باغبانی " title=" کتاب آموزش باغبانی " class="img-responsive" /></a></div>
          <div class="caption">
            <h4><a href="product.html">کتاب آموزش باغبانی</a></h4>
            <p class="price"> <span class="price-new">98000 تومان</span> <span class="price-old">120000 تومان</span> <span class="saving">-26%</span> </p>
          </div>
        </div>
        <div class="product-thumb clearfix">
          <div class="image"><a href="product.html"><img src="/image/product/samsung_tab_1-50x75.jpg" alt="تبلت ایسر" title="تبلت ایسر" class="img-responsive" /></a></div>
          <div class="caption">
            <h4><a href="product.html">تبلت ایسر</a></h4>
            <p class="price"> <span class="price-new">98000 تومان</span> <span class="price-old">240000 تومان</span> <span class="saving">-5%</span> </p>
            <div class="rating"> <span class="fa fa-stack"><i class="fa fa-star fa-stack-2x"></i><i class="fa fa-star-o fa-stack-2x"></i></span> <span class="fa fa-stack"><i class="fa fa-star fa-stack-2x"></i><i class="fa fa-star-o fa-stack-2x"></i></span> <span class="fa fa-stack"><i class="fa fa-star fa-stack-2x"></i><i class="fa fa-star-o fa-stack-2x"></i></span> <span class="fa fa-stack"><i class="fa fa-star fa-stack-2x"></i><i class="fa fa-star-o fa-stack-2x"></i></span> <span class="fa fa-stack"><i class="fa fa-star-o fa-stack-2x"></i></span> </div>
          </div>
        </div>
        <div class="product-thumb clearfix">
          <div class="image"><a href="product.html"><img src="/image/product/apple_cinema_30-50x75.jpg" alt="تی شرت کتان مردانه" title="تی شرت کتان مردانه" class="img-responsive" /></a></div>
          <div class="caption">
            <h4><a href="http://demo.harnishdesign.net/opencart/marketshop/v1/index.php?route=product/product&amp;product_id=42">تی شرت کتان مردانه</a></h4>
            <p class="price"> <span class="price-new">110000 تومان</span> <span class="price-old">122000 تومان</span> <span class="saving">-10%</span> </p>
          </div>
        </div>
        <div class="product-thumb clearfix">
          <div class="image"><a href="product.html"><img src="/image/product/nikon_d300_1-50x75.jpg" alt="دوربین دیجیتال حرفه ای" title="دوربین دیجیتال حرفه ای" class="img-responsive" /></a></div>
          <div class="caption">
            <h4><a href="product.html">دوربین دیجیتال حرفه ای</a></h4>
            <p class="price"> <span class="price-new">92000 تومان</span> <span class="price-old">98000 تومان</span> <span class="saving">-6%</span> </p>
          </div>
        </div>
        <div class="product-thumb clearfix">
          <div class="image"><a href="product.html"><img src="/image/product/nikon_d300_5-50x75.jpg" alt="محصولات مراقبت از مو" title="محصولات مراقبت از مو" class="img-responsive" /></a></div>
          <div class="caption">
            <h4><a href="product.html">محصولات مراقبت از مو</a></h4>
            <p class="price"> <span class="price-new">66000 تومان</span> <span class="price-old">90000 تومان</span> <span class="saving">-27%</span> </p>
            <div class="rating"> <span class="fa fa-stack"><i class="fa fa-star fa-stack-2x"></i><i class="fa fa-star-o fa-stack-2x"></i></span> <span class="fa fa-stack"><i class="fa fa-star-o fa-stack-2x"></i></span> <span class="fa fa-stack"><i class="fa fa-star-o fa-stack-2x"></i></span> <span class="fa fa-stack"><i class="fa fa-star-o fa-stack-2x"></i></span> <span class="fa fa-stack"><i class="fa fa-star-o fa-stack-2x"></i></span> </div>
          </div>
        </div>
        <div class="product-thumb clearfix">
          <div class="image"><a href="product.html"><img src="/image/product/macbook_air_1-50x75.jpg" alt="لپ تاپ ایلین ور" title="لپ تاپ ایلین ور" class="img-responsive" /></a></div>
          <div class="caption">
            <h4><a href="product.html">لپ تاپ ایلین ور</a></h4>
            <p class="price"> <span class="price-new">10 میلیون تومان</span> <span class="price-old">12 میلیون تومان</span> <span class="saving">-5%</span> </p>
          </div>
        </div>
      </div>
      <div class="banner owl-carousel">
        <div class="item"> <a href="#"><img src="/image/banner/small-banner1-265x350.jpg" alt="small banner" class="img-responsive" /></a> </div>
        <div class="item"> <a href="#"><img src="/image/banner/small-banner-265x350.jpg" alt="small banner1" class="img-responsive" /></a> </div>
      </div>
    </aside>
    <!--Left Part End -->
    <!--Middle Part Start-->
    <div id="content" class="col-sm-9">
      <h1 class="title">{{category.name}}</h1>
      <div class="product-filter">
        <div class="row">
          <div class="col-md-4 col-sm-5">
            <div class="btn-group">
              <button type="button" id="grid-view" class="btn btn-default" data-toggle="tooltip" title="Grid"><i class="fa fa-th"></i></button>
              <button type="button" id="list-view" class="btn btn-default" data-toggle="tooltip" title="List"><i class="fa fa-th-list"></i></button>
            </div>
          </div>
          <div class="col-sm-2 text-right">
            <label class="control-label">مرتب سازی :</label>
          </div>
          <div class="col-md-3 col-sm-2 text-right">
            <select class="form-control col-sm-3" v-model="sort" @change="getSortedProduct()">
              <option value="ASC">قیمت (کم به زیاد)</option>
              <option value="DESC">قیمت (زیاد به کم)</option>
            </select>
          </div>
          <div class="col-sm-1 text-right">
            <label class="control-label" for="input-limit">نمایش :</label>
          </div>
          <div class="col-sm-2 text-right">
            <select id="input-limit" class="form-control" v-model="paginate" @change = "getSortedProduct()">
              <option value="2">2</option>
              <option value="3">3</option>
              <option value="4">4</option>
              <option value="5">5</option>
              <option value="10">10</option>
            </select>
          </div>
        </div>
      </div>
      <br />
      <div class="row products-category">
        <div class="product-layout product-grid col-lg-3 col-md-3 col-sm-4 col-xs-12" v-for="product in products.data">
          <div class="product-thumb clearfix">
            <div class="image"><a :href="'http://digistyle.test/products/' + product.slug"><img :src="'http://digistyle.test/' + product.photos[0].path" alt="تی شرت کتان مردانه" title="تی شرت کتان مردانه" class="img-responsive" /></a></div>
            <div class="caption">
              <h4><a :href="'http://digistyle.test/products/' + product.slug">{{product.title}}</a></h4>
              <p class="price" v-if="product.discount_price"><span class="price-new">{{product.discount_price}} تومان</span> <span class="price-old">{{product.price}} تومان</span><span class="saving">{{Math.round(Math.abs((product.price-product.discount_price)/product.price * 100))}}%</span></p>
              <p class="price" v-if="!product.discount_price"> {{product.price}} تومان </p>
            </div>
            <div class="button-group">
              <a class="btn-primary" :href="'http://digistyle.test/add-to-cart/' + product.id" ><span>افزودن به سبد</span></a>
            </div>
          </div>
        </div>
      </div>
      <div class="row" v-if="products.last_page">
        <div class="col-sm-12 text-center">
          <paginate
              v-model="page"
              :page-count="products.last_page"
              :page-range="3"
              :margin-pages="2"
              :click-handler="clickCallback"
              :prev-text="'قبلی'"
              :next-text="'بعدی'"
              :container-class="'pagination'"
              :page-class="'page-item'">
          </paginate>
        </div>
      </div>
    </div>
  </div>
</template>

<script>
    export default {
        data() {
          return {
            products: [],
            sort: 'DESC',
            page: 1,
            paginate: 2,
            attributeGroups: [],
            selectedAttribute: [],
            computedAttribute: [],
            flag: false,
          }
        },
        props: ['category'],
        mounted(){
          axios.get('/api/products/'+ this.category.id).then(res =>{
            this.products = res.data.products
          }).catch(err=>{
            console.log (err)
          })
          axios.get('/api/category-attribute/' + this.category.id).then(res =>{
            this.attributeGroups = res.data.attributeGroups
          }).catch(err=>{
            console.log (err)
          })
        },
        methods: {
          clickCallback: function(pageNum){
            this.products= [];
            if(this.flag){
              this.getFilterProduct();
            }
            else if(this.sort == "ASC" || this.sort == "DESC"){
              this.getSortedProduct()
            }else{
              axios.get('/api/products/' + this.category.id +'?page='+ pageNum).then(res =>{
                this.products = res.data.products
              }).catch(err=>{
                console.log (err)
              })
            }
          },
          getSortedProduct: function(){
            this.products= [];
            axios.get('/api/sort-products/' + this.category.id + '/' + this.sort + '/' + this.paginate + '?page='+ this.page).then(res =>{
              this.products = res.data.products
            }).catch(err=>{
              console.log (err)
            })
          },
          addFilter: function(event, index){
            for(var i=0; i<this.selectedAttribute.length; i++){
              var current = this.selectedAttribute[i];
              if(current.index == index){
                this.selectedAttribute.splice(i, 1)
              }
            }
            this.selectedAttribute.push({
              'index': index,
              'value': event.target.value
            })
            this.computedAttribute = []
            for(var i=0; i<this.selectedAttribute.length; i++){
              this.computedAttribute.push(this.selectedAttribute[i].value)
            }
          },
          getFilterProduct: function(){
            this.products = [];
            this.flag = true;
            var attributes = JSON.stringify(this.computedAttribute)
            axios.get('/api/filter-products/' + this.category.id + '/' + this.sort + '/' + this.paginate + '/' + attributes + '?page='+ this.page).then(res =>{
              this.products = res.data.products
            }).catch(err=>{
              console.log (err)
            })
          }
        }
    }
</script>
