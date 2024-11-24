<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class PaymentMethob extends Model
{
    

    protected $fillable = [
        'name',
        'status',
    ];

    protected $table = 'payment_methods';
    
    public function orders()
    {
        return $this->hasMany(Order::class, 'payment_id');
    }
}
