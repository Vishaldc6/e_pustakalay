class User{
  int? id;
  String? first_name;
  String? last_name;
  String? phone_no;
  String? profile;
  String? email;
  String? token;

  User({
    this.id,
    this.first_name,
    this.last_name,
    this.phone_no,
    this.profile,
    this.email,
    this.token,
  });

  factory User.fromJson(Map<String,dynamic> json){
    return User(
      id: json['id'],
      first_name: json['data']['user']['first_name'],
      last_name: json['data']['user']['last_name'],
      phone_no: json['data']['user']['phone_no'],
      profile: json['data']['user']['profile'],
      email: json['data']['user']['email'],
      token: json['data']['token'],
    );
  }

}