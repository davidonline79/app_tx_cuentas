import 'package:app_tx_cuentas/presentacion/widgets/widgets.dart';
import 'package:flutter/material.dart';

class CustomBottomAppBar extends StatelessWidget {
  const CustomBottomAppBar({super.key});

  @override
  Widget build(BuildContext context) {
  
    return const BottomAppBar(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        mainAxisSize: MainAxisSize.max,
        children: <Widget>[ 
          BottomAction1(icon: Icons.car_crash_outlined,),
          BottomAction2(icon: Icons.add_box_outlined,),
          BottomAction3(icon: Icons.close_outlined,),
        ],
      ),
    );
  }
}
