import 'package:app_tx_cuentas/presentacion/widgets/widgets.dart';
import 'package:flutter/material.dart';

class ClosedScreen extends StatelessWidget {
   
  const ClosedScreen({super.key});
  
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
         child: Text('ClosedScreen'),
      ),
      bottomNavigationBar: CustomBottomAppBar(),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerTop,
      // floatingActionButton: CustomFloatingActionButton(),
    );
  }
}