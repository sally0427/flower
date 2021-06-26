<?php

namespace App\Http\Controllers;

use App\Festival;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;
use Datetime;
class FestivalController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */

    public function hottestFlower(Request $request){
        /* calc searching range */
        $taiwan_datetime = (new DateTime("now"))->modify("-1911 years");
        $now_date = ltrim($taiwan_datetime->format("Y.m.d"),"0");
        $taiwan_datetime->modify("-7 days");
        $search_begin_date = ltrim($taiwan_datetime->format("Y.m.d"),"0");

        /* call api */
        $api_url = "https://agridata.coa.gov.tw/api/v1/AgriProductsTransType/?";
        $search_flower = array("玫瑰", "滿天星", "繡球花", "鬱金香", "睡蓮", "大菊", "小菊", "百合", "海芋", "茉莉", "康乃馨", "劍蘭", "蝴蝶蘭");
        $flower_recent_quantity = array();
        /* search by each flower in list, sum up the quantity */
        foreach ($search_flower as $flower) {
            $data_array_ = array("Start_time"=>$search_begin_date, "End_time"=>$now_date, "CropName"=>$flower);
            $ch = curl_init();
            curl_setopt($ch, CURLOPT_URL, $api_url . http_build_query($data_array_));
            curl_setopt($ch, CURLOPT_RETURNTRANSFER, true);
            $output = curl_exec($ch);
            curl_close($ch);

            $out_json = json_decode($output, true);
            $quantity_sum = 0;
            foreach ($out_json["Data"] as $sum_index) {
                $quantity_sum += $sum_index["Trans_Quantity"];
            }
            $flower_recent_quantity[$flower] = $quantity_sum;
        }
        /* sorting and print the first three item */
        arsort($flower_recent_quantity);
        // print_r($flower_recent_quantity);
        $return_str = "";
        for ($i = 0; $i < 3; $i++) {
            $return_str = $return_str . array_keys($flower_recent_quantity)[$i] . " ";
        }

        return $return_str;
    }

    
    public function upcomingfestival()
    {   
        // find upcoming festivals
        $festivals = DB::table('festivals')->get();
        foreach($festivals as $festival){
            $date_str = explode('-', $festival->date);
            if($date_str[1] == date("m")){
                $festival_arr[] = array('name' => $festival->name);
            }
        }
        return $festival_arr;
        // return view('showfestivals', ['festivals' => $festival_arr]);
    }

    public function festival2flower(Request $request)
    {
        // return $request;
        // $meaning = DB::table('festivals')->where('name', $request->festival)->get('meaning');
        // return $meaning[0]->meaning;
        $flowers = DB::table('festivals')->where('name', $request->festival)->get('flower');
        $flowers_str_arr = explode('，', $flowers[0]->flower);
        for($i = 0 ; $i < count($flowers_str_arr) ; $i++){
            $meaning = DB::table('festivals')->where('name', $request->festival)->get('meaning');
            $image = DB::table('festivals')->where('name', $request->festival)->get('image');
            $flowers_arr[] = array('name' => $flowers_str_arr[$i], 'meaning' => $meaning[0]->meaning, 'img' => $image[0]->image);
        }
        return $flowers_arr;
        // return view('showfestivalflower', ['flowers' => $flowers_arr]);
    }
    
    public function flowerspecies(Request $request)
    {   
        // return $request;
        // $flowers = DB::table('festivals')->where('name', $request->festival)->get('flower');
        // return $flowers[0]->flower;
        // $flowers_arr = explode('，', $flowers[0]->flower);
        // return $flowers_arr;

        /* calc searching range */
        $taiwan_datetime = (new DateTime("now"))->modify("-1911 years");
        $now_date = ltrim($taiwan_datetime->format("Y.m.d"),"0");
        $taiwan_datetime->modify("-7 days");
        $search_begin_date = ltrim($taiwan_datetime->format("Y.m.d"),"0");

        /* call api */
        
        $api_url = "https://agridata.coa.gov.tw/api/v1/AgriProductsTransType/?";
        $data_array = array("Start_time"=>$search_begin_date, "End_time"=>$now_date, "CropName"=>$request->flower);
        $ch = curl_init();
        curl_setopt($ch, CURLOPT_URL, $api_url . http_build_query($data_array));
        curl_setopt($ch, CURLOPT_RETURNTRANSFER, true);
        $output = curl_exec($ch);
        curl_close($ch);
        
        $out_json = json_decode($output, true);
        $alldata = $out_json['Data'];
        // return $data;
        // $json_arr[] = array('name' => $out_json['Data'][0]['CropName']);
        // $json_arr[] = array('name' => $out_json['Data'][1]['CropName']);
        
        // return $data;
        // $i = 0;
        // $first = $out_json['Data'][$i]['CropName'];
        
        
        // while($first == '休市'){
        //     $i++;
        //     $first = $out_json['Data'][$i]['CropName'];
        // }
        // $json_arr[] = array('name' => $out_json['Data'][$i]['CropName']);
        
        
        // for($j = $i ; $j < count($out_json['Data']) ; $j++){
        //     if($first == $out_json['Data'][$j]['CropName']){
        //         continue;
        //     }
        //     elseif($out_json['Data'][$j]['CropName'] == '休市'){
        //         continue;
        //     }
        //     else{
        //         $json_arr[] = array('name' => $out_json['Data'][$j]['CropName']);
        //     }
        // }
        $dict = array();
        foreach($alldata as $data){
            $dict[$data['CropName']] = 1;
        }
        
        foreach(array_keys($dict) as $CropName){
            if($CropName != '休市'){
                $CropName_arr[] = array('name' => $CropName);
            }
            else{
                continue;
            }
        }
        return $CropName_arr;
        // return view('showflowerspecies', ['flowerspecies' => $CropName_arr]);
        
    }

    public function flowerArgPrice(Request $request)
    {   
        // return $request;
        $flower = $request->species;
        /* calc searching range */
        $taiwan_datetime = (new DateTime("now"))->modify("-1911 years");
        $now_date = ltrim($taiwan_datetime->format("Y.m.d"),"0");
        $taiwan_datetime->modify("-7 days");
        $search_begin_date = ltrim($taiwan_datetime->format("Y.m.d"),"0");

        /* call api */
        $api_url = "https://agridata.coa.gov.tw/api/v1/AgriProductsTransType/?";
        $data_array = array("Start_time"=>$search_begin_date, "End_time"=>$now_date, "CropName"=>$flower);
        $ch = curl_init();
        curl_setopt($ch, CURLOPT_URL, $api_url . http_build_query($data_array));
        curl_setopt($ch, CURLOPT_RETURNTRANSFER, true);
        $output = curl_exec($ch);
        curl_close($ch);
        
        $out_json = json_decode($output, true);
        $data = $out_json['Data'];
        $amq = 0;
        $allquantity = 0;
        foreach($data as $i){
            $amq = $amq + ($i['Avg_Price'] * $i['Trans_Quantity']);
        }
        foreach($data as $j){
            $allquantity = $allquantity + $j['Trans_Quantity'];
        }
        
        $argPrice = ($amq / $allquantity);
        return $argPrice;
    }
    // flowermeaning 要改成POST
    public function flowermeaning(Request $request)
    {   
        $label = $request->label;
        
        if(DB::table('meanings')->where([
            ['label', '=', $label],
            ['name', 'LIKE', '%'.$request->color.'%'],
        ])->get() != '[]'){
            $flowers = DB::table('meanings')->where([
                ['label', '=', $label],
                ['name', 'LIKE', '%'.$request->color.'%'],
            ])->get();
            // $request = "1";
            // return $request;
            return $flowers;
        }
        else{
            $flowers = DB::table('meanings')->where([
                ['label', '=', $label],
                ['name', $label],
            ])->get();
            // $request = "2";
            // return $request;
            return $flowers;
        }
        
        
        // return view('showflowermeaning', ['flowers' => $flowers]);
    }

    public function getImage(Request $request)
    {
        $label = $request->label;
        $image = DB::table('meanings')->where('label', '百合')->get('image');

        return $image;
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
