import 'package:flutter/material.dart';
import 'package:app_tx_cuentas/database/database_helper.dart';
import 'package:app_tx_cuentas/models/transactiones.dart';
import 'package:app_tx_cuentas/presentacion/widgets/widgets.dart';

class TransactionListScreen extends StatefulWidget {
  const TransactionListScreen({super.key});

  @override
  _TransactionListScreenState createState() => _TransactionListScreenState();
}

class _TransactionListScreenState extends State<TransactionListScreen> {
  late Future<List<Transactiones>> transactionsFuture;
  double totalImporte = 0.0;

  @override
  void initState() {
    super.initState();
    transactionsFuture = fetchTransactions();
  }

  Future<List<Transactiones>> fetchTransactions() async {
    final dbHelper = DatabaseHelper();
    final transactions = await dbHelper.getTransactions();
    setState(() {
      totalImporte = transactions
          .map((transaction) => double.parse(transaction.importe))
          .fold(0.0, (previous, current) => previous + current);
    });
    return transactions.reversed.toList(); // Revierte la lista y la convierte a una nueva lista
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.fromLTRB(0, 70, 0, 0),
        child: FutureBuilder<List<Transactiones>>(
          future: transactionsFuture,
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            } else if (snapshot.hasError) {
              return Center(
                child: Text('Error: ${snapshot.error}'),
              );
            } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
              return const Center(
                child: Text('No hay transacciones disponibles.'),
              );
            } else {
              final transactions = snapshot.data!;
              return ListView.builder(
                itemCount: transactions.length,
                itemBuilder: (context, index) {
                  final transaction = transactions[index];
                  return TransactionCard(
                    importe: transaction.importe,
                    plataforma: transaction.plataforma,
                    fecha: transaction.fecha,
                  );
                },
              );
            }
          },
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerTop,
      floatingActionButton: CustomFloatingActionButton(
        totalImporte: totalImporte,
        onTap: () {
          showDialog(
            context: context,
            builder: (BuildContext context) {
              return AlertDialog(
                title: const Text('Total Importe'),
                content: Text('El total de importe es: \$${totalImporte.toStringAsFixed(2)}'),
                actions: [
                  TextButton(
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                    child: const Text('Cerrar'),
                  ),
                ],
              );
            },
          );
        },
      ),
      bottomNavigationBar: const CustomBottomAppBar(),
    );
  }
}
