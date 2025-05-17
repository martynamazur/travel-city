import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../../model/ticket_model.dart';

class TicketCard extends StatelessWidget {
  final TicketM ticket;

  const TicketCard({
    super.key,
    required this.ticket,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 8),
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
        border: Border.all(
          width: 1,
          color: CupertinoColors.systemGrey,
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('${ticket.minutes} minutes'),
              Text(ticket.name),
            ],
          ),
          Text('${ticket.price.toStringAsFixed(2)} zł'),
          OutlinedButton(
            onPressed: (){
              //TODO : dodac nawigacje do ekranu paymentPicker

            },
            child: const Icon(Icons.shopping_cart),
          ),
        ],
      ),
    );
  }
}
