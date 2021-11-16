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

}
