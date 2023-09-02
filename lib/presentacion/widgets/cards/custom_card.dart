import 'package:flutter/material.dart';



class CustomCard extends StatelessWidget {
  const CustomCard({super.key});

  @override
  Widget build(BuildContext context) {
    // Datos de ejemplo
    List<Map<String, dynamic>> transactions = [
      {
        'importe': '\$20.00',
        'plataforma': 'Calle',
        'fecha': '2023-09-01 15:30:00',
      },
      {
        'importe': '\$15.50',
        'plataforma': 'Uber',
        'fecha': '2023-09-02 10:15:00',
      },
      {
        'importe': '\$16.50',
        'plataforma': 'Bolt',
        'fecha': '2023-09-02 09:45:00',
      },
      // Agrega más datos aquí
    ];

    return Padding(
      padding: const EdgeInsets.fromLTRB(0, 70, 0, 10),
      child: ListView.builder(
        itemCount: transactions.length,
        itemBuilder: (ctx, index) {
          final transaction = transactions[index];
          return TransactionCard(
            importe: transaction['importe'],
            plataforma: transaction['plataforma'],
            fecha: transaction['fecha'],
          );
        },
      ),
    );
  }
}

class TransactionCard extends StatelessWidget {
  final String importe;
  final String plataforma;
  final String fecha;

  TransactionCard({required this.importe, required this.plataforma, required this.fecha});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 3,
      margin: EdgeInsets.all(10),
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
