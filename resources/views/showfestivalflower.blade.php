@extends('layouts.app')

@section('content')
<div class="container">
    <div class="row justify-content-center">
        <div class="col-md-8">
            <div class="card">
                <div class="card-header">Choose Variety</div>

                <div class="card-body">
                    <form method="POST" action="{{ route('flowerspecies') }}">
                    

                        <div class="col-md-6">
                                <select id="flower" type="text" class="form-control" name="flower"  required autocomplete="type" autofocus>
                                @foreach($flowers as $flower)
                                    <option>{{$flower['name']}}</option>
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
