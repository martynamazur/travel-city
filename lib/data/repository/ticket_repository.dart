
import 'package:ticketapp/main.dart';
import 'package:ticketapp/model/ticket_model.dart';
import 'package:ticketapp/model/ticket_user.dart';
import 'package:ticketapp/model/ticket_variant.dart';
import 'package:ticketapp/model/vehicle_type.dart';

import '../../model/city.dart';

class TicketRepository{

  //To sa wszystkie bilety ulgowe jak i nie ulgowe
  Future<List<TicketM>> getAvailableTickets(int cityId) async{
    try{
      final response = await supabase.from('ticket').select('*').eq('city_id', cityId);
      final List<dynamic> data = response as List<dynamic>;return data.map((json) => TicketM.fromJson(json)).toList();
      
    }catch(e){
      print(e);
      return [];
    }
  }
  
  Future<List<TicketVariant>> getTicketVariants(int cityId) async{
    try{
      final response = await supabase
          .from('city_ticket_variant')
          .select('ticket_variant_id(id, name)')
          .eq('city_id', cityId);


      final List<dynamic> data = response as List<dynamic>;
      return data
          .map((json) => TicketVariant.fromJson(json['ticket_variant_id'] as Map<String,dynamic>))
          .toList();
      
    }catch(e){
      return [];
    }
}

  Future<List<City>> getCityList() async{
    try{
      final response = await supabase.from('city').select('*');
      print(response);
      final List<dynamic> data = response as List<dynamic>;
      var ok = data.map((json) => City.fromJson(json)).toList();
      print(ok);
      return data.map((json) => City.fromJson(json)).toList();

    }catch(e, stackTrace){
      print(e);
      print(stackTrace);
      return [];
    }
  }
  
  Future<List<VehicleType>> getVehicleList(int cityId) async{
    try{
      final response = await supabase
          .from('city_vehicle_type')
          .select('vehicle_type(id,name)')
          .eq('city_id',cityId);
      print(response);
      final List<dynamic> data = response as List<dynamic>;
      return data
          .map((json) => VehicleType.fromJson(json['vehicle_type'] as Map<String, dynamic>))
          .toList();
      
    }catch(e,stackTrace){
      print(e);
      print(stackTrace);
      return [];
    }
  }

  Future<TicketM?> getTicket(int ticketId) async{
    try{
      final response = await supabase.from('ticket').select().eq('id', ticketId).single();
      return TicketM.fromJson(response);
    }catch(e){
      print('Błąd pobierania biletu: $e');
      return null;
    }
  }

  //TODO: zaimplementowac
  Future<List<UserTicket>> getUserTickets() async {
    return [UserTicket(1,'test qr token',DateTime.now()),UserTicket(2,'test qr token',DateTime.now())];
  }

  Future<List<TicketM>> getUserMostBoughTickets(List<int> ids) async {
    if (ids.isEmpty) return [];

    try {
      final response = await supabase
          .from('ticket')
          .select()
          .inFilter('id', ids);

      final data = response as List<dynamic>;
      return data.map((json) => TicketM.fromJson(json)).toList();
    } catch (e) {
      print('Błąd przy pobieraniu biletów: $e');
      return [];
    }
  }

}