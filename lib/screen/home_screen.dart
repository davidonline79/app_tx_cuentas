import 'package:app_tx_cuentas/screen/screen.dart';
import 'package:app_tx_cuentas/widgets/widgets.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('100€'), centerTitle: true,),
      body: const EntryScreen(),
      bottomNavigationBar: const CustomBottomAppBar(),
      
    );
  }
}

