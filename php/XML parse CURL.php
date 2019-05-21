<?php

$data=$data = array(
    "firstName" => "Vasya",
    "lastName" => "Pupkin",
    "dateOfBirth" => "1984-07-31",
    "Salary"    	=> "1000",
    "creditScore" => "good"
);

$url='https://www.google.com';
xmlRequest($url, $data);
jsonRequest($url, $data);

function xmlRequest($url, $data){
    $xml = new SimpleXMLElement('<userInfo version="1.6"/>');
    array_walk_recursive($data, array ($xml, 'addChild'));
    $data_string=$xml->asXML();

    $curl = curl_init($url);
    curl_setopt($curl, CURLOPT_CUSTOMREQUEST, "POST");
    curl_setopt($curl, CURLOPT_POSTFIELDS, $data_string);
    curl_setopt($curl, CURLOPT_RETURNTRANSFER, true);
    curl_setopt ($curl, CURLOPT_HTTPHEADER, array(
        "Content-Type: text/xml"));
    $result = curl_exec($curl);
    $res=(array)simplexml_load_string($result);
   /* $res0=(array)simplexml_load_string("<?xml version=\"1.0\" encoding=\"UTF-8\"?>
                                        <userInfo version=\"1.6\">
                                          <returnCode>1</returnCode>
                                          <returnCodeDescription>SUCCESS</returnCodeDescription>
                                          <transactionId>AC158457A86E711D0000016AB036886A03E7</transactionId>
                                        </userInfo>
                                        ");*/
    echo $res['returnCodeDescription'];
    curl_close($curl);
}

function jsonRequest($url, $data){
    $data_string = json_encode($data);
    $curl = curl_init($url);
    curl_setopt($curl, CURLOPT_CUSTOMREQUEST, "POST");
    curl_setopt($curl, CURLOPT_POSTFIELDS, $data_string);
    curl_setopt($curl, CURLOPT_RETURNTRANSFER, true);
    curl_setopt($curl, CURLOPT_HTTPHEADER, array(
        'Content-Type: application/json', 'Content-Length: ' . strlen($data_string))
    );
    $result = curl_exec($curl);

    $res = (array)json_decode($result);
//    $res = (array)json_decode('{"SubmitDataResult":"success"}');
    echo $res['SubmitDataResult'];
    curl_close($curl);
}

function array_to_xml($array, $level=1) {
    $xml = '';
    foreach ($array as $key=>$value) {
        $key = strtolower($key);
        if (is_object($value)) {$value=get_object_vars($value);}// convert object to array

        if (is_array($value)) {
            $multi_tags = false;
            foreach($value as $key2=>$value2) {
                if (is_object($value2)) {$value2=get_object_vars($value2);} // convert object to array
                if (is_array($value2)) {
                    $xml .= str_repeat("\t",$level)."<$key>\n";
                    $xml .= array_to_xml($value2, $level+1);
                    $xml .= str_repeat("\t",$level)."</$key>\n";
                    $multi_tags = true;
                } else {
                    if (trim($value2)!='') {
                        if (htmlspecialchars($value2)!=$value2) {
                            $xml .= str_repeat("\t",$level).
                                "<$key2><![CDATA[$value2]]>". // changed $key to $key2... didn't work otherwise.
                                "</$key2>\n";
                        } else {
                            $xml .= str_repeat("\t",$level).
                                "<$key2>$value2</$key2>\n"; // changed $key to $key2
                        }
                    }
                    $multi_tags = true;
                }
            }
            if (!$multi_tags and count($value)>0) {
                $xml .= str_repeat("\t",$level)."<$key>\n";
                $xml .= array_to_xml($value, $level+1);
                $xml .= str_repeat("\t",$level)."</$key>\n";
            }

        } else {
            if (trim($value)!='') {
                echo "value=$value<br>";
                if (htmlspecialchars($value)!=$value) {
                    $xml .= str_repeat("\t",$level)."<$key>".
                        "<![CDATA[$value]]></$key>\n";
                } else {
                    $xml .= str_repeat("\t",$level).
                        "<$key>$value</$key>\n";
                }
            }
        }
    }
    return $xml;
}