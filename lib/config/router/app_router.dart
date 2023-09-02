import 'package:app_tx_cuentas/presentacion/screen/screen.dart';
import 'package:go_router/go_router.dart';

final appRouter = GoRouter(
  routes: [
    GoRoute(
      path: '/',
      builder: (context, state) => const HomeScreen(),
    ),
    GoRoute(
      path: 'trips_screen',
      builder: (context, state) => const TransactionListScreen(),
    ),
    GoRoute(
      path: 'entry_screen',
      builder: (context, state) => const EntryScreen(),
    )
  ],
);
