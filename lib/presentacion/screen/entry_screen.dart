import 'package:flutter/material.dart';
import 'package:app_tx_cuentas/models/transactiones.dart';
import 'package:app_tx_cuentas/database/database_helper.dart';
import 'package:app_tx_cuentas/presentacion/widgets/widgets.dart';

class EntryScreen extends StatefulWidget {
  const EntryScreen({Key? key});

  @override
  _EntryScreenState createState() => _EntryScreenState();
}

class _EntryScreenState extends State<EntryScreen> {
  final TextEditingController importeController = TextEditingController();
  
  String plataformaValue = 'Calle'; // Calle por defecto
  late final TextEditingController fechaController;

  List<Map<String, dynamic>> transactions = [];
  double totalImporte = 0.0; // Total de importes de la base de datos

  @override
  void initState() {
    super.initState();
    fechaController = TextEditingController(
      text: getCurrentDateTime(),
    );
    fetchTransactions(); // Llamar a la función para cargar las transacciones
  }

  String getCurrentDateTime() {
    final now = DateTime.now();
    final formattedDate =
        '${now.year}-${now.month.toString().padLeft(2, '0')}-${now.day.toString().padLeft(2, '0')} '
        '${now.hour.toString().padLeft(2, '0')}:${now.minute.toString().padLeft(2, '0')}:${now.second.toString().padLeft(2, '0')}';
    return formattedDate;
  }

  void fetchTransactions() async {
    final dbHelper = DatabaseHelper();
    final loadedTransactions = await dbHelper.getTransactions();

    setState(() {
      transactions =
          loadedTransactions.map((transaction) => transaction.toMap()).toList();
      totalImporte = transactions
          .map((transaction) => double.parse(transaction['importe']))
          .fold(0.0, (previous, current) => previous + current);
    });
  }

  void _addTransaction() async {
    final importe = importeController.text;
    final fecha = fechaController.text;

    if (importe.isEmpty || fecha.isEmpty) {
      return;
    }

    final transaction = Transactiones(
        importe: importe, plataforma: plataformaValue, fecha: fecha);

    final dbHelper = DatabaseHelper();
    final id = await dbHelper
        .insertTransaction(transaction); // Insertar en la base de datos

    setState(() {
      transactions.add(transaction
          .toMap()); // Agregar el objeto transaction a la lista local
      totalImporte += double.parse(importe); // Actualizar el total
    });

    // Limpiar los controladores después de agregar la transacción
    importeController.clear();
    fechaController.clear();
    fechaController.text =
        getCurrentDateTime(); // Actualizar la fecha después de la limpieza
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.fromLTRB(20, 100, 20, 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Column(
              children: [
                Container(
                  margin: const EdgeInsets.fromLTRB(100, 16, 100, 0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      const Text(
                        'Importe',
                        style: TextStyle(
                          fontSize: 16.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 8.0),
                      TextField(
                        controller: importeController,
                        textAlign: TextAlign.center,
                        decoration: InputDecoration(
                          contentPadding: const EdgeInsets.symmetric(
                              vertical: 10, horizontal: 10),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10.0),
                            borderSide: const BorderSide(color: Colors.blue),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10.0),
                            borderSide: const BorderSide(color: Colors.grey),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  margin: const EdgeInsets.fromLTRB(100, 16, 100, 0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      const Text(
                        'Plataforma',
                        style: TextStyle(
                          fontSize: 16.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 8.0),
                      DropdownButtonFormField<String>(
                        value: plataformaValue,
                        items: [
                          'Calle',
                          'FreeNow',
                          'Uber',
                          'Cabify',
                          'Bolt',
                        ].map((String plataforma) {
                          return DropdownMenuItem<String>(
                            value: plataforma,
                            child: Text(plataforma),
                          );
                        }).toList(),
                        onChanged: (String? newValue) {
                          setState(() {
                            plataformaValue = newValue!;
                          });
                        },
                        decoration: InputDecoration(
                          contentPadding: const EdgeInsets.symmetric(
                              vertical: 10, horizontal: 10),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10.0),
                            borderSide: const BorderSide(color: Colors.blue),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10.0),
                            borderSide: const BorderSide(color: Colors.grey),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Visibility(
                  visible: false,
                  child: Container(
                    margin: const EdgeInsets.fromLTRB(100, 16, 100, 0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        const Text(
                          'Fecha',
                          style: TextStyle(
                            fontSize: 16.0,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(height: 8.0),
                        TextField(
                          controller: fechaController,
                          decoration: InputDecoration(
                            contentPadding: const EdgeInsets.symmetric(
                                vertical: 10, horizontal: 10),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10.0),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10.0),
                              borderSide: const BorderSide(color: Colors.blue),
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10.0),
                              borderSide: const BorderSide(color: Colors.grey),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: _addTransaction,
              child: const Text('Agregar Transacción'),
            ),
            const SizedBox(height: 20),
            Expanded(
              child: CardList(transactions: transactions),
            ),
          ],
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
                content: Text(
                    'El total de importe es: \$${totalImporte.toStringAsFixed(2)}'),
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
