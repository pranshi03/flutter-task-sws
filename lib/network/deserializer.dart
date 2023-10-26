


import 'package:sws/network/model/dashboard/dashboard_response.dart';

import 'base/base_response_model.dart';



abstract class Deserializer {
  static final Map<Type, Function(Map<String, dynamic>)> _deserializers = {

    DashboardResponse: (Map<String, dynamic> json) => DashboardResponse.fromJson(json),


  };

  static Response deserialize<Response extends BaseResponseModel>(
      Map<String, dynamic> json) {

    return Deserializer._deserializers[Response]!(json);
  }
}
