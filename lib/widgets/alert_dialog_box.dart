import 'package:flutter/material.dart';

class AlertDialogBox extends StatelessWidget {
  const AlertDialogBox({super.key, required this.title, required this.message});

  final String title;
  final String message;

  void navigateBack(BuildContext context, bool result) {
    Navigator.of(context).pop(result);
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text(title),
      content: Text(message),
      actions: [
        TextButton(
          onPressed: () => navigateBack(context, false),
          child: const Text('Cancelar'),
        ),
        TextButton(
          onPressed: () => navigateBack(context, true),
          child: const Text('Confirmar'),
        )
      ],
    );
  }
}
