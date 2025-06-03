import 'package:flutter/material.dart';
import 'package:ticketapp/model/princing_inf.dart';
import 'package:ticketapp/presentation/payment_piker.dart';

import '../../../l10n/app_localizations.dart';
import '../../../model/ticket_model.dart';
import '../../widget/counter.dart';

class PickAmountOfTickets extends StatefulWidget {
  final TicketM ticket;
  const PickAmountOfTickets({super.key, required this.ticket});

  @override
  State<PickAmountOfTickets> createState() => _PickAmountOfTicketsState();
}

class _PickAmountOfTicketsState extends State<PickAmountOfTickets> {
  int _selectedAmount = 1;
  late double _totalPrice;
  late final AppLocalizations _loc;

  @override
  void initState() {
    super.initState();
    _totalPrice = _selectedAmount * widget.ticket.price;
  }
  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    _loc = AppLocalizations.of(context)!;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 18.0, horizontal: 8.0),
            child: Column(
              spacing: 24.0,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                //Text(widget.ticket.name, style: const TextStyle(fontSize: 32.0, fontWeight: FontWeight.bold), textAlign: TextAlign.center,),
                Counter(
                  onChanged: (value) {
                    setState(() {
                      _selectedAmount = value;
                      _totalPrice = widget.ticket.price * _selectedAmount;
                    });
                  },
                ),
                Text(_loc.ticketPriceLabel(_selectedAmount, _totalPrice.toStringAsFixed(2)),
                    style: TextStyle(fontSize: 16.0, fontWeight: FontWeight.w400),),
                SizedBox(
                  width: double.infinity,
                  child: OutlinedButton(onPressed: () =>
                      Navigator.pushReplacement(
                          context, MaterialPageRoute(
                          builder: (builder) =>
                              PaymentPicker(
                                  widget.ticket,
                                  PricingInf(_totalPrice, _selectedAmount),
                              ))), child: Text(_loc.next)),
                )
              ],
            ),
          )
      )
      ,
    );
  }
}
