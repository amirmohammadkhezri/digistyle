<?php


namespace App\Services\Backend;


use App\AttributeGroup;
use App\Category;
use App\Services\BaseService;
use Illuminate\Support\Facades\Session;

class CategoryService extends BaseService
{

    public static function getAllCategory()
    {
        $categories = Category::with('childrenRecursive')
            ->where('parent_id', null)
            ->paginate(10);

        return view('admin.categories.index', compact(['categories']));
    }

    public static function CreateCategory()
    {
        $categories = Category::with('childrenRecursive')
            ->where('parent_id', null)
            ->get();

        return view('admin.categories.create', compact(['categories']));
    }

    public static function storeCategory(\Illuminate\Http\Request $request)
    {
        $category = new Category();
        $category->name = $request->input('name');
        $category->parent_id = $request->input('category_parent');
        $category->meta_title = $request->input('meta_title');
        $category->meta_desc = $request->input('meta_desc');
        $category->meta_keywords = $request->input('meta_keywords');
        $category->save();

        return redirect('/administrator/categories');
    }

    public static function editCategory(int $id)
    {
        $categories = Category::with('childrenRecursive')
            ->where('parent_id', null)
            ->get();
        $category = Category::findOrFail($id);
        return view('admin.categories.edit', ['categories' => $categories, 'category' => $category]);
    }

    public static function updateCategory(\Illuminate\Http\Request $request, int $id)
    {
        $category = Category::findOrFail($id);
        $category->name = $request->input('name');
        $category->parent_id = $request->input('category_parent');
        $category->meta_title = $request->input('meta_title');
        $category->meta_desc = $request->input('meta_desc');
        $category->meta_keywords = $request->input('meta_keywords');
        $category->save();

        return redirect('/administrator/categories');
    }

    public static function deleteCategory(int $id)
    {
        $category = Category::with('childrenRecursive')->where('id', $id)->first();
        if (count($category->childrenRecursive) > 0) {
            Session::flash('error_category', 'دسته بندی ' . $category->name . ' دارای زیر دسته است. بنابراین حذف آن امکان پذیر نمی باشد.');
            return redirect('/administrator/categories');
        }
        $category->delete();
        return redirect('/administrator/categories');
    }

    public static function settingCategory($id)
    {
        $category = Category::findOrFail($id);
        $attributeGroups = AttributeGroup::all();
        return view('admin.categories.index-setting', compact(['category', 'attributeGroups']));
    }

    public static function saveSettingCategory(\Illuminate\Http\Request $request, $id)
    {
        $category = Category::findOrFail($id);
        $category->attributeGroups()->sync($request->attributeGroups);
        $category->save();

        return redirect()->to('/administrator/categories');
    }

    public static function apiIndexCategory()
    {
        $categories = Category::with('childrenRecursive')
            ->where('parent_id', null)
            ->get();

        $response = [
            'categories' => $categories
        ];
        return response()->json($response, 200);
    }

    public static function apiIndexAttributeCategory(\Illuminate\Http\Request $request)
    {
        $categories = $request->all();
        $attributeGroup = AttributeGroup::with('attributesValue', 'categories')
            ->whereHas('categories', function ($q) use ($categories) {
                $q->whereIn('categories.id', $categories);
            })->get();
        $response = [
            'attributes' => $attributeGroup
        ];
        return response()->json($response, 200);
    }
}