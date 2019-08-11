<?php

$roleName = User::find(Auth::user()->id)->roles()->get()->pluck('name')->toArray();


$articles = Article::on()->orderBy('id')->paginate(10)->toArray();
$articles = $articles['data'];
