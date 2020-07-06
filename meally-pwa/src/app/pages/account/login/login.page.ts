import { Component, OnInit } from '@angular/core';
import { FormBuilder, FormGroup, Validators } from '@angular/forms';
import { LoadingController, ToastController, NavController } from '@ionic/angular';
import { DataService } from 'src/app/data.service';
import { UserModel } from 'src/app/models/user.model';
import { SecurityUtil } from 'src/app/utils/security.util';

@Component({
  selector: 'app-login',
  templateUrl: './login.page.html',
  styleUrls: ['./login.page.scss'],
})
export class LoginPage implements OnInit {

  public hide = true;
  public form: FormGroup;
  
  constructor(private fb: FormBuilder,
    private loadingCtrl: LoadingController,
    private toastCtrl: ToastController,
    private navCtrl: NavController,
    private service: DataService) {

      this.form = this.fb.group({
        username: ['', Validators.compose([
          Validators.required,
        ])],
        password: ['', Validators.compose([
          Validators.minLength(6),
          Validators.maxLength(20),
          Validators.required
        ])]
      });

    }

  ngOnInit() {
  }

  async submit() {
    if (this.form.invalid)
      return;

    const loading = await this.loadingCtrl.create({ message: 'Autenticando...' });
    loading.present();

    this
      .service
      .getUserByEmail(this.form.value.username)
      .subscribe(
        (res: UserModel) => {

          if(res.password === this.form.value.password) {
            SecurityUtil.set(res);
            this.navCtrl.navigateRoot('/');
          }

        },
        (err) => {
          this.showError('Usuário ou senha inválidos');
          
        }), () => {
          loading.dismiss();
        };

    this
      .service
      .authenticate(this.form.value)
      .subscribe(
        (res: UserModel) => {
          SecurityUtil.set(res);
          loading.dismiss();
          this.navCtrl.navigateRoot('/');
        },
        (err) => {
          this.showError('Usuário ou senha inválidos');
          loading.dismiss();
        });
  }

  async resetPassword() {
    if (this.form.controls['username'].invalid) {
      this.showError("Usuário inválido");
      return;
    }

    const loading = await this.loadingCtrl.create({ message: 'Restaurando sua senha...' });
    loading.present();
  }

  toggleHide() {
    this.hide = !this.hide;
  }

  async showError(message) {
    const error = await this.toastCtrl.create({ message: message, duration: 3000 });
    error.present();
  }

}
