import 'package:app_tx_cuentas/screen/trips_screen.dart';
import 'package:flutter/material.dart';

class BottomAction extends StatelessWidget {
  //final icon;
  const BottomAction({
    super.key,
    //required this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Icon(
          Icons.abc,
          size: 40,
        ),
      ),
      onTap: () {
        Navigator.of(context).push(MaterialPageRoute(
          builder: (context) => const TripsScreen(),
        ));
      },
    );
  }
}
