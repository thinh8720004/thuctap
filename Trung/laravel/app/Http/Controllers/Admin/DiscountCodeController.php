<?php

namespace App\Http\Controllers\Admin;

use App\Http\Controllers\Controller;
use App\Models\DiscountCode;
use Illuminate\Http\Request;
use App\Helpers\ResponseHelper;

class DiscountCodeController extends Controller
{
    /**
     * Display a listing of the resource.
     */
    public function index()
    {
        $discountCodes = DiscountCode::all();
        return ResponseHelper::apiResponse($discountCodes, 'Lấy danh sách mã giảm giá thành công');
    }

    /**
     * Store a newly created resource in storage.
     */
    public function store(Request $request)
    {
        $payload = $request->validate([
            "code" => "required|string",
            "value" => "required|integer",
            "time" => "required|date",
            "status" => "required|integer",
        ]);
        $discountCode = DiscountCode::create($request->all());
        return ResponseHelper::apiResponse($discountCode, 'Thêm mã giảm giá thành công');
    }

    /**
     * Display the specified resource.
     */
    public function show($id)
    {
        $discountCode = DiscountCode::find($id);
        if ($discountCode) {
            return ResponseHelper::apiResponse($discountCode, 'Lấy mã giảm giá thành công');
        }
        return ResponseHelper::apiResponse(null, 'Không tìm thấy mã giảm giá', 404);
    }

    /**
     * Update the specified resource in storage.
     */
    public function update(Request $request, $id)
    {
        $discountCode = DiscountCode::find($id);
        if ($discountCode) {
            $payload = $request->validate([
                "code" => "required|string",
                "value" => "required|integer",
                "time" => "required|date",
                "status" => "required|integer",
            ]);
            $discountCode->update($request->all());
            return ResponseHelper::apiResponse($discountCode, 'Cập nhật mã giảm giá thành công');
        }
        return ResponseHelper::apiResponse(null, 'Không tìm thấy mã giảm giá', 404);
    }

    /**
     * Remove the specified resource from storage.
     */
    public function destroy($id)
    {
        $discountCode = DiscountCode::find($id);
        if ($discountCode) {
            $discountCode->delete();
            return ResponseHelper::apiResponse(null, 'Xóa mã giảm giá thành công');
        }
        return ResponseHelper::apiResponse(null, 'Không tìm thấy mã giảm giá', 404);
    }
}
