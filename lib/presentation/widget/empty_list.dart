import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:ticketapp/presentation/widget/secondary_button.dart';

class EmptyList extends StatelessWidget {
  final String headline;
  final String? subHeadline;
  final IconData icon;
  final void Function()? onTap;
  final String? buttonText;
  const EmptyList({super.key, required this.headline, required this.icon, this.subHeadline, this.onTap, this.buttonText});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        spacing: 16.0,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            width: 70,
            height: 70,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: Colors.black87,
            ),
            child: Icon(
              icon,
              color: Colors.white,
              size: 30,
            ),
          ),
          Text(headline,style: TextStyle(fontSize: 16.0,fontWeight: FontWeight.w400)),
          if (subHeadline != null) Text(subHeadline!),
          if (onTap != null) SizedBox( width: 240.0 ,child: SecondaryButton(text: buttonText!, onPressed: onTap!))


        ],
      ),
    );
  }
}
