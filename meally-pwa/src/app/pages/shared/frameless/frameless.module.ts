import { NgModule } from '@angular/core';
import { CommonModule } from '@angular/common';
import { FormsModule } from '@angular/forms';

import { IonicModule } from '@ionic/angular';

import { FramelessPageRoutingModule } from './frameless-routing.module';

import { FramelessPage } from './frameless.page';

@NgModule({
  imports: [
    CommonModule,
    FormsModule,
    IonicModule,
    FramelessPageRoutingModule
  ],
  declarations: [FramelessPage]
})
export class FramelessPageModule {}
