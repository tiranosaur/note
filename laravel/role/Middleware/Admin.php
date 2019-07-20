<?php

namespace App\Http\Middleware;

use App\Role;
use App\User;
use Closure;
use Illuminate\Support\Facades\Auth;

class Admin
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
            $role = User::find($user->id)->roles()->get()->pluck('name')->toArray();
            if (in_array('admin', $role)) {
                return $next($request);
            } else {
                abort(403, 'Access denied');
            }
        }
    }
}
