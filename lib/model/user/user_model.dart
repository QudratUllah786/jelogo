class UserModel {
  final bool? status;
  final String? message;
  final UserData? data;

  UserModel({
    this.status,
    this.message,
    this.data,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      status: json['status'],
      message: json['message'],
      data: json['data'] != null ? UserData.fromJson(json['data']) : null,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'status': status,
      'message': message,
      'data': data?.toJson(),
    };
  }
}

class UserData {
  final User? user;
  final Tokens? tokens;

  UserData({
    this.user,
    this.tokens,
  });

  factory UserData.fromJson(Map<String, dynamic> json) {
    return UserData(
      user: json['user'] != null ? User.fromJson(json['user']) : null,
      tokens: json['tokens'] != null ? Tokens.fromJson(json['tokens']) : null,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'user': user?.toJson(),
      'tokens': tokens?.toJson(),
    };
  }
}

class User {
  final String? id;
  final String? email;
  final String? name;
  final String? lastName;
  final String? firstName;
  final String? phone;
  final String? countryCode;
  final bool? isVerified;
  final String? avatar;
  final String? birthDate;
  final String? address;
  final String? gender;
  final String? indicatif;
  final String? notificationToken;
  final String? createdAt;
  final String? updatedAt;

  User({
    this.id,
    this.email,
    this.name,
    this.lastName,
    this.firstName,
    this.phone,
    this.countryCode,
    this.isVerified,
    this.avatar,
    this.birthDate,
    this.address,
    this.gender,
    this.indicatif,
    this.notificationToken,
    this.createdAt,
    this.updatedAt,
  });

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      id: json['id'],
      email: json['email'],
      name: json['name'],
      lastName: json['lastName'],
      firstName: json['firstName'],
      phone: json['phone'],
      countryCode: json['countryCode'],
      isVerified: json['isVerified'],
      avatar: json['avatar'],
      birthDate: json['birthDate'],
      address: json['address'],
      gender: json['gender'],
      indicatif: json['indicatif'],
      notificationToken: json['notificationToken'],
      createdAt: json['createdAt'],
      updatedAt: json['updatedAt'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
     if(id!= null) 'id': id,
      if(email!= null)  'email': email,
      if(name!= null) 'name': name,
      if(lastName!= null) 'lastName': lastName,
      if(firstName!= null) 'firstName': firstName,
      if(phone!= null) 'phone': phone,
      if(countryCode!= null)  'countryCode': countryCode,
      if(isVerified!= null) 'isVerified': isVerified,
      if(avatar!= null) 'avatar': avatar,
      if(birthDate!= null) 'birthDate': birthDate,
      if(address!= null) 'address': address,
      if(gender!= null) 'gender': gender,
      if(indicatif!= null)'indicatif': indicatif,
      if(notificationToken!= null) 'notificationToken': notificationToken,
      if(createdAt!= null)  'createdAt': createdAt,
      if(updatedAt!= null) 'updatedAt': updatedAt,
    };
  }
}

class Tokens {
  final String? accessToken;
  final String? refreshToken;

  Tokens({
    this.accessToken,
    this.refreshToken,
  });

  factory Tokens.fromJson(Map<String, dynamic> json) {
    return Tokens(
      accessToken: json['access_token'],
      refreshToken: json['refresh_token'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'access_token': accessToken,
      'refresh_token': refreshToken,
    };
  }
}
