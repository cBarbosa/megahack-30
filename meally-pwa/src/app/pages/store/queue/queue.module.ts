import { NgModule } from '@angular/core';
import { CommonModule } from '@angular/common';
import { FormsModule } from '@angular/forms';

import { IonicModule } from '@ionic/angular';

import { QueuePageRoutingModule } from './queue-routing.module';

import { QueuePage } from './queue.page';
import { ComponentsModule } from 'src/app/components/components.component';

@NgModule({
  imports: [
    CommonModule,
    FormsModule,
    IonicModule,
    ComponentsModule,
    QueuePageRoutingModule
  ],
  declarations: [QueuePage]
})
export class QueuePageModule {}
