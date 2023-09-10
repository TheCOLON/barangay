<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

return new class extends Migration
{
    /**
     * Run the migrations.
     */
    public function up(): void
    {
        Schema::create('assemblies', function (Blueprint $table) {
            $table->id(); // Auto-incrementing primary key
            $table->string('assembly_type'); // Assembly type as a string
            $table->string('date'); // Date of the assembly
            $table->string('venue'); // Venue where the assembly will be held
            $table->text('about')->nullable(); // About the assembly, as a text field (nullable)
            $table->timestamps(); // Created at and Updated at timestamps
        });
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::dropIfExists('assemblies');
    }
};
