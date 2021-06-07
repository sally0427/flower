@extends('layouts.app')

@section('content')
<div class="container">
    <div class="row justify-content-center">
        <div class="col-md-8">
            <div class="card">
                <div class="card-header">Choose Variety</div>

                <div class="card-body">
                    <form method="POST" action="{{ route('agriProductArgPrice') }}">
                        @csrf

                        <div class="col-md-6">
                                <select id="Variety" type="text" class="form-control" name="Variety"  required autocomplete="type" autofocus>
                                @foreach($data as $variety)
                                    <option>{{$variety['name']}}</option>
                                @endforeach
                                </select>
                        </div>
                        
                        <div class="form-group row mb-0">
                            <div class="col-md-6 offset-md-4">
                                <button type="submit" class="btn btn-primary">
                                    Confirm
                                </button>
                            </div>
                        </div>

                    </form>
                </div>
            </div>
        </div>
    </div>
</div>
@endsection
