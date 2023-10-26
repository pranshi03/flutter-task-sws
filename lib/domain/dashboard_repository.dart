import 'package:sws/network/model/dashboard/dashboard_response.dart';

import '../network/http_client.dart';
import '../network/network_result.dart';

class DashboardRepository {

  Future<DashboardResponse> getDashboardResponse() async {


    HttpClient client = HttpClient.env();
    NetworkResult response = await client.dashboardRequest();
    DashboardResponse data = response.data;


    return data;
  }






}
