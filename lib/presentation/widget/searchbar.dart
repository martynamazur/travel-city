import 'package:flutter/material.dart';

class Searchbar extends StatelessWidget {
  final _textEditingController = TextEditingController();
  final ValueChanged<String> _onChanged;
  final String _hintText = 'Search...';

  Searchbar(this._onChanged, {super.key});


  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: _textEditingController,
      onChanged: _onChanged,
      decoration: InputDecoration(
        hintText: _hintText,
        prefixIcon: Icon(Icons.search),
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
        filled: true,
        contentPadding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 0)
      ),
    );
  }
}
