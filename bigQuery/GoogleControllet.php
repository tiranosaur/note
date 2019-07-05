<?php

namespace app\modules\billing\models;

use Google\Cloud\BigQuery\BigQueryClient;


class Google
{
    public $projectID = "news-232614";
    public $dataset = "billinginfo";
    public $table = "gcp_billing_export_v1_01DE3C_8EA9DA_84CD6E";
    public $keyFilePath = __DIR__ . "/google_cloud_storage_key.json";
    public $bigQuery;


    public function __construct()
    {
        $this->bigQuery = new BigQueryClient(['projectId' => $this->projectID, "keyFilePath" => $this->keyFilePath]);
    }

    //Function for get $selectArgs between $dateFrom and $dateTo
    public function getQueryBetween($dateFrom, $dateTo,... $selectArgs){
        $selectArgs=implode(", ", $selectArgs);
        $bigQuery = $this->bigQuery;

        $query="SELECT {$selectArgs} FROM `{$this->dataset}.{$this->table}` AS main WHERE export_time BETWEEN TIMESTAMP('{$dateFrom} 00:00:00 UTC') AND TIMESTAMP('{$dateTo} 23:59:59 UTC')";

        $jobConfig = $bigQuery->query($query);
        $response = $bigQuery->runQuery($jobConfig);
        $result = array();
        if ($response->isComplete()) {
            $i = 0;
            $rows = $response->rows();
            foreach ($rows as $row) {
                array_push($result, $row);
            }
        } else {
            throw new Exception('The query failed to complete');
        }
        return $result;
    }

    //Function for get $query (Pure SQL)
    public function getQuery($query){
        $bigQuery = $this->bigQuery;

        $jobConfig = $bigQuery->query($query);
        $response = $bigQuery->runQuery($jobConfig);
        $result = array();
        if ($response->isComplete()) {
            $i = 0;
            $rows = $response->rows();
            foreach ($rows as $row) {
                array_push($result, $row);
            }
        } else {
            throw new Exception('The query failed to complete');
        }
        return $result;
    }
}
