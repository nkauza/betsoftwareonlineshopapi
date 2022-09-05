import { Injectable } from '@angular/core';
import { HttpClient, HttpHeaders } from '@angular/common/http';
import { AppModule } from '../app.module';
import { Observable } from 'rxjs';
import { UserModel } from '../app.models';

@Injectable({
  providedIn: 'root'
})
export class LoginService {

  constructor(
    public httpClient: HttpClient,
    private appModule: AppModule) {
  }

  singIn(model: UserModel): Observable<any> {

    const header = new HttpHeaders();

    header.append('Content-Type', `application/json`);
    //header.append('Authorization', `token`);

    return this.httpClient.post(this.appModule.ApiUrl + 'SignIn', model, { headers: header });
  }

  signUp(model: UserModel): Observable<any> {

    const header = new HttpHeaders();

    header.append('Content-Type', `application/json`);
    //header.append('Authorization', `token`);

    return this.httpClient.post(this.appModule.ApiUrl + 'SignUp', model, { headers: header });
  }
}
