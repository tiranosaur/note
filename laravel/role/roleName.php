<?php

$roleName = User::find(Auth::user()->id)->roles()->get()->pluck('name')->toArray();