import { Controller, Get, Header } from '@nestjs/common';
import { NestFactory } from '@nestjs/core';
import { AppService } from './app.service';
import { AppModule } from './app.module';

async function bootstrap1() {
  // ruleid:nestjs-header-cors-any
  const app = await NestFactory.create(AppModule, {cors: true});
  await app.listen(3000);
}

async function bootstrap2() {
  const app = await NestFactory.create(AppModule);
  // ruleid:nestjs-header-cors-any
  app.enableCors();
  await app.listen(3000);
}

async function bootstrap3() {
  // ruleid:nestjs-header-cors-any
  const app = await NestFactory.create(AppModule, {cors: {origin: '*'}});
  await app.listen(3000);
}

async function bootstrap4() {
  const app = await NestFactory.create(AppModule);
  // ruleid:nestjs-header-cors-any
  app.enableCors({origin: '*'});
  await app.listen(3000);
}

async function bootstrap5() {
  const app = await NestFactory.create(AppModule);
  // ok:nestjs-header-cors-any
  app.enableCors({origin: 'google.com'});
  await app.listen(3000);
}

// ruleid:nestjs-header-cors-any
@Controller()
export class AppController1 {
  constructor(private readonly appService: AppService) {}

  @Get()
  @Header('Access-Control-Allow-Origin', '*')
  testCtrl1(): string {
    return this.appService.getHello();
  }

}

// ruleid:nestjs-header-cors-any
@Controller()
export class AppController2 {
  constructor(private readonly appService: AppService) {}

  @Get()
  @Header('access-control-allow-origin', '*')
  testCtrl2(): string {
    return this.appService.getHello();
  }
}

// ok:nestjs-header-cors-any
@Controller()
export class AppController3 {
  constructor(private readonly appService: AppService) {}

  @Get()
  @Header('Access-Control-Allow-Origin', 'google.com')
  testCtrlOk(): string {
    return this.appService.getHello();
  }
}
