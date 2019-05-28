<?php
error_reporting(E_ERROR);

$arrHrefArticle = getArticleHrefListRusakov();
foreach ($arrHrefArticle  as $key => $value){
    echo "<h3>{$key}</h3>";
    echo getArticleRusakov($value);
    echo "<hr>";
    sleep(1);
}

die();

function getArticleRusakov($addrURL)
{
    if ($curl = curl_init()) {
        curl_setopt($curl, CURLOPT_URL, $addrURL);
        curl_setopt($curl, CURLOPT_RETURNTRANSFER, true);
        $str = curl_exec($curl);

        $str = (explode("<article>", $str))[1];
        $str = (explode("</article>", $str))[0];
        return $str;
    }
}

function getArticleHrefListRusakov()
{
    if ($curl = curl_init()) {
        curl_setopt($curl, CURLOPT_URL, "https://myrusakov.ru/php-osnovy.html");
        curl_setopt($curl, CURLOPT_RETURNTRANSFER, true);
        curl_setopt($curl, CURLOPT_HEADER, true);
        $str = curl_exec($curl);

        $str = (explode('<div class="main">', $str))[2];
        $str = (explode("<footer>", $str))[0];

        $href = array();
        $dom = new DOMDocument;
        $dom->loadHTML('<?xml encoding="utf-8" ?>'.$str);
        foreach ($dom->getElementsByTagName('a') as $node) {
            $href [$node->nodeValue]="https://myrusakov.ru" . $node->getAttribute("href");
        }
        return $href;
    }
}