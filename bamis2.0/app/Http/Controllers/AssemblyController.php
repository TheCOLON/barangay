<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Models\Assembly;  

class AssemblyController extends Controller
{
    //store assembly details
    public function store(Request $request) 
    {
        $attrs = $request->validate([
            'assembly_type' => 'required|string',
            'date' => 'required|date',
            'venue' => 'required|string',
            'about' => 'nullable|string',
        ]);

        $assembly = Assembly::create([
            'assembly_type' => $attrs['assembly_type'],
            'date' => $attrs['date'],
            'venue' => $attrs['venue'],
            'about' => $attrs['about'],
        ]);
        
        // try {
        //     $assembly = Assembly::create([
        //         'assembly_type' => $attrs['assembly_type'],
        //         'date' => $attrs['date'],
        //         'venue' => $attrs['venue'],
        //         'about' => $attrs['about'],
        //     ]);
        
        //     // Assuming the assembly was created successfully, you can return a success response.
        //     return response()->json(['message' => 'Assembly created successfully'], 201);
        // } catch (\Exception $e) {
        //     // If an exception occurs (e.g., validation fails or database error), return an error response.
        //     return response()->json(['message' => 'Assembly creation failed', 'error' => $e->getMessage()], 500);
        // }
    }

    public function show($id)
    
    {
        $assembly = Assembly::findOrFail($id);

    // You can return the assembly data as JSON or in a view, depending on your requirements.
    // For JSON response:
        return response()->json(['assembly' => $assembly], 200);

    // For a view:
    // return view('assemblies.show', ['assembly' => $assembly]);
    }

}
