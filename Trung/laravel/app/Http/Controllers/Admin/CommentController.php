<?php

namespace App\Http\Controllers\Admin;

use App\Http\Controllers\Controller;
use App\Models\Comment;
use Illuminate\Http\Request;
use App\Helpers\ResponseHelper;

class CommentController extends Controller
{
    /**
     * Display a listing of the resource.
     */
    public function index()
    {
        $comments = Comment::with('product')->paginate(10);
        return ResponseHelper::apiResponse($comments, 'Lấy danh sách bình luận thành công');
    }

    /**
     * Store a newly created resource in storage.
     */
    public function store(Request $request)
    {
        $payload = $request->validate([
            "pro_id" => "required|integer",
            "user_id" => "required|integer",
            "content" => "required",
            "rate" => "required|integer",
            "status" => "integer"
        ]);

        $comment = Comment::create($request->all());
        return ResponseHelper::apiResponse($comment, 'Thêm bình luận thành công');
    }

    /**
     * Display the specified resource.
     */
    public function show($id)
    {
        $comment = Comment::with('product', 'user')->find($id);
        if ($comment) {
            return ResponseHelper::apiResponse($comment, 'Lấy bình luận thành công');
        }
        return ResponseHelper::apiResponse(null, 'Không tìm thấy bình luận', 404);
    }

    /**
     * Update the specified resource in storage.
     */
    public function update(Request $request, $id)
    {
        $payload = $request->validate([
            "pro_id" => "required|integer",
            "user_id" => "required|integer",
            "content" => "required",
            "rate" => "required|integer",
            "status" => "integer"
        ]);

        $comment = Comment::find($id);
        if ($comment) {
            $comment->update($request->all());
            return ResponseHelper::apiResponse($comment, 'Cập nhật bình luận thành công');
        }
        return ResponseHelper::apiResponse(null, 'Không tìm thấy bình luận', 404);

    }

    /**
     * Remove the specified resource from storage.
     */
    public function destroy($id)
    {
        $comment = Comment::find($id);
        if ($comment) {
            $comment->delete();
            return ResponseHelper::apiResponse(null, 'Xóa bình luận thành công');
        }
        return ResponseHelper::apiResponse(null, 'Không tìm thấy bình luận', 404);
    }
}
