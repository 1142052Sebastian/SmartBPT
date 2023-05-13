@extends('layouts.yourDashboard');

@section('testUser1')
<?php

    echo(Auth::user());
?>
  @endsection


