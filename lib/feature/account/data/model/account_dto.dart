import 'package:nti_shopping_app/feature/account/data/domain/entities/account_entity.dart';

class AccountDto {
  Message? message;

  AccountDto({this.message});

  AccountDto.fromJson(Map<String, dynamic> json) {
    message = json['message'] != null
        ? Message.fromJson(json['message'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (message != null) {
      data['message'] = message!.toJson();
    }
    return data;
  }
}

class Message {
  String? sId;
  String? name;
  String? phone;
  String? email;
  String? address;
  String? image;

  Message({
    this.sId,
    this.name,
    this.phone,
    this.email,
    this.address,
    this.image,
  });

  Message.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    name = json['name'];
    phone = json['phone'];
    email = json['email'];
    address = json['address'];
    image = json['image'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['_id'] = sId;
    data['name'] = name;
    data['phone'] = phone;
    data['email'] = email;
    data['address'] = address;
    data['image'] = image;
    return data;
  }

  AccountEntity toEntity() {
    return AccountEntity(
      id: sId,
      name: name,
      phone: phone,
      email: email,
      address: address,
      image: image,
    );
  }
}