<?php

namespace App\Http\Controllers;

use App\Festival;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;
class FestivalController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function festival2crop(Request $request)
    {
        $flower = DB::table('festivals')->get('flower');
        // return $flower[0]->flower;
        $api_url = "https://agridata.coa.gov.tw/api/v1/AgriProductsTransType/?";
        $data_array = array("Start_time"=>"107.07.10", "End_time"=>"107.07.10", "CropName"=>$flower[0]->flower);
        $ch = curl_init();
        curl_setopt($ch, CURLOPT_URL, $api_url . http_build_query($data_array));
        curl_setopt($ch, CURLOPT_RETURNTRANSFER, true);
        $output = curl_exec($ch);
        curl_close($ch);
        
        $out_json = json_decode($output, true);
        $data = $out_json['Data'];
        // return $data;
        // for($i = 0 ; $i < count($out_json['Data']) ; $i++){
        //     $array[] = $out_json['Data'][$i]['CropName'];
        // };
        
        return view('test2', ['data' => $data]);
        
    }

    public function test()
    {
        return view('test');
    }

    /**
     * Show the form for creating a new resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function create()
    {
        //
    }

    /**
     * Store a newly created resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return \Illuminate\Http\Response
     */
    public function store(Request $request)
    {
        //
    }

    /**
     * Display the specified resource.
     *
     * @param  \App\Festival  $festival
     * @return \Illuminate\Http\Response
     */
    public function show(Festival $festival)
    {
        //
    }

    /**
     * Show the form for editing the specified resource.
     *
     * @param  \App\Festival  $festival
     * @return \Illuminate\Http\Response
     */
    public function edit(Festival $festival)
    {
        //
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  \App\Festival  $festival
     * @return \Illuminate\Http\Response
     */
    public function update(Request $request, Festival $festival)
    {
        //
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  \App\Festival  $festival
     * @return \Illuminate\Http\Response
     */
    public function destroy(Festival $festival)
    {
        //
    }
}
