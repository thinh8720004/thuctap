<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class Post extends Model
{
    protected $fillable = ['title', 'summary', 'image', 'content', 'status', 'view'];
    protected $table = 'news';
}
