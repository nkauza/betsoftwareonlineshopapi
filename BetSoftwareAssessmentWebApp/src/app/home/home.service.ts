import { Injectable } from '@angular/core';
import { HttpClient, HttpHeaders } from '@angular/common/http';
import { AppModule } from '../app.module';
import { Observable } from 'rxjs';

@Injectable({
  providedIn: 'root'
})
export class HomeService {

  constructor(
    public httpClient: HttpClient,
    private appModule: AppModule) {
  }

  getProducts(): Observable<any> {

    const header = new HttpHeaders();
    //header.append('Authorization', `token`);

    return this.httpClient.get(this.appModule.ApiUrl + 'Product', { headers: header });
  }
}
