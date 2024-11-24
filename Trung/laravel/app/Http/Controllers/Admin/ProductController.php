<?php

namespace App\Http\Controllers\Admin;

use App\Http\Controllers\Controller;
use App\Models\Product;
use Illuminate\Http\Request;
use App\Helpers\ResponseHelper;

class ProductController extends Controller
{
    /**
     * Display a listing of the resource.
     */
    public function index()
    {
        $products = Product::with('category', 'comments')->paginate(10);
        return ResponseHelper::apiResponse($products, 'Lấy danh sách sản phẩm thành công');
    }

    /**
     * Store a newly created resource in storage.
     */
    public function store(Request $request)
    {
        $payload = $request->validate([
            "name" => "required|unique:products",
            "cate_id" => "required|integer",
            "price" => "required|integer",
            "discount" => "required|max:100",
            "image" => "required",
            "view" => "integer",
            "quantity" => "required",
            "detail" => "string",
            "hot" => "integer",
            "status" => "integer"
        ]);
        $product = Product::create($request->all());
        return ResponseHelper::apiResponse($product, 'Thêm sản phẩm thành công');
    }

    /**
     * Display the specified resource.
     */
    public function show($id)
    {
        $product = Product::with('category', 'comments')->find($id);
        if ($product) {
            return ResponseHelper::apiResponse($product, 'Lấy sản phẩm thành công');
        }
        return ResponseHelper::apiResponse(null, 'Không tìm thấy sản phẩm', 404);
    }

    /**
     * Update the specified resource in storage.
     */
    public function update(Request $request, $id)
    {
        $payload = $request->validate([
            "name" => "required|unique:products,name," . $id,
            "cate_id" => "required|integer",
            "price" => "required|integer",
            "discount" => "required|max:100",
            "image" => "required",
            "view" => "integer",
            "quantity" => "required",
            "detail" => "string",
            "hot" => "integer",
            "status" => "integer"
        ]);
        $product = Product::find($id);
        if ($product) {
            $product->update($request->all());
            return ResponseHelper::apiResponse($product, 'Cập nhật sản phẩm thành công');
        }
        return ResponseHelper::apiResponse(null, 'Không tìm thấy sản phẩm', 404);
    }

    /**
     * Remove the specified resource from storage.
     */
    public function destroy($id)
    {
        $product = Product::find($id);
        if ($product) {
            $product->delete();
            return ResponseHelper::apiResponse(null, 'Xóa sản phẩm thành công');
        }
        return ResponseHelper::apiResponse(null, 'Không tìm thấy sản phẩm', 404);
    }
}
