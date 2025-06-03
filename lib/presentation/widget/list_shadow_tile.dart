
import 'package:flutter/material.dart';
import 'package:ticketapp/model/ticket_step_form.dart';
import 'package:ticketapp/theme/app_colors.dart';

import '../../l10n/app_localizations.dart';
import '../../model/ticket_model.dart';

class ListShadowTile extends StatelessWidget {
  final String? text;
  final void Function() onTap;
  final IconData? icon;
  final TicketM? ticket;
  final int? ticketCategoryId;
  final bool? isSelected;

  const ListShadowTile({
    super.key,
    required this.onTap,
    this.icon,
    this.ticket, this.ticketCategoryId,
    this.text, this.isSelected});


  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4.0),
      child: GestureDetector(
        onTap: onTap,
        child: Container(
          decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(5.0),
              border: Border.all(
                width: 1.0,
                color: (isSelected ?? false) ? Colors.blue : Color(0xFFE0E0E0)
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
            padding: const EdgeInsets.all(16.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                ticket != null ? _fullTicketInfo(context) : Text(text!, style: TextStyle(fontSize: 16.0, fontWeight: FontWeight.w400)),
                if(icon != null) Icon(icon, size: 16.0, color: AppColors.primary)
              ],
            ),
          ),
          ),
      ),
    );
  }
  Widget _fullTicketInfo(BuildContext context){
    return Expanded(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children:
            [
              Text(ticket!.name,style: TextStyle(color: AppColors.lightGreyText)),
              Text(AppLocalizations.of(context)!.ticketTypeLabel(
                ticket!.minutes,TicketCategoryTypes.values[ticketCategoryId!].name,
              ), style: TextStyle(fontWeight: FontWeight.w500),)
            ]
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text(AppLocalizations.of(context)!.price),
              Text('${ticket!.price.toStringAsFixed(2)}zł', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16.0))
            ],
          )
        ],
      ),
    );
  }
}
