// ignore_for_file: must_be_immutable

import 'package:sws/network/base/base_response_model.dart';

class DashboardResponse extends BaseResponseModel{
  int? code;
  String? message;
  List<Result>? result;
  int? count;

  DashboardResponse({this.code, this.message, this.result, this.count});

  DashboardResponse.fromJson(Map<String, dynamic> json) {
    code = json['code'];
    message = json['message'];
    if (json['result'] != null) {
      result = <Result>[];
      json['result'].forEach((v) {
        result!.add(new Result.fromJson(v));
      });
    }
    count = json['count'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['code'] = this.code;
    data['message'] = this.message;
    if (this.result != null) {
      data['result'] = this.result!.map((v) => v.toJson()).toList();
    }
    data['count'] = this.count;
    return data;
  }


}

class Result {

  UserId? userId;
  String? firstImage;

  String? firstLabel;


  Result({
    this.userId,
    this.firstImage,

    this.firstLabel,
  });

  Result.fromJson(Map<String, dynamic> json) {

    userId =
    json['userId'] != null ? new UserId.fromJson(json['userId']) : null;
    firstImage = json['firstImage'];

    firstLabel = json['firstLabel'];

  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();

    if (this.userId != null) {
      data['userId'] = this.userId!.toJson();
    }
    data['firstImage'] = this.firstImage;

    data['firstLabel'] = this.firstLabel;

    return data;
  }
}



class UserId {
  String? sId;
  String? email;
  String? fullName;
  bool? isSubscription;

  UserId({this.sId, this.email, this.fullName, this.isSubscription});

  UserId.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    email = json['email'];
    fullName = json['fullName'];
    isSubscription = json['isSubscription'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['_id'] = this.sId;
    data['email'] = this.email;
    data['fullName'] = this.fullName;
    data['isSubscription'] = this.isSubscription;
    return data;
  }
}
