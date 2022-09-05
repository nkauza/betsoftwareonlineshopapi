import { Component, OnInit } from '@angular/core';
import { Router } from '@angular/router';
import { LoginService } from '../login/login.service';
import { UserModel, ProductModel } from '../app.models';
import { AppSharedService } from '../app.shared.service';
import { FormGroup, FormControl, Validators, AbstractControl, ValidationErrors, ValidatorFn } from '@angular/forms';
import { NgxSpinnerService } from 'ngx-spinner';

@Component({
  selector: 'app-register',
  templateUrl: './register.component.html',
  styleUrls: ['./register.component.less']
})
export class RegisterComponent implements OnInit {

  userModel: UserModel = { userId: 0, userEmail: '', userPassword: '', userToken: '' };
  confirmPwd: string = '';
  typeSelected: string = 'ball-fussion';

  signUpForm = new FormGroup({
    userEmail: new FormControl('', [
      Validators.required,
      Validators.pattern("^[a-z0-9._%+-]+@[a-z0-9.-]+\\.[a-z]{2,4}$")]),
    confirmPassword: new FormControl('', [
      Validators.required]),
    userPassword: new FormControl('', [
      Validators.required,
      Validators.minLength(6)])
  },
    [CustomValidators.MatchValidator('userPassword', 'confirmPassword')]);


  constructor(public router: Router,
    private sharedService: AppSharedService,
    private loginService: LoginService,
    private spinnerService: NgxSpinnerService) { }

  ngOnInit(): void {
  }

  async signUp() {
    this.spinnerService.show();
    this.loginService.signUp(this.userModel).subscribe((response: any) => {
      this.spinnerService.hide();
      if (response.statusCode === 200) {
        this.sharedService.setUser(response.data);

        if ((this.sharedService.getShopCart() as ProductModel[]).length > 0)
          this.router.navigateByUrl('/shopcart');
        else
          this.router.navigateByUrl('/home');
      }
      else
        alert("An error has occured");
    });
  }

  async goToLogin() {
    this.router.navigateByUrl("/login");
  }

  get passwordMatchError() {
    return (
      this.signUpForm.getError('mismatch') &&
      this.signUpForm.get('confirmPassword')?.touched
    );
  }
}

export class CustomValidators {
  static MatchValidator(source: string, target: string): ValidatorFn {
    return (control: AbstractControl): ValidationErrors | null => {
      const sourceCtrl = control.get(source);
      const targetCtrl = control.get(target);

      return sourceCtrl && targetCtrl && sourceCtrl.value !== targetCtrl.value
        ? { mismatch: true }
        : null;
    };
  }
}
