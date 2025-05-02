<?php

namespace App\Http;

class Kernel
{
    protected $routeMiddleware = [
        // autres middlewares...
        'is_admin' => \App\Http\Middleware\IsAdmin::class,
    ];
}
