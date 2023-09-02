
import 'package:app_tx_cuentas/presentacion/screen/screen.dart';
import 'package:flutter/material.dart';

class BottomAction1 extends StatelessWidget {
  final IconData icon;
  const BottomAction1({
    super.key,
    required this.icon, 
    //required this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Icon(
          icon,
          size: 40,
        ),
      ),
      onTap: () {
        Navigator.of(context).push(MaterialPageRoute(
          builder: (context) => const TransactionListScreen(),
        ));
      },
    );
  }
}


class BottomAction2 extends StatelessWidget {
  final IconData icon;
  const BottomAction2({
    super.key,
    required this.icon, 
    //required this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Icon(
          icon,
          size: 40,
        ),
      ),
      onTap: () {
        Navigator.of(context).push(MaterialPageRoute(
          builder: (context) => const EntryScreen(),
        ));
      },
    );
  }
}

class BottomAction3 extends StatelessWidget {
  final IconData icon;
  const BottomAction3({
    super.key,
    required this.icon, 
    //required this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Icon(
          icon,
          size: 40,
        ),
      ),
      onTap: () {
        Navigator.of(context).push(MaterialPageRoute(
          builder: (context) => const ClosedScreen(),
        ));
      },
    );
  }
}
