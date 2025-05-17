import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:ticketapp/model/ticket_user.dart';
import 'package:ticketapp/presentation/screen/ticket_details_screen.dart';

import '../../model/ticket_model.dart';
import 'active_ticket_counter.dart';

class TicketActiveCard extends StatefulWidget {
  final UserTicket ticket;

  TicketActiveCard(this.ticket, {super.key});

  @override
  State<TicketActiveCard> createState() => _TicketActiveCardState();
}

class _TicketActiveCardState extends State<TicketActiveCard> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => Navigator.push(context,MaterialPageRoute(builder: (context) => TicketDetailsScreen())),
      child: Container(
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(20),
            border: Border.all(
                width: 1,
                color: CupertinoColors.systemGrey
            )
        ),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
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
                        child:  Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            border: Border.all(
                              width: 1.0,
                              color: Colors.green
                            )
                          ),
                          child: Icon(Icons.qr_code_2),
                        )
                    ),
                  ),
                  SizedBox(width: 24.0),
                  Column(
                    children: [
                      Text('30minutes'),
                      Text('2zones * Basic tariff')
                    ],
                  )
                ],
              ),
              CountdownTimer(startSeconds: 30),

            ],
          ),
        ),
      ),
    );
  }
}
