<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class Comment extends Model
{
    protected $fillable = [
        "pro_id",
        "user_id",
        "content",
        "rate",
        "status",
    ];

    public function product()
    {
        return $this->belongsTo(Product::class, 'pro_id');
    }

    public function user()
    {
        return $this->belongsTo(User::class, 'user_id');
    }
}
