import 'dart:convert';
import 'dart:math';

import 'package:http/http.dart' as http;
import 'package:ticketapp/model/activated_ticket_model.dart';

import '../../constants.dart';
import '../../main.dart';
import '../../model/princing_inf.dart';
import '../../model/ticket_model.dart';

class QrRepository{


  Future<ActivatedTicketAppModel?> activateTicket(
      TicketM baseTicket,
      String vehicleFleetId,
      String transactionId,
      PricingInf pricingInf
      )
  async{

    try{
      final session = supabase.auth.currentSession;
      final accessToken = session?.accessToken;

      final ticketData = {
        "ticket_id": baseTicket.id,
        "vehicle_fleet_id": vehicleFleetId,
        "transaction_id": transactionId,
        "ticket_duration": baseTicket.minutes
      };


      final response = await http.post(
          ApiEndpoints.activateTicket,
          body: jsonEncode(ticketData),
          headers: {
            'Authorization': 'Bearer $accessToken',
            'Content-Type': 'application/json'
        },
      );

      final data = json.decode(response.body);
      final token = data['qrToken'];
      String activatedAtStr = data['activated_at'];
      String expiresAtStr = data['expires_at'];

      try {
        final activatedAt = DateTime.parse(activatedAtStr);
        final expiresAt = DateTime.parse(expiresAtStr);
        final newActivatedTicket = ActivatedTicketAppModel(
          baseTicket: baseTicket,
          vehicleNumber: vehicleFleetId,
          transactionId: transactionId,
          amount: pricingInf.ticketAmount,
          totalPrice: pricingInf.totalPrice,
          activatedAt: activatedAt,
          expiresAt: expiresAt,
          token: token,
        );
        return newActivatedTicket;
      } catch (e) {
        print('Błąd parsowania dat: $e');
        return null;
      }


  }catch(e){
      print(e);
      print('Błąd $e');
      return null;
    }
  }

}