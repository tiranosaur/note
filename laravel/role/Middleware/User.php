<?php

namespace App\Http\Middleware;

use Closure;
use Illuminate\Support\Facades\Auth;

class User
{
    /**
     * Handle an incoming request.
     *
     * @param \Illuminate\Http\Request $request
     * @param \Closure $next
     * @return mixed
     */
    public function handle($request, Closure $next)
    {
        $user = Auth::user();
        if (!empty($user)) {
            $role = \App\User::find($user->id)->roles()->get()->pluck('name')->toArray();
//                if(!empty($item)){
            if (in_array('user', $role)) {
                return $next($request);
            } else {
                abort(403, 'Access denied');
            }
        }
    }
}
