import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:ticketapp/l10n/app_localizations.dart';
import 'package:ticketapp/presentation/screen/buy_ticket/choose_city.dart';
import 'package:ticketapp/presentation/screen/buy_ticket/step2_ticket_category.dart';
import 'package:ticketapp/presentation/screen/buy_ticket/step3_ticket_list.dart';
import 'package:ticketapp/presentation/screen/buy_ticket/pick_amount_of_tickets.dart';
import 'package:ticketapp/theme/app_colors.dart';

import '../../../data/provider/buy_form_notifier.dart';
import '../../../data/provider/ticket_provider.dart';

import '../../../model/ticket_step_form.dart';
import '../../../utils/dialog_utils.dart';
import '../../widget/progress_bar.dart';
import 'step1_ticket_city_vehicle_type.dart';



class BuyTicket extends ConsumerStatefulWidget {
  const BuyTicket({super.key});

  @override
  ConsumerState createState() => _BuyTicketState();
}

class _BuyTicketState extends ConsumerState<BuyTicket> {


  final _pageController = PageController();
  final int _maxSteps = 5;
  late final AppLocalizations _loc;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    _loc = AppLocalizations.of(context)!;
  }
  @override
  void dispose() {
    super.dispose();
    _pageController.dispose();
  }


  @override
  Widget build(BuildContext context) {
    final currentStep = ref.watch(buyFormNotifierProvider.select((form) => form.currentStep));
    final currentStepIndex = currentStep.index;
    final ticket = ref.watch(buyFormNotifierProvider.select((form) => form.baseTicket));
    final city = ref.watch(selectedCityProvider);

    ref.listen<TicketStep>(buyFormNotifierProvider.select((form) => form.currentStep), (previous, next) {
      if (previous != next) {
        _pageController.animateToPage(
          next.index,
          duration: Duration(milliseconds: 300),
          curve: Curves.easeInOut,
        );
      }
    });

    if (city == null) {
      return Scaffold(
          appBar: AppBar(
            title: Text(_loc.buyNewTicket),
          ),
        body: SafeArea(
            child: Column(
              children: [
                ProgressBar(maxSteps: _maxSteps, currentStepIndex: currentStepIndex),
                ChooseCity(city)
              ],
        ))
      );
    }

    return Scaffold(
      appBar: AppBar(
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(_loc.buyNewTicket, style: TextStyle(fontSize: 18.0)),
            Text(
            _buildTitle(),
            style: TextStyle(fontSize: 16.0, color: AppColors.greyText),
            overflow: TextOverflow.visible,
            softWrap: true,
              maxLines: 2,
          ),]
        ),
      ),
      body: PopScope(
        canPop: false,
        onPopInvokedWithResult: (didPop, result) async{
          if(!didPop) {
            final shouldExit = await showExitConfirmationDialog(context);
            if (shouldExit == true) Navigator.of(context).pop();
          }
        },
        child: SafeArea(
            child: Column(
              children: [
                ProgressBar(maxSteps: _maxSteps, currentStepIndex: currentStepIndex),
                Expanded(
                  child: PageView(
                    controller: _pageController,
                    onPageChanged: (int index)  =>ref.read(buyFormNotifierProvider.notifier).setCurrentStep(TicketStep.values[index]),
                    physics: NeverScrollableScrollPhysics(),
                    children: [
                      TicketType(city),//city, vehicles
                      TicketCategory(city.id),
                      TicketList(city),
                      PickAmountOfTickets(ticket: ticket)
                    ],
                  ),
                ),
              ],
            )
        ),
      ),
    );
  }

  String _buildTitle(){
    final city = ref.watch(selectedCityProvider);
    final vehicleCategoryName = ref.watch(buyFormNotifierProvider.select((form) => form.vehicleName));
    final ticketVariantName = ref.watch(buyFormNotifierProvider.select((form) => form.variantName));

    if (city == null) return '';

    final buffer = StringBuffer(city.name);

    if(vehicleCategoryName.isNotEmpty){
      buffer.write(' - $vehicleCategoryName');
    }

    if(ticketVariantName.isNotEmpty){
      buffer.write(' - $ticketVariantName');
    }

    /*
    if(_ticket.name.isNotEmpty){
      buffer.write(' - ${_ticket.name}');
    }

     */

    return buffer.toString();
  }

}



