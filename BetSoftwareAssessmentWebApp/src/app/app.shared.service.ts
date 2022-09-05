import { Injectable } from '@angular/core';
import { ProductModel, UserModel } from './app.models'

@Injectable({
  providedIn: 'root'
})
export class AppSharedService {
  _userData: UserModel | null;

  _productList: ProductModel[];
  _shopCartList: ProductModel[] | null;
  constructor() {
    this._userData = null;
    this._productList = [];
    this._shopCartList = [];
  }

  setUser(val: UserModel) {
    this._userData = val;
  }

  setProducts(val: ProductModel[]) {
    this._productList = val;
  }

  setShopCart(val: ProductModel[] | null) {
    this._shopCartList = val;
  }

  getUser() {
    return this._userData;
  }

  getProducts(): ProductModel[] {
    return this._productList;
  }

  getShopCart(): ProductModel[] | null {
    return this._shopCartList;
  }
}
