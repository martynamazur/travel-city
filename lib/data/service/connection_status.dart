import 'package:internet_connection_checker_plus/internet_connection_checker_plus.dart';

class ConnectionService {
  final InternetConnection _internet = InternetConnection();

  Future<bool> checkConnection() => _internet.hasInternetAccess;

  Stream<InternetStatus> get statusStream => _internet.onStatusChange;
}
