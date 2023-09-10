<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;

class AttendanceController extends Controller
{
     // Get attendance data by ID
    public function show($id)
    {
        $attendance = Attendance::find($id);

        if (!$attendance) {
            return response()->json(['message' => 'Attendance not found'], 404);
        }

        return response()->json($attendance);
    }

    // Store attendance data
    public function store(Request $request)
    {
        $request->validate([
            'assembly_id' => 'required|integer',
            'resident_id' => 'required|integer',
            // Add validation rules for other fields as needed
        ]);

        $attendance = Attendance::create([
            'assembly_id' => $request->input('assembly_id'),
            'resident_id' => $request->input('resident_id'),
            // Add other fields here as needed
        ]);

        return response()->json($attendance, 201);
    }
}

