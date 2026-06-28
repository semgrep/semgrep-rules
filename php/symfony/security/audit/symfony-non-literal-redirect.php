<?php
use Symfony\Component\HttpFoundation\RedirectResponse;

class WebAppController
{
    public function test1(): RedirectResponse
    {
        $foobar = $session->get('foobar');
        // ruleid: symfony-non-literal-redirect
        return $this->redirect($foobar);
    }

    public function test2(): RedirectResponse
    {
        $addr = $request->query->get('page', 1);
        // ruleid: symfony-non-literal-redirect
        return $this->redirect('https://'. $addr);
    }

    public function test3(): RedirectResponse
    {
        $url = $request->query->get('url');
        // ruleid: symfony-non-literal-redirect
        return new RedirectResponse($url);
    }

    public function test4(): RedirectResponse
    {
        $url = $request->query->get('url');
        $response = new RedirectResponse('/');
        // ruleid: symfony-non-literal-redirect
        $response->setTargetUrl($url);
        return $response;
    }

    public function okTest1(): RedirectResponse
    {
        $foobar = $session->get('foobar');
        // ok: symfony-non-literal-redirect
        return $this->redirectToRoute($foobar);
    }

    public function okTest2(): RedirectResponse
    {
        // ok: symfony-non-literal-redirect
        return $this->redirect('http://symfony.com/doc');
    }

    public function okTest3(): RedirectResponse
    {
        // ok: symfony-non-literal-redirect
        return $this->redirect();
    }

    public function okTest4(): RedirectResponse
    {
        // ok: symfony-non-literal-redirect
        return new RedirectResponse('http://symfony.com/doc');
    }

    public function okTest5(): RedirectResponse
    {
        $response = new RedirectResponse('/');
        // ok: symfony-non-literal-redirect
        $response->setTargetUrl('http://symfony.com/doc');
        return $response;
    }
}