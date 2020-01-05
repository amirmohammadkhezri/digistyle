<?php


namespace App\Services\Backend;


use App\AttributeGroup;
use App\AttributeValue;
use App\Services\BaseService;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Session;

class AttributeValueService extends BaseService
{

    public static function getAllAttributeValue()
    {
        $attributesValue = AttributeValue::with('attributeGroup')->paginate(10);
        return view('admin.attributes-value.index', ['attributesValue' => $attributesValue]);
    }

    public static function showCreateAttribute()
    {
        $attributesGroup = AttributeGroup::all();
        return view('admin.attributes-value.create', ['attributesGroup' => $attributesGroup]);
    }

    public static function createAttribute(Request $request)
    {
        $newValue = new AttributeValue();
        $newValue->title = $request->input('title');
        $newValue->attributeGroup_id = $request->input('attribute_group');
        $newValue->save();
        Session::flash('attributes', 'مقدار ویژگی جدید با موفقیت اضافه شد.');

        return redirect('administrator/attributes-value');
    }

    public static function editAttribute(int $id)
    {
        $attributeValue = AttributeValue::with('attributeGroup')->whereId($id)->first();
        $attributesGroup = AttributeGroup::all();
        return view('admin.attributes-value.edit', ['attributeValue' => $attributeValue, 'attributesGroup' => $attributesGroup]);
    }

    public static function updateAttribute(Request $request, int $id)
    {
        $updatedValue = AttributeValue::findOrFail($id);
        $updatedValue->title = $request->input('title');
        $updatedValue->attributeGroup_id = $request->input('attribute_group');
        $updatedValue->save();

        Session::flash('attributes', 'مقدار ویژگی ' . $updatedValue->title . ' با موفقیت بروزرسانی شد');

        return redirect('administrator/attributes-value');
    }

    public static function deleteAttribute(int $id)
    {
        $attributeValue = AttributeValue::findOrFail($id);
        $attributeValue->delete();

        Session::flash('attributes-delete', 'مقدار ' . $attributeValue->title . ' حذف شد');

        return redirect('administrator/attributes-value');
    }
}