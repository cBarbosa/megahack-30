import { NgModule } from '@angular/core';
import { CommonModule } from '@angular/common';
import { IonicModule } from '@ionic/angular';
import { LoadingComponent } from './loading/loading.component';
import { NavbarComponent } from './navbar/navbar.component';
import { OrderListComponent } from './order-list/order-list.component';
import { OrderStatusBadgeComponent } from './order-status-badge/order-status-badge.component';
import { UserCardComponent } from './user-card/user-card.component';
import { QueueListComponent } from './queue-list/queue-list.component';
import { HomeSalesComponent } from './home-sales/home-sales.component';

@NgModule({
  declarations: [
    NavbarComponent,
    LoadingComponent,
    OrderListComponent,
    OrderStatusBadgeComponent,
    // MonthlySalesChartComponent,
    UserCardComponent,
    QueueListComponent,
    HomeSalesComponent,
  ],
  imports: [
    CommonModule,
    IonicModule,
  ],
  exports: [
    NavbarComponent,
    LoadingComponent,
    OrderListComponent,
    OrderStatusBadgeComponent,
    // MonthlySalesChartComponent,
    UserCardComponent,
    QueueListComponent,
    HomeSalesComponent,
  ]
})
export class ComponentsModule { }
