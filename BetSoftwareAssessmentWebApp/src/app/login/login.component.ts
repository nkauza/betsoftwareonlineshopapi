import { Component, OnInit } from '@angular/core';
import { Router } from '@angular/router';
import { AppSharedService } from '../app.shared.service';
import { UserModel, ProductModel } from '../app.models';
import { LoginService } from './login.service';
import { FormGroup, Validators, FormControl } from '@angular/forms';
import { NgxSpinnerService } from 'ngx-spinner';


@Component({
  selector: 'app-login',
  templateUrl: './login.component.html',
  styleUrls: ['./login.component.less']
})
export class LoginComponent implements OnInit {
  userModel: UserModel = { userId: 0, userEmail: '', userPassword: '', userToken: '' };

  signInForm = new FormGroup({
    userEmail: new FormControl('', [
      Validators.required,
      Validators.pattern("^[a-z0-9._%+-]+@[a-z0-9.-]+\\.[a-z]{2,4}$")]),
    userPassword: new FormControl('', [
      Validators.required])
  })

  constructor(public router: Router,
    private sharedService: AppSharedService,
    private loginService: LoginService,
    private spinnerService: NgxSpinnerService) { }

  ngOnInit(): void {
    
  }

  async signIn() {
    this.spinnerService.show();
    this.loginService.singIn(this.userModel).subscribe((response: any) => {
      this.spinnerService.hide();
      if (response.statusCode === 200) {
        if (response.data.userId > 0) {
          this.sharedService.setUser(response.data);
          if ((this.sharedService.getShopCart() as ProductModel[]).length > 0)
            this.router.navigateByUrl('/shopcart');
          else
            this.router.navigateByUrl('/home');
        }
        else
          alert("Invalid login details.");
      }
      else
        alert("An error has occured");
    });
  }

  async goToRegister() {
    this.router.navigateByUrl("/register");
  }
}
