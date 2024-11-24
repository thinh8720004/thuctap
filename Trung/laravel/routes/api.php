<?php

use Illuminate\Support\Facades\Route;
use App\Http\Controllers\AuthController;
use App\Http\Controllers\Admin\UserController;
use App\Http\Controllers\Admin\CategoryController;
use App\Http\Controllers\Admin\ProductController;
use App\Http\Controllers\Admin\CommentController;
use App\Http\Controllers\Admin\FavoriteProductController;
use App\Http\Controllers\Admin\DiscountCodeController;
use App\Http\Controllers\Admin\OrderController;
use App\Http\Controllers\Admin\PostController;

Route::group([
    'middleware' => 'api',
    'prefix' => 'auth'
], function ($router) {
    Route::post('/register', [AuthController::class, 'register'])->name('register');
    Route::post('/login', [AuthController::class, 'login'])->name('login');
    Route::post('/logout', [AuthController::class, 'logout'])->middleware('auth:api')->name('logout');
    Route::post('/refresh', [AuthController::class, 'refresh'])->middleware('auth:api')->name('refresh');
    Route::post('/me', [AuthController::class, 'me'])->middleware('auth:api')->name('me');
});

Route::group([
    'middleware' => ['api', 'auth:api'],
], function ($router) {
    // User
    Route::get('/users', [UserController::class, 'index'])->name('users');
    Route::get('/users/{id}', [UserController::class, 'show'])->name('users.show');
    Route::post('/users', [UserController::class, 'store'])->name('users.store');
    Route::put('/users/{id}', [UserController::class, 'update'])->name('users.update');
    Route::delete('/users/{id}', [UserController::class, 'destroy'])->name('users.destroy');

    // Category
    Route::get('/categories', [CategoryController::class, 'index'])->name('categories');
    Route::get('/categories/{id}', [CategoryController::class, 'show'])->name('categories.show');
    Route::post('/categories', [CategoryController::class, 'store'])->name('categories.store');
    Route::put('/categories/{id}', [CategoryController::class, 'update'])->name('categories.update');
    Route::delete('/categories/{id}', [CategoryController::class, 'destroy'])->name('categories.destroy');

    // Product
    Route::get('/products', [ProductController::class, 'index'])->name('products');
    Route::get('/products/{id}', [ProductController::class, 'show'])->name('products.show');
    Route::post('/products', [ProductController::class, 'store'])->name('products.store');
    Route::put('/products/{id}', [ProductController::class, 'update'])->name('products.update');
    Route::delete('/products/{id}', [ProductController::class, 'destroy'])->name('products.destroy');

    // Comment
    Route::get('/comments', [CommentController::class, 'index'])->name('comments');
    Route::get('/comments/{id}', [CommentController::class, 'show'])->name('comments.show');
    Route::post('/comments', [CommentController::class, 'store'])->name('comments.store');
    Route::put('/comments/{id}', [CommentController::class, 'update'])->name('comments.update');
    Route::delete('/comments/{id}', [CommentController::class, 'destroy'])->name('comments.destroy');

    // Favorite
    Route::post('/favorites', [FavoriteProductController::class, 'store'])->name('favorites.store');
    Route::delete('/favorites/{id}', [FavoriteProductController::class, 'destroy'])->name('favorites.destroy');
    Route::get('/favorites', [FavoriteProductController::class, 'index'])->name('favorites');
    Route::get('/favorites/{id}', [FavoriteProductController::class, 'show'])->name('favorites.show');

    // Discount
    Route::get('/discounts', [DiscountCodeController::class, 'index'])->name('discounts');
    Route::get('/discounts/{id}', [DiscountCodeController::class, 'show'])->name('discounts.show');
    Route::post('/discounts', [DiscountCodeController::class, 'store'])->name('discounts.store');
    Route::put('/discounts/{id}', [DiscountCodeController::class, 'update'])->name('discounts.update');
    Route::delete('/discounts/{id}', [DiscountCodeController::class, 'destroy'])->name('discounts.destroy');

    // Order
    Route::get('/orders', [OrderController::class, 'index'])->name('orders');
    Route::get('/orders/{id}', [OrderController::class, 'show'])->name('orders.show');
    Route::post('/orders', [OrderController::class, 'store'])->name('orders.store');
    Route::put('/orders/{id}', [OrderController::class, 'update'])->name('orders.update');
    Route::delete('/orders/{id}', [OrderController::class, 'destroy'])->name('orders.destroy');

    //post
    Route::get('/posts', [PostController::class, 'index'])->name('posts');
    Route::get('/posts/{id}', [PostController::class, 'show'])->name('posts.show');
    Route::post('/posts', [PostController::class, 'store'])->name('posts.store');
    Route::put('/posts/{id}', [PostController::class, 'update'])->name('posts.update');
    Route::delete('/posts/{id}', [PostController::class, 'destroy'])->name('posts.destroy');
});


