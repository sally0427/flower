<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class Festival extends Model
{
    protected $fillable = [
        'name', 'date', 'flower', 'meaning', 'image',
    ];
}
