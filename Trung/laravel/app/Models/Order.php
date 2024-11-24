<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class Order extends Model
{
    protected $fillable = [
        'voucher',
        'total_amount',
        'fullname',
        'email',
        'address',
        'phone',
        'note',
        'status',
        'user_id',
        'payment_id',
        'id_discount'
    ];
    
    public function user()
    {
        return $this->belongsTo(User::class, 'user_id');
    }

    public function orderDetails()
    {
        return $this->hasMany(OrderDetail::class, 'order_id' );
    }

    public function payment()
    {
        return $this->belongsTo(PaymentMethob::class, 'payment_id', 'payment_method_id');
    }
}
