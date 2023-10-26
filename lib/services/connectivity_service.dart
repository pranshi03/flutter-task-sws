import 'dart:async';

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:fluttertoast/fluttertoast.dart';


class ConnectivityService {
  //
  StreamController<ConnectivityResult> connectionStatusController =
      StreamController<ConnectivityResult>();

  // Stream is like a pipe, you add the changes to the pipe, it will
  // come out on the other side.
  // Create the Constructor

  ConnectivityService(context) {
    // Subscribe to the connectivity changed stream
    Connectivity().onConnectivityChanged.listen((ConnectivityResult result) {
      connectionStatusController.add(result);
      switch (result) {
        case ConnectivityResult.mobile:
          break;
        case ConnectivityResult.wifi:
          break;
        case ConnectivityResult.none:
          Fluttertoast.showToast(msg: 'No Internet Connection.Please check your connection');


          break;
        default:
          break;
      }
    });
  }
}


