import 'package:flutter/material.dart';

class CustomFloatingActionButton extends StatelessWidget {
  final double totalImporte;
  final VoidCallback onTap;

  const CustomFloatingActionButton({
    Key? key,
    required this.totalImporte,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton.extended(
      onPressed: onTap,
      label: Text('${totalImporte.toStringAsFixed(2)}€', style: const TextStyle(fontSize: 40)),
    );
  }
}

