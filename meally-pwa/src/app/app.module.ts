import { NgModule } from '@angular/core';
import { BrowserModule } from '@angular/platform-browser';
import { RouteReuseStrategy } from '@angular/router';

import { IonicModule, IonicRouteStrategy } from '@ionic/angular';

import { AppComponent } from './app.component';
import { AppRoutingModule } from './app-routing.module';
import { FramePage } from './pages/shared/frame/frame.page';
import { ComponentsModule } from './components/components.component';
import { AuthorizedGuard } from './guards/authorized.guard';
import { HttpClientModule } from '@angular/common/http';

@NgModule({
  declarations: [
    AppComponent,
    FramePage
  ],
  entryComponents: [],
  imports: [ ComponentsModule, BrowserModule, HttpClientModule, IonicModule.forRoot(), AppRoutingModule ],
  providers: [
    AuthorizedGuard,
    { provide: RouteReuseStrategy, useClass: IonicRouteStrategy }
  ],
  bootstrap: [AppComponent]
})
export class AppModule {}
