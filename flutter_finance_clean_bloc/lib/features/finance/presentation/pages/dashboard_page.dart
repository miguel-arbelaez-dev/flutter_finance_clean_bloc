import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc/finance_bloc.dart';
import '../bloc/finance_state.dart';


import '../widgets/balance_card.dart';
import '../widgets/transaction_tile.dart';
import 'transaction_form_page.dart';
import '../../../../core/utils/enums.dart';

class FinanceDashboardPage extends StatelessWidget {
  const FinanceDashboardPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Finance')),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (_) => const TransactionFormPage(),
            ),
          );
        },
        child: const Icon(Icons.add),
      ),
      body: BlocBuilder<FinanceBloc, FinanceState>(
        builder: (context, state) {
          if (state is FinanceLoading) {
            return const Center(child: CircularProgressIndicator());
          }

          if (state is FinanceLoaded) {
            final income = state.transactions
                .where((t) => t.type == TransactionType.income)
                .fold<double>(0, (sum, t) => sum + t.amount);

            final expense = state.transactions
                .where((t) => t.type == TransactionType.expense)
                .fold<double>(0, (sum, t) => sum + t.amount);

            return Column(
              children: [
                BalanceCard(income: income, expense: expense),
                Expanded(
                  child: ListView.builder(
                    itemCount: state.transactions.length,
                    itemBuilder: (_, index) {
                      return TransactionTile(
                        transaction: state.transactions[index],
                      );
                    },
                  ),
                ),
              ],
            );
          }

          return const Center(child: Text('Error'));
        },
      ),
    );
  }
}
