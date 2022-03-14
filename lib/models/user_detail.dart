


class UserDetail{
  // final String role;
  
  final String uid;
  final String name;
  final String email;
  final String phone;
  final String address;

  UserDetail( {
    required this.uid,
    required this.name,
    required this.email,
    required this.address,
    required this.phone,
     
  });
  static UserDetail fromJson(Map<String,dynamic> json)=>UserDetail(
    uid: json['uid'], 
    name: json['name'], 
    email: json['email'],
     address: json['address'],
      phone: json['phone']
  );
}

