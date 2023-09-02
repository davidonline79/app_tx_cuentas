import 'package:flutter/material.dart';

class TransactionCard extends StatelessWidget {
  final String importe;
  final String plataforma;
  final String fecha;

  const TransactionCard({
    super.key,
    required this.importe,
    required this.plataforma,
    required this.fecha,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 3,
      margin: const EdgeInsets.all(10),
      child: ListTile(
        title: Text('Importe: $importe'),
        subtitle: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Plataforma: $plataforma'),
            Text('Fecha: $fecha'),
          ],
        ),
      ),
    );
  }
}
