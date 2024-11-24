<?php

namespace App\Http\Controllers\Admin;

use App\Http\Controllers\Controller;
use App\Models\FavoriteProduct;
use Illuminate\Http\Request;
use App\Helpers\ResponseHelper;

class FavoriteProductController extends Controller
{
    /**
     * Display a listing of the resource.
     */
    public function index()
    {
        $favoriteProducts = FavoriteProduct::all();
        return ResponseHelper::apiResponse($favoriteProducts, 'Lấy danh sách sản phẩm yêu thích thành công');
    }

    /**
     * Store a newly created resource in storage.
     */
    public function store(Request $request)
    {
        $payload = $request->validate([
            "pro_id" => "required|integer",
            "user_id" => "required|integer",
        ]);
        $favoriteProduct = FavoriteProduct::create($request->all());
        return ResponseHelper::apiResponse($favoriteProduct, 'Thêm sản phẩm yêu thích thành công');
    }

    /**
     * Display the specified resource.
     */
    public function show(FavoriteProduct $favoriteProduct)
    {
        //
    }

    /**
     * Update the specified resource in storage.
     */
    public function update(Request $request, FavoriteProduct $favoriteProduct)
    {
        //
    }

    /**
     * Remove the specified resource from storage.
     */
    public function destroy($id)
    {
        $favoriteProduct = FavoriteProduct::find($id);
        if ($favoriteProduct) {
            $favoriteProduct->delete();
            return ResponseHelper::apiResponse(null, 'Xóa sản phẩm yêu thích thành công');
        }
        return ResponseHelper::apiResponse(null, 'Không tìm thấy sản phẩm yêu thích', 404);
    }
}
