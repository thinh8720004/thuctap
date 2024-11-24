<?php

namespace App\Http\Controllers\Admin;

use App\Http\Controllers\Controller;
use App\Models\Category;
use Illuminate\Http\Request;
use App\Helpers\ResponseHelper;

class CategoryController extends Controller
{
    /**
     * Display a listing of the resource.
     */
    public function index()
    {
        $categories = Category::with('products')->paginate(10);
        return ResponseHelper::apiResponse($categories, 'Lấy danh sách danh mục thành công');
    }

    /**
     * Store a newly created resource in storage.
     */
    public function store(Request $request)
    {
        $payload = $request->validate([
            'name' => 'required|string',
            'image' => 'required',
        ]);

        $category = Category::create($payload);
        return ResponseHelper::apiResponse($category, 'Tạo danh mục thành công');
    }

    /**
     * Display the specified resource.
     */
    public function show($id)
    {
        $category = Category::find($id);
        if (!$category) {
            return ResponseHelper::apiResponse(null, 'Không tìm thấy danh mục', 404);
        }
        return ResponseHelper::apiResponse($category, 'Lấy thông tin danh mục thành công');
    }

    /**
     * Update the specified resource in storage.
     */
    public function update(Request $request, $id)
    {
        $payload = $request->validate([
            'name' => 'required|string|unique:categories,name,' . $id,
            'image' => 'string',
        ]);

        $category = Category::find($id);
        if (!$category) {
            return ResponseHelper::apiResponse(null, 'Không tìm thấy danh mục', 404);
        }
        $category->update($payload);
        return ResponseHelper::apiResponse($category, 'Cập nhật danh mục thành công');
    }

    /**
     * Remove the specified resource from storage.
     */
    public function destroy($id)
    {
        $category = Category::find($id);
        if (!$category) {
            return ResponseHelper::apiResponse(null, 'Không tìm thấy danh mục', 404);
        }
        $category->delete();
        return ResponseHelper::apiResponse(null, 'Xóa danh mục thành công');
    }
}
