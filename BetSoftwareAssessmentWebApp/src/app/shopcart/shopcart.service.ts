import { Injectable } from '@angular/core';
import { HttpClient, HttpHeaders } from '@angular/common/http';
import { AppModule } from '../app.module';
import { Observable } from 'rxjs';
import { OrderModel } from '../app.models';

@Injectable({
  providedIn: 'root'
})
export class ShopCartService {

  constructor(
    public httpClient: HttpClient,
    private appModule: AppModule) {
  }

  addOrder(model: OrderModel | undefined, token: string | undefined): Observable<any> {
    debugger
    const header = new HttpHeaders().append('Authorization', `Basic ${token}`);
    header.append('Content-Type', `application/json`);

    return this.httpClient.post(this.appModule.ApiUrl + 'AddOrder', model, { headers: header });
  }
}
