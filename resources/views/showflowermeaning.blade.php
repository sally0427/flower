@extends('layouts.app')

@section('content')
<div class="container">
    <div class="row justify-content-center">
        <div class="col-md-8">
            <div class="card">
                <div class="card-header">Choose flower</div>

                <div class="card-body">
                    <form method="POST" action="{{ route('flowerspecies') }}">
                            
                            <div class="form-group row">

                                <div class="col-md-6">
                                        @foreach($flowers as $flower)
                                            {{$flower->name}} : {{$flower->description}}
                                            <br>
                                        @endforeach
                                </div>
                            </div>
                            <input id="flower" type="text" class="form-control " name="flower"  hidden="hidden" value="百合">
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
