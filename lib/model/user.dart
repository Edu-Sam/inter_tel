

class User{
  String name='';
  String email='';
  String phone_number='';

  User({required this.name,required this.email,required this.phone_number});

  factory User.fromJson(Map<String,dynamic> parsedJson){
    return User(
      name: parsedJson['name'],
      email: parsedJson['email'],
      phone_number: parsedJson['phone_number']
    );
  }
}