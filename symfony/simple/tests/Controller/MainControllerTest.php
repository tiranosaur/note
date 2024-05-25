<?php

namespace App\Tests\Controller;

use App\Service\MainService;
use Symfony\Bundle\FrameworkBundle\Test\WebTestCase;

class MainControllerTest extends WebTestCase
{
    protected $mainServiceMock;
    protected $response = [
        "status" => "OK",
        "message" => 'Welcome to your new controller!',
    ];

    protected function setUp(): void {
        parent::setUp();

        $this->mainServiceMock = $this
            ->getMockBuilder(MainService::class)
            ->disableOriginalConstructor()
            ->getMock();
    }

    public function testHello(): void {
        $this->mainServiceMock
            ->expects($this->once())
            ->method('getHello')
            ->willReturn($this->response['message']);

        $client = static::createClient();
        $client->getContainer()->set(MainService::class, $this->mainServiceMock);

        $client->request('GET', '/hello');
        $this->assertResponseIsSuccessful();
        $responseData = $client->getResponse()->getContent();
        $this->assertSame('Welcome to your new controller!', $responseData);
    }

    public function testIndex(): void {
        $this->mainServiceMock
            ->expects($this->once())
            ->method('getHelloArray')
            ->willReturn($this->response);

        $client = static::createClient();
        $client->getContainer()->set(MainService::class, $this->mainServiceMock);

        $client->request('GET', '/');
        $this->assertResponseIsSuccessful();
        $this->assertJson($client->getResponse()->getContent());
        $responseData = json_decode($client->getResponse()->getContent(), true);
        $this->assertArrayHasKey('status', $responseData);
        $this->assertArrayHasKey('message', $responseData);
        $this->assertSame('OK', $responseData['status']);
        $this->assertSame('Welcome to your new controller!', $responseData['message']);
    }
}
