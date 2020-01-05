<?php


namespace App\Services\Backend;


use App\Brand;
use App\Services\BaseService;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Session;
use Illuminate\Support\Facades\Validator;


class BrandService extends BaseService
{

    public static function getAllBrand()
    {
        $brands = Brand::paginate(10);

        return view('admin.brands.index', compact(['brands']));
    }

    public static function storeBrand(Request $request)
    {
        $validator = Validator::make($request->all(), [
            'title' => 'required|unique:brands',
            'description' => 'required'
        ], [
            'title.required' => 'عنوان برند شما باید درج شود',
            'title.unique' => 'این برند قبلا ثبت شده است',
            'description.required' => 'توضیحات خود را وارد کنید'
        ]);

        if ($validator->fails()) {
            return redirect('/administrator/brands')->withErrors($validator)->withInput();
        } else {
            $brand = new Brand();
            $brand->title = $request->input('title');
            $brand->description = $request->input('description');
            $brand->photo_id = $request->input('photo_id');
            $brand->save();

            Session::flash('success', 'برند با موفقیت ذخیره شد');
            return redirect('/administrator/brands');

        }
    }

    public static function editBrand(int $id)
    {
        $brand = Brand::with('photo')->whereId($id)->first();
        return view('admin.brands.edit', compact(['brand']));
    }

    public static function updateBrand(Request $request, int $id)
    {
        $validator = Validator::make($request->all(), [
            'title' => 'required|unique:brands,title,' . $id,
            'description' => 'required'
        ], [
            'title.required' => 'عنوان برند شما باید درج شود',
            'title.unique' => 'این برند قبلا ثبت شده است',
            'description.required' => 'توضیحات خود را وارد کنید'
        ]);

        if ($validator->fails()) {
            return redirect('/administrator/brands')->withErrors($validator)->withInput();
        } else {
            $brand = Brand::findOrFail($id);
            $brand->title = $request->input('title');
            $brand->description = $request->input('description');
            $brand->photo_id = $request->input('photo_id');
            $brand->save();

            Session::flash('success', 'برند با موفقیت ویرایش شد');
            return redirect('/administrator/brands');

        }
    }

    public static function deleteBrand(int $id)
    {
        $brand = Brand::findOrFail($id);
        $brand->delete();

        Session::flash('success', 'برند ' . $brand->title . ' با موفقیت حذف شد.');
        return redirect('/administrator/brands');
    }
}