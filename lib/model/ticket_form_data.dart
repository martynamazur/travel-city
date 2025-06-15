import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:ticketapp/model/ticket_step_form.dart';
import 'ticket_model.dart';

part 'ticket_form_data.freezed.dart';
@freezed
abstract class TicketFormData with _$TicketFormData {
  const factory TicketFormData({
    required TicketM baseTicket,
    required String cityName,
    required String vehicleName,
    required String variantName,
    required int amount,
    required double totalPrice,

    required TicketStep currentStep,
  }) = _TicketFormData;

  factory TicketFormData.empty() => TicketFormData(
    baseTicket: TicketM.empty(),
    cityName: '',
    vehicleName: '',
    variantName: '',
    amount: 1,
    totalPrice: 0.0,
    currentStep: TicketStep.chooseVehicle,
  );
}
