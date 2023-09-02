import 'package:app_tx_cuentas/presentacion/screen/screen.dart';
import 'package:app_tx_cuentas/presentacion/widgets/widgets.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return  const Scaffold(
      // appBar: AppBar(title: const Text('100€'), centerTitle: true,),
      body: EntryScreen(),
      bottomNavigationBar: CustomBottomAppBar(),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerTop,
      // floatingActionButton: CustomFloatingActionButton(),
    );
  }
}

