<?php

namespace app\util;

require_once __DIR__ . '../../vendor/autoload.php';

use Monolog\Logger as MonologLogger;
use Monolog\Handler\StreamHandler;

/*
    ---DEPENDENCY---
composer require monolog/monolog

    ---USING---
require __DIR__ . "/vendor/autoload.php";
require_once __DIR__ . "/util/logger.php";

use app\util\Logger;

Logger::getLogger()->debug("woooooooooooooooooooooooooooooooooooooooooooo");
*/

class Logger
{
    private static $instance = null;

    private function __construct() {
    }

    public static function getLogger(): MonologLogger {
        if (null == self::$instance) {
            self::$instance = new MonologLogger("EXAMPLE_APP_NAME");
            $stream_handler = new StreamHandler("php://stdout");
            self::$instance->pushHandler($stream_handler);
        }
        return self::$instance;
    }
}