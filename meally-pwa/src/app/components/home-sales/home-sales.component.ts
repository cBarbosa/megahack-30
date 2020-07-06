import { Component, AfterViewInit, OnInit } from '@angular/core';
import { DataService } from 'src/app/data.service';

declare var Chart: any;

@Component({
  selector: 'app-home-sales',
  templateUrl: './home-sales.component.html',
  styleUrls: ['./home-sales.component.scss'],
})
export class HomeSalesComponent implements OnInit  {

  public data: any = {
    "labels": ["Janeiro", "Fevereiro", "Mar�o", "Abril", "Maio", "Junho"],
    "datasets": [{
      "label": "# de vendas",
      "data": [7,9,12,24,8,5],
      "backgroundColor": [
        "rgba(255, 99, 132, 0.2)",
        "rgba(54, 162, 235, 0.2)",
        "rgba(255, 206, 86, 0.2)",
        "rgba(75, 192, 192, 0.2)",
        "rgba(153, 102, 255, 0.2)",
        "rgba(255, 159, 64, 0.2)"
      ],
      "borderColor": [
        "rgba(255, 99, 132, 1)",
        "rgba(54, 162, 235, 1)",
        "rgba(255, 206, 86, 1)",
        "rgba(75, 192, 192, 1)",
        "rgba(153, 102, 255, 1)",
        "rgba(255, 159, 64, 1)"
      ],
      "borderWidth": 1
    }]
  };
  
  constructor(private service: DataService) {  }

  ngOnInit(): void {
    
  }

  // ngAfterViewInit(): void {
    // this.service
    //   .getMonthlySalesChartData()
    //   .subscribe((res) => {
    //     this.data = res;
    //     this.render();
    //   });
  // }

  render() {
    var el: any = document.getElementById('myChart');
    var ctx = el.getContext('2d');
    var myChart = new Chart(ctx, {
      type: 'bar',
      data: this.data,
      options: {
        scales: {
          yAxes: [
            {
              ticks: {
                beginAtZero: true
              }
            }
          ]
        }
      }
    });
  }

}
