import { UserModel } from '../models/user.model';

export class SecurityUtil {

    public static set(user: UserModel) {
        const data = JSON.stringify(user);
        localStorage.setItem('meally.data', btoa(data));
    }

    public static get(): UserModel {
        const data = localStorage.getItem('meally.data');
        if (data) {
            return JSON.parse(atob(data));
        } else {
            return null;
        }
    }

    public static hasToken(): boolean {
        const user = this.get();

        if (user)
            return true;
        else
            return false;
    }

    public static isInRole(roleStr: string): boolean {
        const user = this.get();

        if (!user) 
            return false;

        if (user.role === '') 
            return false;

        // return user.roles.includes(role);
        return user.role === roleStr;
    }

    public static clear() {
        localStorage.removeItem('meally.data');
    }
}
