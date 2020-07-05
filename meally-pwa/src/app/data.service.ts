import { Injectable } from '@angular/core';
import { HttpClient, HttpHeaders } from '@angular/common/http';
import { environment } from 'src/environments/environment';
import { SecurityUtil } from './utils/security.util';

@Injectable({
  providedIn: 'root'
})
export class DataService {

  public baseUrl = environment.apiEndpoint;

  constructor(private http: HttpClient) { }

  public authenticate(data: any) {
    return this.http.post(`${this.baseUrl}/User/login`, data);
  }

  public getUserByEmail(email: string) {
    return this.http.get(`${this.baseUrl}/User/email/${email}`);
  }

  public getMonthlySalesChartData() {
    return this.http.get(`${this.baseUrl}/orders`);
  }

  public getOrders() {
    let restaurantId = SecurityUtil.get().restaurant.restaurantId;
    return this.http.get(`${this.baseUrl}/order/restaurant/${restaurantId}`);
  }

  public getOrder(order: string) {
    return this.http.get(`${this.baseUrl}/order/${order}`);
  }
}
