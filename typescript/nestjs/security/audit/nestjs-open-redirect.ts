import { Controller, Get, Header, Redirect, Query } from '@nestjs/common';
import { AppService } from './app.service';

@Controller()
export class AppController {
  constructor(private readonly appService: AppService) {}

  @Get('test')
  @Redirect('https://docs.nestjs.com', 302)
  getDocs1(@Query('input') userInput) {
    if (userInput) {
      // ruleid:nestjs-open-redirect
      return { url: userInput };
    }
  }

  @Get('test-ok')
  @Redirect('https://docs.nestjs.com', 302)
  getDocs2(@Query('input') userInput) {
    return { url: 'https://docs.nestjs.com/v5/' };
  }

}
