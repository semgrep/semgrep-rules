<?php
 
namespace App\Models;
 
use Illuminate\Database\Eloquent\Model;
 
class Flight extends Model
{
    /**
     * The primary key associated with the table.
     *
     * @var string
     */
    protected $primaryKey = 'flight_id';

    /**
    * The attributes that aren't mass assignable.
    *
    * @var array
    */
    // ruleid: laravel-dangerous-model-construction
    protected $guarded = [];
}
