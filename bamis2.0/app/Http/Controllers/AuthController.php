<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;
use App\Models\User;  
//  add this

class AuthController extends Controller
{
    //validations
    public function register(Request $request)
    {
        $attrs = $request ->validate([
            'name' => 'required|string',
            'email' => 'required|email|unique:users,email',
            'password' => 'required|min:6|confirmed',
        ]);

        // create user
        $user = User::create([
            'name' => $attrs ['name'],
            'email' => $attrs ['email'],
            'password' => bcrypt ($attrs ['password']) 
        ]);

        // returmn user & token in response
        return response ([
            'user' => $user,
            'token' => $user->createToken('secret')->plainTextToken
        ]);
    }

    // login user

    // public function login(Request $request)
    // {
    //     $attrs = $request ->validate([

    //         'email' => 'required|email|unique:users,email',
    //         'password' => 'required|min:6|confirmed',
    //     ]);

    //     // attempt login
    //     if(!Auth::attempt($attrs))
    //     {
    //         return response ([
    //             'message' => 'Invalid Credentials.'
    //         ], 403);
    //     }

        
    //     // returmn user & token in response
    //     return response ([
    //         'user' => auth()->user(),
    //         'token' => auth()-> user()->createToken('secret')->plainTextToken
    //     ], 200);
    // }

    public function login(Request $request)
{
    // Validate the incoming request data
    $request->validate([
        'email' => 'required|email',
        'password' => 'required|min:6',
    ]);

    // Attempt to authenticate the user
    if (!Auth::attempt($request->only('email', 'password'))) {
        // Authentication failed, return an error response
        return response([
            'message' => 'Invalid Credentials.',
        ], 403);
    }

    // Authentication succeeded, generate and return an API token
    $user = Auth::user();
    $token = $user->createToken('api-token')->plainTextToken;

    return response([
        'user' => $user,
        'token' => $token,
    ], 200);
}

    // logout user

    // public function logout()
    // {
    //     auth()->tokens()->delete ();
    //     return response([
    //         'message' => 'Logout Success'
    //     ], 200);
    // }

    public function logout()
{
    // Revoke the current user's tokens
    $user = Auth::user();
    $user->tokens->each(function ($token, $key) {
        $token->delete();
    });

    return response(['message' => 'Logout Success'], 200);
}


    // gwt user details
    public function userDetails ()
    {
        return response([
            'user' => auth()->user()
        ], 200);
    }
}
