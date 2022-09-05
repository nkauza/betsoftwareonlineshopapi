import { Component, OnInit } from '@angular/core';
import { Router } from '@angular/router';
import { NgbModal } from '@ng-bootstrap/ng-bootstrap';

@Component({
  selector: 'app-root',
  templateUrl: './app.component.html',
  styleUrls: ['./app.component.less']
})
export class AppComponent {
  constructor(private modalService: NgbModal,
    public router: Router) {
  }

  public open(modal: any): void {
    this.modalService.open(modal);
  }

  title = 'Bet Software Shops';

}


