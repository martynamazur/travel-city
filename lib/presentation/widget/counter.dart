import 'package:flutter/material.dart';

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
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        OutlinedButton(onPressed: (){
          if(_counter!=1) updateCounter(_counter-1);
        },
            child: Icon(Icons.minimize_rounded)),
        Text(_counter.toString()),
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
