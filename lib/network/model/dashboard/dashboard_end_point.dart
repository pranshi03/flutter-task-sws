import 'package:dio/dio.dart';
import 'package:sws/network/model/dashboard/dashboard_response.dart';

import '../../base/base_end_point.dart';
import 'dashboard_request.dart';


const String _path = 'post/getTestingPosts';

class DashboardEndpointUsecase
    extends PostEndpoint<DashboardRequest, DashboardResponse> {
  DashboardEndpointUsecase(Dio _dio) : super(_dio, _path);
}


