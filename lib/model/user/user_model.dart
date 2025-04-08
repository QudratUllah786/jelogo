class UserModel {
  String? firstName;
  String? lastName;
  String? phoneNumber;
  String? email;
  String? dateOfBirth;
  String? type;
  String? createdAt;
  String? sId;
  int? iV;
  String? deviceToken;
  bool? allowNotifications;


  UserModel(
      {this.firstName,
        this.lastName,
        this.phoneNumber,
        this.email,
        this.dateOfBirth,
        this.type,
        this.createdAt,
        this.sId,
        this.allowNotifications,
        this.deviceToken,
        this.iV});

  UserModel.fromJson(Map<String, dynamic> json) {
    firstName = json['firstName'];
    lastName = json['lastName'];
    phoneNumber = json['phoneNumber'];
    email = json['email'] ?? '';
    dateOfBirth = json['dateOfBirth'];
    type = json['type'];
    createdAt = json['createdAt'];
    sId = json['_id'];
    iV = json['__v'];
    deviceToken=json['deviceToken'];
    allowNotifications =  json['allowNotifications'] ?? false;

  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['firstName'] = this.firstName;
    data['lastName'] = this.lastName;
    data['phoneNumber'] = this.phoneNumber;
    data['email'] = this.email;
    data['dateOfBirth'] = this.dateOfBirth;
    data['type'] = this.type;
    data['createdAt'] = this.createdAt;
    data['allowNotifications'] = this.allowNotifications;
    data['_id'] = this.sId;
    data['__v'] = this.iV;
    data['deviceToken']=this.deviceToken;
    return data;
  }
}