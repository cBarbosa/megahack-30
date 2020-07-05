export class UserModel {
    constructor(
        public userId: number,
        public restaurantId: number,
        public name: string,
        public email: string,
        public photo: string,
        public role: string,
        public password: string,
        // public nickname: string,
    ) {

    }
}
