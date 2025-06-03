import 'package:flutter/material.dart';
import 'package:path/path.dart';

import 'package:flutter/material.dart';

Future<bool?> showExitConfirmationDialog(BuildContext context) {
  return showDialog<bool>(
    context: context,
    builder: (context) => AlertDialog(
      title: const Text('Przerwać zakup?'),
      content: const Text('Czy na pewno chcesz przerwać proces zakupu biletów?'),
      actions: [
        TextButton(
          onPressed: () => Navigator.of(context).pop(false),
          child: const Text('Nie'),
        ),
        TextButton(
          onPressed: () => Navigator.of(context).pop(true),
          child: const Text('Tak'),
        ),
      ],
    ),
  );
}
