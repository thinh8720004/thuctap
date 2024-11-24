<?php

namespace App\Http\Controllers\Admin;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use App\Models\User;
use App\Helpers\ResponseHelper;
class UserController extends Controller
{

    public function index()
    {
        $users = User::with('favorite_products')->paginate(10);
        return ResponseHelper::apiResponse($users, 'Lấy danh sách người dùng thành công');
    }
    

    /**
     * Store a newly created resource in storage.
     */
    public function store(Request $request)
    {
        $payload = $request->validate([
            'name' => 'required|string',
            'email' => 'required|email|unique:users',
            'password' => 'required|min:8',
            'password_confirmation' => 'required|same:password',
            'address' => 'required|string',
            'phone' => 'required|string',
        ]);

        $payload['password'] = bcrypt($payload['password']);
        $user = User::create($payload);
        return ResponseHelper::apiResponse($user, 'Tạo người dùng thành công');
    }

    /**
     * Display the specified resource.
     */
    public function show(string $id)
    {
        $user = User::find($id);
        if (!$user) {
            return ResponseHelper::apiResponse(null, 'Không tìm thấy người dùng', false, 404);
        }
        return ResponseHelper::apiResponse($user, 'Lấy thông tin người dùng thành công');
    }

    /**
     * Update the specified resource in storage.
     */
    public function update(Request $request, string $id)
    {
        $user = User::find($id);
        if (!$user) {
            return ResponseHelper::apiResponse(null, 'Không tìm thấy người dùng', false, 404);
        }

        $payload = $request->validate([
            'name' => 'required|string',
            'email' => 'required|email|unique:users,email,' . $id,
            'address' => 'required|string',
            'phone' => 'required|string',
        ]);

        $user->update($payload);
        return ResponseHelper::apiResponse($user, 'Cập nhật người dùng thành công');
    }

    /**
     * Remove the specified resource from storage.
     */
    public function destroy(string $id)
    {
        $user = User::find($id);
        if (!$user) {
            return ResponseHelper::apiResponse(null, 'Không tìm thấy người dùng', false, 404);
        }

        $user->delete();
        return ResponseHelper::apiResponse(null, 'Xóa người dùng thành công');
    }
}
