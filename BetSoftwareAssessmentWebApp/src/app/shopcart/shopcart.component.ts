import { Component, OnInit } from '@angular/core';
import { OrderModel, ProductModel } from '../app.models';
import { AppSharedService } from '../app.shared.service';
import { Router } from '@angular/router';
import { ShopCartService } from './shopcart.service';
import { NgxSpinnerService } from 'ngx-spinner';

@Component({
  selector: 'app-shopcard',
  templateUrl: './shopcart.component.html',
  styleUrls: ['./shopcart.component.less']
})
export class ShopcardComponent implements OnInit {
  Order: OrderModel | undefined;
  typeSelected: string = 'ball-fussion';
  subTotal: number = 0;
  total: number = 0;
  orderSubmitted: boolean = false;
  orderNumber: number | undefined;

  constructor(public router: Router,
    private shareService: AppSharedService,
    private shopCartService: ShopCartService,
    private spinnerService: NgxSpinnerService) { }

  ngOnInit(): void {

    if (this.shareService.getUser() == null)
      this.router.navigateByUrl('/login');
    else {
      this.Order = { userId: this.shareService.getUser()?.userId, orderItems: [] };

      let Products = this.shareService.getShopCart() as ProductModel[];

      Products.forEach((item, index) => {
        this.subTotal = this.subTotal + item.productPrice;

        let orderItem = this.Order?.orderItems.filter(s => s.productId == item.productId)[0];

        if (orderItem != null) {
          orderItem.quantity = orderItem.quantity + 1;
          orderItem.productPrice = orderItem.productPrice + item.productPrice;
        }
        else
          this.Order?.orderItems.push({ productId: item.productId, productName: item.productName, quantity: 1, productImage: item.productImage, productPrice: item.productPrice });
      });

      this.subTotal = Number(this.subTotal.toFixed(2));
      this.total = Number((this.subTotal + (this.subTotal * 0.15)).toFixed(2));
    }
  }

  async goToHomePage() {
    this.shareService.setShopCart(null)
    this.router.navigateByUrl('/home');
  }

  async submitOrder() {
    let token = this.shareService.getUser()?.userToken;
    this.spinnerService.show();
    this.shopCartService.addOrder(this.Order, token).subscribe((response: any) => {
      this.spinnerService.hide();
      if (response.statusCode === 200) {
        if (response.data > 0) {
          this.orderNumber = response.data;
          this.orderSubmitted = true;
          //alert("Order successfully submited. Your Order number is " + response.data);
          //this.router.navigateByUrl('/shopcart');
        }
        else
          alert("Invalid login details.");
      }
      else
        alert("An error has occured");
    });
  }
}
