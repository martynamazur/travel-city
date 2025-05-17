
import 'package:dio/dio.dart';

class PaymentRepository{
  final Dio dio;

  PaymentRepository(this.dio);
  
  void getHttp() async{
    final response = await dio.get('/api/gw/{api_key}/transaction/create');
  }
}