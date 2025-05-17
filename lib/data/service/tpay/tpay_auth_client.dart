
import 'package:dio/dio.dart';

class TpayAuthClient{
  final Dio _dio = Dio();
  final String clientId;
  final String clientSecret;
  String? _accessToken;


  TpayAuthClient(this.clientId, this.clientSecret);


  Future<String?> getAccessToken() async{
    try {
      final response = await _dio.post(
        'https://openapi.sandbox.tpay.com/oauth/auth',
        data: {
          'client_id': clientId,
          'client_secret': clientSecret,
          'grant_type': 'client_credentials',
        },
      );

      _accessToken = response.data['access_token'];
      return _accessToken;

    } on DioException catch (e) {
      print('DioException: ${e.response?.statusCode} -> ${e.response?.data}');
    } catch (e) {
      print('Error: $e');
    }
    return null;

  }

}