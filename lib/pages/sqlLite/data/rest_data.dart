import 'package:hello_world/pages/sqlLite/http_services/network_service.dart';
import 'package:hello_world/pages/sqlLite/models/user.dart';

class RestData {
  NetworkService _netService = new NetworkService();

  static const BASE_URL = "";
  static const LOGIN_uRL = BASE_URL + "/";

  Future<User> login(String username, String password) {
    return new Future.value(new User(username, password));
  }
}
