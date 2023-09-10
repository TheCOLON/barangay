<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class attendance extends Model
{
    use HasFactory;

    protected $fillable = [
        'assembly_id',  // Foreign key referencing the assembly table
        'resident_id',  // Foreign key referencing the resident table
        
        // Add more fields here as needed
    ];

    // Define relationships to the Assembly and Resident models
    public function assembly()
    {
        return $this->belongsTo(Assembly::class, 'assembly_id');
    }

    public function resident()
    {
        return $this->belongsTo(Resident::class, 'resident_id');
    }
}
