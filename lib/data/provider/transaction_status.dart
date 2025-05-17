import 'dart:async';
import 'package:http/http.dart' as http;
import 'dart:convert';

import 'package:riverpod_annotation/riverpod_annotation.dart';


part 'transaction_status.g.dart';

@riverpod
class TransactionStatusNotifier extends _$TransactionStatusNotifier {
  Timer? _timer;
  String? _transactionId;

  @override
  FutureOr<String> build() async {
     return 'unknown';
  }

  void startPolling(String transactionId) {
    _transactionId = transactionId;
    _timer = Timer.periodic(Duration(seconds: 3), (_) => _checkStatus());
  }

  Future<void> _checkStatus() async {
    if (_transactionId == null) return;

    final uri = Uri.parse(
        'https://ticket-app-render.onrender.com/status?id=$_transactionId');

    final response = await http.get(uri);
    if (response.statusCode == 200) {
      final data = json.decode(response.body);
      final status = data['status'] ?? 'unknown';
      print(status);
      state = AsyncValue.data(status);

      if (status == 'success' || status == 'failure') {
        print('hell yeah');
        _timer?.cancel();
      }
    }
  }

}



final transactionStatusProvider =
AsyncNotifierProvider.autoDispose<TransactionStatusNotifier, String>(
  TransactionStatusNotifier.new,
);
