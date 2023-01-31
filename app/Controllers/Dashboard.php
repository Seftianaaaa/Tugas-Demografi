<?php

namespace App\Controllers;
use Config\Services;

class Dashboard extends BaseController
{
    public function index()
    {
        $data = [
            'location'     => 'dashboard'
        ];

        return view('dashboard', $data);
    }
}