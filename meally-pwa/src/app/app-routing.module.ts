import { NgModule } from '@angular/core';
import { PreloadAllModules, RouterModule, Routes } from '@angular/router';
import { FramePage } from './pages/shared/frame/frame.page';

// const routes: Routes = [
//   {
//     path: 'home',
//     loadChildren: () => import('./pages/home/home.module').then( m => m.HomePageModule)
//   },
//   {
//     path: '',
//     redirectTo: 'home',
//     pathMatch: 'full'
//   },
//   {
//     path: 'login',
//     loadChildren: () => import('./pages/account/login/login.module').then( m => m.LoginPageModule)
//   },
// ];

const routes: Routes = [
  { path: 'login', loadChildren: './pages/account/login/login.module#LoginPageModule' },
  // { path: '', loadChildren: './pages/shared/frame/frame.module#FramePageModule' },
  {
    path: '',
    component: FramePage,
    // canActivate: [AuthorizedGuard],
    children: [
      { path: '', loadChildren: './pages/home/home.module#HomePageModule' },
      { path: 'orders', loadChildren: './pages/store/orders/orders.module#OrdersPageModule' },
      { path: 'orders/:number', loadChildren: './pages/store/order-details/order-details.module#OrderDetailsPageModule' },
    ]
  },
  {
    path: 'orders',
    loadChildren: () => import('./store/orders/orders.module').then( m => m.OrdersPageModule)
  },
  {
    path: 'order-details',
    loadChildren: () => import('./store/order-details/order-details.module').then( m => m.OrderDetailsPageModule)
  },
];

@NgModule({
  imports: [
    RouterModule.forRoot(routes, { preloadingStrategy: PreloadAllModules })
  ],
  exports: [RouterModule]
})
export class AppRoutingModule { }
