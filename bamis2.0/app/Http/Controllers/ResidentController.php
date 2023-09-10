<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Models\Resident;

class ResidentController extends Controller
{
    // Index page to list all residents
    public function index()
    {
        $residents = Resident::all();
        return view('index', compact('residents'));
    }

    // Show a specific resident
    public function show($id)
    {
        $resident = Resident::findOrFail($id);
        // return view('show', compact('resident'));
        return response()->json(['resident' => $resident], 200);
    }

    // Show the form for creating a new resident
    public function create()
    {
        return view('create');
    }

    // Store a newly created resident in the database
    public function store(Request $request)
    {
        // Validate the input
        $request->validate([
            'name' => 'required',
            'purok' => 'required',
            'age' => 'required|integer',
        ]);

        // Create a new resident
        Resident::create($request->all());

        // Redirect to the index page
        return redirect()->route('index');
    }

    // Show the form for editing a resident
    public function edit($id)
    {
        $resident = Resident::findOrFail($id);
        // return view('edit', compact('resident'));
        return response()->json(['resident' => $resident], Response::HTTP_OK);
    }

    // Update a specific resident in the database
    public function update(Request $request, $id)
    {
        // Validate the input
        $request->validate([
            'name' => 'required',
            'purok' => 'required',
            'age' => 'required|integer',
        ]);

        // Update the resident
        $resident = Resident::findOrFail($id);
        $resident->update($request->all());

        // Redirect to the index page
        return redirect()->route('index');
    }

    // Delete a specific resident from the database
    public function destroy($id)
    {
        $resident = Resident::findOrFail($id);
        $resident->delete();

        // Redirect to the index page
        return redirect()->route('index');
    }
}
