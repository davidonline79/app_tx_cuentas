import 'package:app_tx_cuentas/presentacion/widgets/cards/transaction_card.dart';
import 'package:flutter/material.dart';

class CardList extends StatelessWidget {
  final List<Map<String, dynamic>> transactions;

  const CardList({super.key, required this.transactions});

  @override
  Widget build(BuildContext context) {
    // Obtener la última transacción si hay alguna, o null si no hay ninguna.
    final lastTransaction = transactions.isNotEmpty ? transactions.last : null;

    return Column(
      children: [
        if (lastTransaction != null)
          TransactionCard(
            importe: lastTransaction['importe'],
            plataforma: lastTransaction['plataforma'],
            fecha: lastTransaction['fecha'],
          ),
      ],
    );
  }
} 