<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class DiscountCode extends Model
{
    protected $fillable = [
        "code",
        "value",
        "time",
        'status',
    ];

    protected $table = 'discount_codes';
}
