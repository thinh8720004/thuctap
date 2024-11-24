<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class FavoriteProduct extends Model
{
    protected $fillable = [
        "pro_id",
        "user_id",
    ];

    protected $table = 'favorite_products';

    public function product()
    {
        return $this->belongsTo(Product::class, 'pro_id');
    }
}
