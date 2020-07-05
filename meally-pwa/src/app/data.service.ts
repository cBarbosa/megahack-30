import { Injectable } from '@angular/core';
import { HttpClient, HttpHeaders } from '@angular/common/http';
import { environment } from 'src/environments/environment';

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
    return this.http.get(`${this.baseUrl}/v1/reports/ms`);
  }

  public getOrders() {
    return this.http.get(`${this.baseUrl}/orders`);
  }

  public getOrder(order: string) {
    return this.http.get(`${this.baseUrl}/orders/${order}`);
  }
}
