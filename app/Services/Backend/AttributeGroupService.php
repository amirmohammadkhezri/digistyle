<?php


namespace App\Services\Backend;


use App\AttributeGroup;
use App\Services\BaseService;
use Illuminate\Contracts\View\Factory;
use Illuminate\Http\RedirectResponse;
use Illuminate\Http\Request;
use Illuminate\Routing\Redirector;
use Illuminate\Support\Facades\Session;
use Illuminate\View\View;

class AttributeGroupService extends BaseService
{

    /**
     * @return Factory|View
     */
    public static function allAttributeGroup()
    {
        $attributesGroup = AttributeGroup::paginate(10);
        return view('admin.attributes.index', ['attributesGroup' => $attributesGroup]);
    }

    /**
     * @param Request $request
     * @return RedirectResponse|Redirector
     */
    public static function Create(Request $request)
    {
        $attributeGroup = new AttributeGroup();
        $attributeGroup->title = $request->input('title');
        $attributeGroup->type = $request->input('type');
        $attributeGroup->save();

        Session::flash('attributes', 'ویژگی جدید با موفقیت اضافه شد.');

        return redirect('administrator/attributes-group');
    }

    /**
     * @param Request $request
     * @param int $id
     * @return RedirectResponse|Redirector
     */
    public static function updated(Request $request, int $id)
    {
        $attributeGroup = AttributeGroup::findOrFail($id);
        $attributeGroup->title = $request->input('title');
        $attributeGroup->type = $request->input('type');
        $attributeGroup->save();

        Session::flash('attributes', 'ویژگی ' . $attributeGroup->name . ' با موفقیت بروزرسانی شد');

        return redirect('administrator/attributes-group');
    }

    /**
     * @param int $id
     * @return RedirectResponse|Redirector
     */
    public static function delete(int $id)
    {
        $attributeGroup = AttributeGroup::findOrFail($id);
        $attributeGroup->delete();

        Session::flash('attributes-delete', 'ویژگی ' . $attributeGroup->name . ' حذف شد');

        return redirect('administrator/attributes-group');
    }
}