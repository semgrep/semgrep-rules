<?php
namespace symfony;
use Symfony\Component\HttpFoundation\Response;
use Symfony\Component\HttpFoundation\Response as FooResponse;

// ruleid: symfony-permissive-cors
$response = new Response('content', Response::HTTP_OK, ['Access-Control-Allow-Origin' => '*']);

// ruleid: symfony-permissive-cors
$response = new Response('content', Response::HTTP_OK, Array('Access-Control-Allow-Origin' => '*'));

// ruleid: symfony-permissive-cors
$response = new response('content', Response::HTTP_OK, Array('Access-Control-Allow-Origin' => '*'));

// ruleid: symfony-permissive-cors
$response = new FooResponse('content', Response::HTTP_OK, ['Access-Control-Allow-Origin' => '*']);


$headers = ['Access-Control-Allow-Origin' => '*'];
// ruleid: symfony-permissive-cors
$response = new Response('content', Response::HTTP_OK, $headers);


// ruleid: symfony-permissive-cors
$response->headers->set('  access-control-allow-origin  ', '  *  ');



$safe = ['foo' => 'bar'];
// ok: symfony-permissive-cors
$response = new Response('content', Response::HTTP_OK, $safe);

// ok: symfony-permissive-cors
$response = new Response('content', Response::HTTP_OK, ['Access-Control-Allow-Origin' => 'https://www.example.com']);

// ok: symfony-permissive-cors
$response = new Response('content', Response::HTTP_OK, ['Other-Property' => '*']);

// ok: symfony-permissive-cors
$response = new Foo('content', Response::HTTP_OK, ['Access-Control-Allow-Origin' => '*']);

// ok: symfony-permissive-cors
$response->headers->set('Access-Control-Allow-Origin', 'foo');

// ok: symfony-permissive-cors
$response->headers->set('Other-Property', '*');
