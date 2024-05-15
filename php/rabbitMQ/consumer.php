<?php

require_once __DIR__ . '/vendor/autoload.php';

use PhpAmqpLib\Connection\AMQPStreamConnection;

$exchange = 'router';
$queue = 'hello';

$connection = new AMQPStreamConnection('rabbitmq', 5672, 'guest', 'guest');
$channel = $connection->channel();

try {
    $channel->queue_declare($queue, false, false, false, false);
} catch (Exception $e) {
    error_log("Failed to declare queue: " . $e->getMessage());
}

$callback = function ($msg) {
    echo ' [x] Received ', $msg->body, "<br>";
    $msg->delivery_info['channel']->basic_ack($msg->delivery_info['delivery_tag']);
};

try {
    $channel->basic_consume($queue, '', false, true, false, false, $callback);

    while (count($channel->callbacks)) {
        $channel->wait();
    }
} catch (Exception $e) {
    error_log("Consumer failed: " . $e->getMessage());
}

$connection->close();
$channel->close();