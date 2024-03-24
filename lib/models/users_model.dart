/// Represents a user in the application.
class UsersModel {
  String? fullName; 
  String? username; 
  String? email; 
  String? country;
  String? id;

  UsersModel({this.fullName, this.username, this.email, this.country, this.id});

 factory UsersModel.fromJson(Map<String, dynamic> json) {
    return UsersModel(
      fullName: json['full_name'],
      username: json['username'],
      email: json['email'],
      country: json['country'],
      id: json['id'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      '_id': id,
      'full_name': fullName,
      'username': username,
      'email': email,
      'country': country,
    };
  }
}
