@extends('layouts.app')

@section('content')
<div class="container">
    <div class="row justify-content-center">
        <div class="col-md-8">
            <div class="card">
                <div class="card-header">Test</div>

                <div class="card-body">

                        <div class="form-group row">

                            <div class="col-md-6">
                                    @foreach($data as $d)
                                        {{$d['CropName']}}
                                        <br>
                                    @endforeach
    
                            </div>
                        </div>
                       
                </div>
            </div>
        </div>
    </div>
</div>
@endsection
