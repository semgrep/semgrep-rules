<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class VulnerableUser extends Model
{
    /**
     * Wildcard fillable - allows mass assignment of ALL attributes.
     */
    // ruleid: laravel-mass-assignment-fillable-star
    protected $fillable = ['*'];
}

class SafeUser extends Model
{
    /**
     * Only specific fields are mass-assignable.
     */
    // ok: laravel-mass-assignment-fillable-star
    protected $fillable = ['name', 'email', 'password'];
}

class AnotherSafeModel extends Model
{
    /**
     * Using guarded to block specific fields is also acceptable.
     */
    // ok: laravel-mass-assignment-fillable-star
    protected $fillable = ['title', 'body', 'slug'];
}
?>
