class SignInRequest {
   String email;
   String passWord;
  String? deviceToken;

 SignInRequest({required this.email, required this.passWord,this.deviceToken});

   Map<String, String> toJson() {
    return {

      "email":email.toString(),
      "password": passWord.toString(),
     "device_token": deviceToken.toString(),

    };
  }
}

class SignUpRequest {
  final String email;
  final String passWord;
  final String name;
  final String cityId;
  final String phone;
  final String? code;
 late final String? deviceToken;

  SignUpRequest(
      {required this.email,
      required this.passWord,
      required this.name,
      required this.phone,
      required this.cityId,
      this.code});


  Map<String, String> toJson() {
    return  {
      "name": name,
      "phone": phone,
      "email": email,
      "password": passWord,
      "city_id": cityId.toString(),
      "device_token": deviceToken.toString()
    };

  }
  Map<String, String> toJsonCode() {
    return  {
      "name": name,
      "phone": phone,
      "email": email,
      "password": passWord,
      "city_id": cityId.toString(),
      "device_token": deviceToken.toString(),
      "code":code!
    };

  }

}

class CheckPassCodeRequest {
  final String email;

  final String code;

  const CheckPassCodeRequest({required this.email, required this.code});
  Map<String, dynamic> toJson() {
    return  {

      "email": email,
      "code":code,

    };
}}
