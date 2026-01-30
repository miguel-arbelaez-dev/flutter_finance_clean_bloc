import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_finance_clean_bloc/features/finance/presentation/pages/dashboard_page.dart';
import '../features/finance/presentation/bloc/finance_bloc.dart';
import 'app_providers.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return AppProviders(
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Finance App',
        theme: ThemeData(useMaterial3: true),
        home: const FinanceDashboardPage(),
      ),
    );
  }
}