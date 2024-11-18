import 'package:jindal_dealer/network/interfaces/base_network_model.dart';

class ModelLogin extends BaseNetworkModel{
  ModelLogin({
      this.message, 
      this.token,});

  ModelLogin.fromJson(dynamic json) {
    message = json['message'];
    token = json['token'];
  }
  String? message;
  String? token;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['message'] = message;
    map['token'] = token;
    return map;
  }

  @override
  fromJson(Map<String, dynamic> json) {
    return ModelLogin.fromJson(json);
  }

}