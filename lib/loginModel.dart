class LoginModel {
  Data? data;
  String? message;

  LoginModel({this.data, this.message});

  LoginModel.fromJson(Map<String, dynamic> json) {
    data = json['data'] != null ? new Data.fromJson(json['data']) : null;
    message = json['message'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    data['message'] = this.message;
    return data;
  }
}

class Data {
  String? id;
  String? code;
  String? roleId;
  Role? role;
  String? name;
  String? position;
  String? email;
  String? encryptedPassword;
  String? token;
  String? farmId;
  Role? farm;
  String? createdAt;
  String? updatedAt;
  String? deletedAt;
  bool? status;
  String? updatedBy;
  String? address;
  String? joinDate;
  String? phone;
  String? identityNumber;
  String? mobileId;
  bool? isReset;
  String? tempPass;

  Data(
      {this.id,
      this.code,
      this.roleId,
      this.role,
      this.name,
      this.position,
      this.email,
      this.encryptedPassword,
      this.token,
      this.farmId,
      this.farm,
      this.createdAt,
      this.updatedAt,
      this.deletedAt,
      this.status,
      this.updatedBy,
      this.address,
      this.joinDate,
      this.phone,
      this.identityNumber,
      this.mobileId,
      this.isReset,
      this.tempPass});

  Data.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    code = json['code'];
    roleId = json['role_id'];
    role = json['role'] != null ? new Role.fromJson(json['role']) : null;
    name = json['name'];
    position = json['position'];
    email = json['email'];
    encryptedPassword = json['encrypted_password'];
    token = json['token'];
    farmId = json['farm_id'];
    farm = json['farm'] != null ? new Role.fromJson(json['farm']) : null;
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    deletedAt = json['deleted_at'];
    status = json['status'];
    updatedBy = json['updated_by'];
    address = json['address'];
    joinDate = json['join_date'];
    phone = json['phone'];
    identityNumber = json['identity_number'];
    mobileId = json['mobile_id'];
    isReset = json['is_reset'];
    tempPass = json['temp_pass'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['code'] = this.code;
    data['role_id'] = this.roleId;
    if (this.role != null) {
      data['role'] = this.role!.toJson();
    }
    data['name'] = this.name;
    data['position'] = this.position;
    data['email'] = this.email;
    data['encrypted_password'] = this.encryptedPassword;
    data['token'] = this.token;
    data['farm_id'] = this.farmId;
    if (this.farm != null) {
      data['farm'] = this.farm!.toJson();
    }
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    data['deleted_at'] = this.deletedAt;
    data['status'] = this.status;
    data['updated_by'] = this.updatedBy;
    data['address'] = this.address;
    data['join_date'] = this.joinDate;
    data['phone'] = this.phone;
    data['identity_number'] = this.identityNumber;
    data['mobile_id'] = this.mobileId;
    data['is_reset'] = this.isReset;
    data['temp_pass'] = this.tempPass;
    return data;
  }
}

class Role {
  String? iD;
  String? name;

  Role({this.iD, this.name});

  Role.fromJson(Map<String, dynamic> json) {
    iD = json['ID'];
    name = json['Name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['ID'] = this.iD;
    data['Name'] = this.name;
    return data;
  }
}
