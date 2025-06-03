import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:ticketapp/model/payment_method.dart';
import 'package:ticketapp/presentation/screen/buy_ticket/payment_method_selection_screen.dart';

class PaymentMethodTile extends StatefulWidget {
  final PaymentMethod paymentMethod;
  const PaymentMethodTile({super.key, required this.paymentMethod});

  @override
  State<PaymentMethodTile> createState() => _PaymentMethodTileState();
}

class _PaymentMethodTileState extends State<PaymentMethodTile> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: ()=> Navigator.push(context, MaterialPageRoute(builder: (builder) => PaymentMethodSelectionScreen())),
      child: Container(
        padding: const EdgeInsets.all(16.0),
        decoration: BoxDecoration(
          border: Border.all(color: Colors.black87, width: 1),
          borderRadius: BorderRadius.circular(10.0),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            SizedBox(height: 40, width: 60, child: Image.asset(widget.paymentMethod.imagePath, fit: BoxFit.contain)),
            Column(
              children: [
                Text(widget.paymentMethod.name),
                if (widget.paymentMethod.additionalInformation != null) Text(widget.paymentMethod.additionalInformation!),
              ],
            ),
            const Icon(Icons.arrow_forward_ios),
          ],
        ),
      ),
    );
  }
}
