import 'package:riverpod_annotation/riverpod_annotation.dart';
import '../../../model/ticket_form_data.dart';
import '../../model/ticket_model.dart';
import '../../model/ticket_step_form.dart';

part 'buy_form_notifier.g.dart';

@riverpod
class BuyFormNotifier extends _$BuyFormNotifier {

  @override
  TicketFormData build() => TicketFormData.empty();

  void updateCityName(String name) {
    state = state.copyWith(cityName: name);
  }

  void updateVehicleName(String name) {
    state = state.copyWith(vehicleName: name);
    goToNextStep();
  }

  void updateVariant({
    required int variantId,
    required String variantName,
  }) {
    final updatedTicket = state.baseTicket.copyWith(variantId: variantId);
    state = state.copyWith(
      baseTicket: updatedTicket,
      variantName: variantName,
    );
    goToNextStep();
  }


  void updateBaseTicket(TicketM ticket) {
    state = state.copyWith(baseTicket: ticket, totalPrice: ticket.price * state.amount);
    goToNextStep();
  }

  void updateAmount(int amount) {
    final totalPrice = state.baseTicket.price * amount;
    state = state.copyWith(amount: amount, totalPrice: totalPrice);
  }


  void setCurrentStep(TicketStep step) {
    state = state.copyWith(currentStep: step);
  }

  void goToNextStep() {
    final nextIndex = state.currentStep.index + 1;
    if (nextIndex < TicketStep.values.length) {
      state = state.copyWith(currentStep: TicketStep.values[nextIndex]);
    }
  }
}
