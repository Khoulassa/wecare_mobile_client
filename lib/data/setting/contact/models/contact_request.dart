class ContactRequest {
  String? name;
  String? message;
  String? subject;
  String? email;
  String? phone;

  ContactRequest({
    this.name,
    this.message,
    this.phone,
    this.email,
    this.subject,
  });


  Map<String,String> toJson(){
    return {
      "name": name??"",
      "message": message??"",
      "email": email??"",
      "phone": phone??'',
    };
  }
}