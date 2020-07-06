import { Component, OnInit } from '@angular/core';
import { NavController } from '@ionic/angular';
import { DataService } from 'src/app/data.service';

@Component({
  selector: 'app-queue-list',
  templateUrl: './queue-list.component.html',
  styleUrls: ['./queue-list.component.scss'],
})
export class QueueListComponent implements OnInit {

  public queue: any[] = null;

  constructor(
    private navCtrl: NavController,
    private service: DataService) { }

  ngOnInit() {
    this
      .service
      .getQueue()
      .subscribe((res: any) => {
        this.queue = res;
      });
  }

}
