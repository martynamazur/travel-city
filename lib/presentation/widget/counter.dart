import 'package:flutter/material.dart';
import 'package:ticketapp/theme/app_colors.dart';

class Counter extends StatefulWidget {
  final void Function(int)? onChanged;
  const Counter({super.key, this.onChanged});

  @override
  State<Counter> createState() => _CounterState();
}

class _CounterState extends State<Counter> {
  int _counter = 1;

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        OutlinedButton(
            onPressed: (){
          if(_counter!=1) updateCounter(_counter-1);
        },
            child: Icon(Icons.remove)),
        Container(
            height: 48.0,
            width: 112.0,
            decoration: BoxDecoration(
                color: Colors.grey[200],
              borderRadius: BorderRadius.circular(10),
              border: Border.all(
                color: AppColors.primary,
                width: 1.0
              )
            ),
            child: Center(child: Text(_counter.toString()))
        ),
        OutlinedButton(onPressed: (){
          updateCounter(_counter+1);
        }, child: Icon(Icons.add))
      ],
    );
  }

  void updateCounter(int value){
    setState(() {
      _counter = value;
    });
    widget.onChanged?.call(_counter);
  }
}
