class NetworkService {
  static NetworkService _instace = new NetworkService.internal();

  NetworkService.internal();
  factory NetworkService() => _instace;

  Future<dynamic> get() {
    return null;
  }

  Future<dynamic> post() {
    return null;
  }
}
