<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class Product extends Model
{
    protected $fillable = [
        "name",
        "cate_id",
        "price",
        "discount",
        "image",
        "view",
        "quantity",
        "detail",
        "hot",
        "status"
    ];


    public function category()
    {
        return $this->belongsTo(Category::class, 'cate_id');
    }

    public function comments()
    {
        return $this->hasMany(Comment::class , 'pro_id');
    }

    public function favorite_users()
    {
        return $this->belongsToMany(User::class, 'favorite_products', 'pro_id', 'user_id');
    }
}
