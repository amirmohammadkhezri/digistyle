<?php

namespace App\Http\Controllers\Backend;

use App\Http\Controllers\Controller;
use App\Services\Backend\CategoryService;
use Illuminate\Contracts\View\Factory;
use Illuminate\Http\Request;
use Illuminate\Http\Response;
use Illuminate\View\View;

class CategoryController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return Response
     */
    public function index()
    {
        return CategoryService::getAllCategory();
    }

    /**
     * Show the form for creating a new resource.
     *
     * @return Response
     */
    public function create()
    {
        return CategoryService::CreateCategory();

    }

    /**
     * Store a newly created resource in storage.
     *
     * @param Request $request
     * @return Response
     */
    public function store(Request $request)
    {
        return CategoryService::storeCategory($request);
    }


    /**
     * Show the form for editing the specified resource.
     *
     * @param int $id
     * @return Response
     */
    public function edit($id)
    {
        return CategoryService::editCategory($id);
    }

    /**
     * Update the specified resource in storage.
     *
     * @param Request $request
     * @param int $id
     * @return Response
     */
    public function update(Request $request, $id)
    {
        return CategoryService::updateCategory($request, $id);
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param int $id
     * @return Response
     */
    public function destroy($id)
    {
        return CategoryService::deleteCategory($id);
    }

    /**
     * @param $id
     * @return Factory|View
     */
    public function indexSetting($id)
    {
        return CategoryService::settingCategory($id);
    }

    public function saveSetting(Request $request, $id)
    {
        return CategoryService::saveSettingCategory($request, $id);
    }

    public function apiIndex()
    {
        return CategoryService::apiIndexCategory();
    }

    public function apiIndexAttribute(Request $request)
    {
        return CategoryService::apiIndexAttributeCategory($request);
    }
}
