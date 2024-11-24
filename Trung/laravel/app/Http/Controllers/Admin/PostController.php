<?php

namespace App\Http\Controllers\Admin;

use App\Http\Controllers\Controller;
use App\Models\Post;
use Illuminate\Http\Request;
use App\Helpers\ResponseHelper;

class PostController extends Controller
{
    /**
     * Display a listing of the resource.
     */
    public function index()
    {
        $posts = Post::paginate(10);
        return ResponseHelper::apiResponse($posts, 'Lấy danh sách bài viết thành công.');
    }

    /**
     * Store a newly created resource in storage.
     */
    public function store(Request $request)
    {
        $request->validate([
            'title' => 'required',
            'summary' => 'required',
            'image' => 'required',
            'content' => 'required',
            'status' => 'integer',
            'view' => 'integer',
        ]);

        $post = Post::create($request->all());
        return ResponseHelper::apiResponse($post, 'Tạo bài viết thành công.');
    }

    /**
     * Display the specified resource.
     */
    public function show($id)
    {
        $post = Post::find($id);
        if (!$post) {
            return ResponseHelper::apiResponse(null,'Bài viết không tồn tại.');
        }
        return ResponseHelper::apiResponse($post, 'Lấy thông tin bài viết thành công.');
    }

    /**
     * Update the specified resource in storage.
     */
    public function update(Request $request, $id)
    {
        $request->validate([
            'title' => 'required',
            'summary' => 'required',
            'image' => 'required',
            'content' => 'required',
            'status' => 'integer',
            'view' => 'integer',
        ]);

        $post = Post::find($id);
        if (!$post) {
            return ResponseHelper::apiResponse(null,'Bài viết không tồn tại.');
        }

        $post->update($request->all());
        return ResponseHelper::apiResponse($post, 'Cập nhật bài viết thành công.');
    }

    /**
     * Remove the specified resource from storage.
     */
    public function destroy($id)
    {
        $post = Post::find($id);
        if (!$post) {
            return ResponseHelper::apiResponse(null,'Bài viết không tồn tại.');
        }
        $post->delete();
        return ResponseHelper::apiResponse(null, 'Xóa bài viết thành công.');
    }
}
