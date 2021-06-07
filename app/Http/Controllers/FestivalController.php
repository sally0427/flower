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
        // $json_arr[] = array('name' => $out_json['Data'][0]['CropName']);
        // $json_arr[] = array('name' => $out_json['Data'][1]['CropName']);
        // $data = json_encode($json_arr);
        // return $data;
        $first = $out_json['Data'][0]['CropName'];
        $json_arr[] = array('name' => $out_json['Data'][0]['CropName']);
        for($i = 1 ; $i < count($out_json['Data']) ; $i++){
            if($first == $out_json['Data'][$i]['CropName']){
                break;
            }
            else{
                $json_arr[] = array('name' => $out_json['Data'][$i]['CropName']);
            }
        }
        
        return view('showflower', ['data' => $json_arr]);
        
    }

    public function agriProductArgPrice(Request $request)
    {   
        return $request;
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
        return $data;
        return ($data[0]['Avg_Price'] + $data[1]['Avg_Price']);
        return view('test');
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
