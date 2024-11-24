<?php

namespace App\Http\Controllers\Admin;

use App\Http\Controllers\Controller;
use App\Models\Order;
use App\Models\OrderDetail;
use Illuminate\Http\Request;
use App\Helpers\ResponseHelper;

class OrderController extends Controller
{
    /**
     * Display a listing of the resource.
     */
    public function index()
    {
        $orders = Order::with('user', 'orderDetails', 'payment')->paginate(10);
        return ResponseHelper::apiResponse($orders, 'Lấy danh sách đơn hàng thành công');
    }

    /**
     * Store a newly created resource in storage.
     */
    public function store(Request $request)
    {
        $request->validate([
            'total_amount' => 'required|integer',
            'fullname' => 'required|string',
            'email' => 'required|email',
            'address' => 'required|string',
            'phone' => 'required|string',
            'note' => 'required|string',
            'status' => 'integer',
            'user_id' => 'required|integer',
            'payment_id' => 'required|integer',
            'id_discount' => 'integer',
            'products' => 'required|array',
        ]);

        $order = Order::create([
            'total_amount' => $request->total_amount,
            'fullname' => $request->fullname,
            'email' => $request->email,
            'address' => $request->address,
            'phone' => $request->phone,
            'note' => $request->note,
            'status' => $request->status,
            'user_id' => $request->user_id,
            'payment_id' => $request->payment_id,
            'id_discount' => $request->id_discount,
        ]);

        foreach ($request->products as $product) {
            OrderDetail::create([
                'order_id' => $order->id,
                'product_id' => $product['product_id'],
                'quantity' => $product['quantity'],
                'amount' => $product['amount'],
            ]);
        }

        return ResponseHelper::apiResponse($order, 'Thêm đơn hàng thành công');
    }

    /**
     * Display the specified resource.
     */
    public function show($id)
    {
        $order = Order::with('user', 'orderDetails', 'payment')->find($id);
        if ($order) {
            return ResponseHelper::apiResponse($order, 'Lấy đơn hàng thành công');
        }
        return ResponseHelper::apiResponse(null, 'Không tìm thấy đơn hàng', 404);
    }

    /**
     * Update the specified resource in storage.
     */
    public function update(Request $request,$id)
    {
        $request->validate([
            'total_amount' => 'required|integer',
            'fullname' => 'required|string',
            'email' => 'required|email',
            'address' => 'required|string',
            'phone' => 'required|string',
            'note' => 'required|string',
            'status' => 'integer',
            'user_id' => 'required|integer',
            'payment_id' => 'required|integer',
            'id_discount' => 'integer',
            'products' => 'required|array',
        ]);

        $order = Order::find($id);
        if ($order) {
            $order->update([
                'total_amount' => $request->total_amount,
                'fullname' => $request->fullname,
                'email' => $request->email,
                'address' => $request->address,
                'phone' => $request->phone,
                'note' => $request->note,
                'status' => $request->status,
                'user_id' => $request->user_id,
                'payment_id' => $request->payment_id,
                'id_discount' => $request->id_discount,
            ]);

            OrderDetail::where('order_id', $id)->delete();
            foreach ($request->products as $product) {
                OrderDetail::create([
                    'order_id' => $order->id,
                    'product_id' => $product['product_id'],
                    'quantity' => $product['quantity'],
                    'amount' => $product['amount'],
                ]);
            }

            return ResponseHelper::apiResponse($order, 'Cập nhật đơn hàng thành công');
        }
    }

    /**
     * Remove the specified resource from storage.
     */
    public function destroy($id)
    {
        $order = Order::find($id);
        if ($order) {
            $order->delete();
            return ResponseHelper::apiResponse(null, 'Xóa đơn hàng thành công');
        }
        return ResponseHelper::apiResponse(null, 'Không tìm thấy đơn hàng', 404);
    }
}
