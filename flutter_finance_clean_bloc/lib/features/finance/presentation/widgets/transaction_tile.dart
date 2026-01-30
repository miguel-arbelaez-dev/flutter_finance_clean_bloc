import 'package:flutter/material.dart';

import '../../../../core/utils/enums.dart';
import '../../domain/entities/transaction.dart';

class TransactionTile extends StatelessWidget {
  final FinanceTransaction transaction;

  const TransactionTile({super.key, required this.transaction});

  @override
  Widget build(BuildContext context) {
    final isIncome = transaction.type == TransactionType.income;

    return ListTile(
      leading: Icon(
        isIncome ? Icons.arrow_downward : Icons.arrow_upward,
        color: isIncome ? Colors.green : Colors.red,
      ),
      title: Text(transaction.category),
      subtitle: Text(transaction.description ?? ''),
      trailing: Text(
        transaction.amount.toStringAsFixed(2),
        style: TextStyle(
          color: isIncome ? Colors.green : Colors.red,
        ),
      ),
    );
  }
}
