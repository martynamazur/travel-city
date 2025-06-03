import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:ticketapp/l10n/app_localizations.dart';
import 'package:ticketapp/presentation/screen/buy_ticket/choose_city.dart';
import 'package:ticketapp/presentation/screen/buy_ticket/step2_ticket_category.dart';
import 'package:ticketapp/presentation/screen/buy_ticket/step3_ticket_list.dart';
import 'package:ticketapp/presentation/screen/buy_ticket/pick_amount_of_tickets.dart';
import 'package:ticketapp/theme/app_colors.dart';

import '../../../data/provider/ticket_provider.dart';

import '../../../model/ticket_model.dart';
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
  TicketStep _currentStep = TicketStep.chooseVehicle;
  TicketCategoryTypes _ticketCategory = TicketCategoryTypes.none;
  TicketM _ticket = TicketM(
    id: 0,
    cityId: 0,
    vehicleTypeId: 0,
    variantId: 0,
    name: '',
    minutes: 60,
    price: 0.0,
  );
  int get _currentStepIndex => _currentStep.index;
  String? _vehicleCategoryName;
  String? _ticketType;
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
    final city = ref.watch(selectedCityProvider);

    if (city == null) {
      return Scaffold(
          appBar: AppBar(
            title: Text(_loc.buyNewTicket),
          ),
        body: SafeArea(child: Column(
          children: [
            ProgressBar(maxSteps: _maxSteps, currentStepIndex: _currentStepIndex),
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
            if (shouldExit == true) {
              Navigator.of(context).pop();
            }
          }
        },
        child: SafeArea(
            child: Column(
              children: [
                ProgressBar(maxSteps: _maxSteps, currentStepIndex: _currentStepIndex),
                Expanded(
                  child: PageView(
                    controller: _pageController,
                    onPageChanged: (int index) => setState(() => _currentStep = TicketStep.values[index]),
                    physics: NeverScrollableScrollPhysics(),
                    children: [
                      TicketType(
                          city,
                          (vehicleName){
                            setState(() {
                              _vehicleCategoryName = vehicleName;
                            });
                            _nextStep();
                          }
                      ),//city, vehicles
                      TicketCategory(
                          city.id,
                          (categoryId, ticketVariant){
                            setState(() {
                              _ticketCategory = TicketCategoryTypes.values.elementAt(categoryId);
                              _ticketType = ticketVariant;
                              _nextStep();
                            });
                          }
                      ),
                      TicketList(
                          city,
                          _ticketCategory.index,
                          (ticket){
                            setState(() {
                              _ticket = ticket;
                              _nextStep();
                            });}
                      ),
                      PickAmountOfTickets(ticket: _ticket)
                    ],
                  ),
                ),
              ],
            )
        ),
      ),
    );
  }

  void _nextStep() {
    setState(() {
      if (_currentStep.index + 1 < TicketStep.values.length) {
        _currentStep = TicketStep.values[_currentStep.index + 1];
      }
    });
    _pageController.nextPage(
      duration: Duration(milliseconds: 300),
      curve: Curves.easeInOut,
    );
  }

  String _buildTitle(){
    final city = ref.watch(selectedCityProvider);

    if (city == null) return '';

    final buffer = StringBuffer(city.name);

    if(_vehicleCategoryName != null){
      buffer.write(' - $_vehicleCategoryName');
    }

    if(_ticketType != null){
      buffer.write(' - $_ticketType');
    }

    /*
    if(_ticket.name.isNotEmpty){
      buffer.write(' - ${_ticket.name}');
    }

     */

    return buffer.toString();
  }

}



