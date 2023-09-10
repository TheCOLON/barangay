<?php

use Illuminate\Http\Request;
use Illuminate\Support\Facades\Route;
use App\Http\Controllers\AuthController; 
use App\Http\Controllers\AssemblyController; 
use App\Http\Controllers\AttendanceController; 
use App\Http\Controllers\ResidentController; 


/*
|--------------------------------------------------------------------------
| API Routes
|--------------------------------------------------------------------------
|
| Here is where you can register API routes for your application. These
| routes are loaded by the RouteServiceProvider and all of them will
| be assigned to the "api" middleware group. Make something great!
|
*/

// Route::middleware('auth:sanctum')->get('/user', function (Request $request) {
//     return $request->user();
// });

Route::post('/register', [AuthController::class, 'register']);
Route::post('/login', [AuthController::class, 'login']);

Route::post('/assembly', [AssemblyController::class, 'store']);  //store assembly details
Route::get('/assembly/{id}', [AssemblyController::class, 'show']);  //get single assembly type

Route::get('/attendance/{id}', [AttendanceController::class, 'show']); // Route to fetch attendance data by ID
Route::post('/attendance', [AttendanceController::class, 'store']); // Route to save attendance data


// Route to display a list of residents
Route::get('/residents', [ResidentController::class, 'index'])->name('index');
Route::get('/residents/create', [ResidentController::class, 'create'])->name('create'); // Route to display the create resident form
Route::post('/residents', [ResidentController::class, 'store'])->name('store');// Route to store a new resident in the database
Route::get('/residents/{id}', [ResidentController::class, 'show'])->name('show'); // Route to display a specific resident
Route::get('/residents/{id}/edit', [ResidentController::class, 'edit'])->name('edit'); // Route to display the edit resident form
Route::put('/residents/{id}', [ResidentController::class, 'update'])->name('update'); // Route to update a specific resident in the database
Route::delete('/residents/{id}', [ResidentController::class, 'destroy'])->name('destroy');  // Route to delete a specific resident from the database



// protected routes
Route::group(['middleware' => ['auth:sanctum']], function() {
    // usrs
    Route::post('/logout', [AuthController::class, 'logout']);
    Route::get('/userDetails', [AuthController::class, 'userDetails']);


    // register assembly
    // Route::get('/assembly', [AssemblyController::class, 'index']); //all assembly
  
    // Route::put('/assembly/{id}', [AssemblyController::class, 'update']);  //update register
    // Route::delete('/assembly/{id}', [AssemblyController::class, 'delete']);  //delete
  


});
