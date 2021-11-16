<?php

use Symfony\Component\Form\AbstractType;
use Symfony\Component\OptionsResolver\OptionsResolver;
use Symfony\Component\HttpKernel\DependencyInjection\Extension;
use Symfony\Component\DependencyInjection\ContainerBuilder;
use Symfony\Component\DependencyInjection\Extension\PrependExtensionInterface;
use Symfony\Bundle\FrameworkBundle\Controller\AbstractController;
use Symfony\Bundle\FrameworkBundle\Controller\Controller;


class Type extends AbstractType
{
  public function configureOptions(OptionsResolver $resolver)
  {
      // ruleid: symfony-csrf-protection-disabled
    $resolver->setDefaults([
      'data_class'      => Type::class,
      'csrf_protection' => false
    ]);

    // ruleid: symfony-csrf-protection-disabled
    $resolver->setDefaults(array(
      'csrf_protection' => false
    ));


    $csrf = false;
    // ruleid: symfony-csrf-protection-disabled
    $resolver->setDefaults([
      'csrf_protection' => $csrf
    ]);

    // ok: symfony-csrf-protection-disabled
    $resolver->setDefaults([
      'csrf_protection' => true
    ]);

    // ok: symfony-csrf-protection-disabled
    $resolver->setDefaults([
      'data_class' => Type::class,
    ]);

    // ok: symfony-csrf-protection-disabled
    $resolver->setDefaults($options);
  }
}

class TestExtension extends Extension implements PrependExtensionInterface
{
  public function prepend(ContainerBuilder $container)
  {

    // ruleid: symfony-csrf-protection-disabled
    $container->prependExtensionConfig('framework', ['csrf_protection' => false,]);

    // ruleid: symfony-csrf-protection-disabled
    $container->prependExtensionConfig('framework', ['something_else' => true, 'csrf_protection' => false,]);

    $csrfOption = false;
    // ruleid: symfony-csrf-protection-disabled
    $container->prependExtensionConfig('framework', ['csrf_protection' => $csrfOption,]);

    // ruleid: symfony-csrf-protection-disabled
    $container->loadFromExtension('framework', ['csrf_protection' => false,]);

    // ok: symfony-csrf-protection-disabled
    $container->loadFromExtension('framework', ['csrf_protection' => null,]);

    // ok: symfony-csrf-protection-disabled
    $container->prependExtensionConfig('framework', ['csrf_protection' => true,]);

    // ok: symfony-csrf-protection-disabled
    $container->prependExtensionConfig('framework', ['csrf_protection' => null,]);

    // ok: symfony-csrf-protection-disabled
    $container->prependExtensionConfig('something_else', ['csrf_protection' => false,]);
  }
}

class MyController1 extends AbstractController
{
  public function action()
  {
    // ruleid: symfony-csrf-protection-disabled
    $this->createForm(TaskType::class, $task, [
      'other_option' => false,
      'csrf_protection' => false,
    ]);

    // ruleid: symfony-csrf-protection-disabled
    $this->createForm(TaskType::class, $task, array(
      'csrf_protection' => false,
    ));

    $csrf = false;
    // ruleid: symfony-csrf-protection-disabled
    $this->createForm(TaskType::class, $task, array(
      'csrf_protection' => $csrf,
    ));

      // ok: symfony-csrf-protection-disabled
    $this->createForm(TaskType::class, $task, ['csrf_protection' => true]);

    // ok: symfony-csrf-protection-disabled
    $this->createForm(TaskType::class, $task, ['other_option' => false]);

    $this->redirectToRoute('/');
  }
}
