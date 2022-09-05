import { Component, OnInit } from '@angular/core';
import { Router } from '@angular/router';
import { AppSharedService } from '../app.shared.service';
import { HomeService } from './home.service';
import { NgbCarouselConfig } from '@ng-bootstrap/ng-bootstrap';
import { ProductModel } from '../app.models'
import { NgxSpinnerService } from 'ngx-spinner';

@Component({
  selector: 'app-home',
  templateUrl: './home.component.html',
  styleUrls: ['./home.component.less'],
  providers: [NgbCarouselConfig]
})
export class HomeComponent implements OnInit {
  productList: ProductModel[] = [];
  shopCartList: ProductModel[] = [];
  page = 1;
  pageSize = 4;

  typeSelected: string = 'ball-fussion';

  constructor(public router: Router,
    private sharedService: AppSharedService,
    private homeService: HomeService,
    config: NgbCarouselConfig,
    private spinnerService: NgxSpinnerService) {
    config.interval = 2000;
    config.keyboard = true;
    config.showNavigationArrows = true;
    config.showNavigationIndicators = true;
    config.pauseOnHover = true;
  }

  ngOnInit(): void {

    this.spinnerService.show();
    this.homeService.getProducts().subscribe((response: any) => {

      this.spinnerService.hide();
      if (response.statusCode === 200)
        this.sharedService.setProducts(response.data as ProductModel[]);
      else
        alert("An error has occured");

      this.productList = this.sharedService.getProducts();

      console.log(this.sharedService.getProducts());
    });
  }

  async addToCard(prod: ProductModel) {
    if (prod.quantity > 0) {
      this.shopCartList.push(prod);
      prod.quantity = prod.quantity - 1;
    } else {
      alert("0 items left for selected product");
    }
  }

  async goToCart() {
    this.sharedService.setShopCart(this.shopCartList);
    if (this.sharedService.getUser() == null) {
      this.router.navigateByUrl('/login');
    } else {
      if (this.shopCartList.length > 0)
        this.router.navigateByUrl('/shopcart');
      else
        alert('Please add atleast one product to cart');
    }
  }
}
