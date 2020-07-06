import { NgModule } from '@angular/core';
import { PreloadAllModules, RouterModule, Routes } from '@angular/router';
import { FramePage } from './pages/shared/frame/frame.page';
import { AuthorizedGuard } from './guards/authorized.guard';

const routes: Routes = [
  { path: 'login', loadChildren: './pages/account/login/login.module#LoginPageModule' },
  // { path: '', loadChildren: './pages/shared/frame/frame.module#FramePageModule' },
  {
    path: '',
    component: FramePage,
    canActivate: [AuthorizedGuard],
    children: [
      { path: '', loadChildren: './pages/home/home.module#HomePageModule' },
      { path: 'orders', loadChildren: './pages/store/orders/orders.module#OrdersPageModule' },
      { path: 'orders/:number', loadChildren: './pages/store/order-details/order-details.module#OrderDetailsPageModule' },
      { path: 'queue', loadChildren: './pages/store/queue/queue.module#QueuePageModule' },
    ]
  },

];

@NgModule({
  imports: [
    RouterModule.forRoot(routes, { preloadingStrategy: PreloadAllModules })
  ],
  exports: [RouterModule]
})
export class AppRoutingModule { }
