import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:ticketapp/data/service/database/app_database.dart';
import 'package:ticketapp/model/activated_ticket_model.dart';
import 'package:ticketapp/presentation/screen/ticket_details_screen.dart';

import '../../model/ticket_model.dart';
import 'active_ticket_counter.dart';



enum TicketVariant {normalny, ulgowy}

class TicketActiveCard extends ConsumerStatefulWidget {
  final ActivatedTicket ticket;
  final TicketM baseTicket;
  const TicketActiveCard(this.ticket, this.baseTicket, {super.key});

  @override
  ConsumerState createState() => _TicketActiveCardState();
}

class _TicketActiveCardState extends ConsumerState<TicketActiveCard> {
  @override
  Widget build(BuildContext context) {
    //TODO: Nie zapisalam do db obiektu baseticket ?

    return GestureDetector(
      onTap: () => Navigator.push(context,MaterialPageRoute(builder: (context) => TicketDetailsScreen(ActivatedTicketAppModel.fromDb(widget.ticket, widget.baseTicket)))),
      child: Container(
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(5.0),
            border: Border.all(
                width: 1.0,
                color: Color(0xFFE0E0E0)
            ),
            boxShadow: [
              BoxShadow(
                color: Color(0xFFEEEEEE),
                offset: Offset(0, 4),
                blurRadius: 8.6,
                spreadRadius: 0,
              )
            ]
        ),
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Column(
            children: [
              Row(
                children: [
                  //qr code
                  GestureDetector(
                    onTap: (){
                      //show bottom sheet only with  QR code
                    },
                    child: SizedBox(
                        width: 50,
                        height: 50,
                        child:  GestureDetector(
                          onTap: _showBottomSheet,
                          child: Container(
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                border: Border.all(
                                    width: 1.0,
                                    color: Colors.green
                                )
                            ),
                            child: Icon(Icons.qr_code_2),
                          ),
                        )
                    ),
                  ),
                  SizedBox(width: 24.0),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(widget.baseTicket.name),
                      Text('${widget.baseTicket.minutes}M * ${TicketVariant.values[widget.baseTicket.variantId].name.toUpperCase()}'),
                    ],
                  )
                ],
              ),
              CountdownTimer(
                activatedAt: widget.ticket.activatedAt!,
                expiresAt: widget.ticket.expiresAt!,
                onExpireStatusChanged: (isExpired) {
                  if (isExpired) {
                    //TODO: Zmienic obramowanie po wygasnieciu wkolo
                  }
                },
              ),

            ],
          ),
        ),
      ),
    );
  }

  void _showBottomSheet(){
    showModalBottomSheet(
        context: context,
        builder: (context){
          return Container(
            height: 200,
            width: double.infinity,
            padding: EdgeInsets.all(16.0),
            child: Column(
              children: [
                Text('Pokaz kod qr przy kontroli biletow')
              ],
            ),
          );
        }
    );
  }
}
