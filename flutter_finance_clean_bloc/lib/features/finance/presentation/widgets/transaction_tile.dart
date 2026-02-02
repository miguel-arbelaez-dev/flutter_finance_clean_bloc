import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_finance_clean_bloc/features/finance/presentation/bloc/finance_bloc.dart';
import 'package:flutter_finance_clean_bloc/features/finance/presentation/bloc/finance_event.dart';

import '../../../../core/utils/enums.dart';
import '../../domain/entities/transaction.dart';


class TransactionTile extends StatelessWidget {
  final FinanceTransaction transaction;

  const TransactionTile({
    super.key,
    required this.transaction,
  });

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
          fontWeight: FontWeight.w600,
        ),
      ),
      onLongPress: () {
        _showDeleteDialog(context);
      },
    );
  }

  void _showDeleteDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (_) => AlertDialog(
        title: const Text('Delete transaction'),
        content: const Text(
          'Are you sure you want to delete this transaction?',
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('Cancel'),
          ),
          TextButton(
            onPressed: () {
              context
                  .read<FinanceBloc>()
                  .add(DeleteTransactionEvent(transaction.id));
              Navigator.pop(context);
            },
            child: const Text(
              'Delete',
              style: TextStyle(color: Colors.red),
            ),
          ),
        ],
      ),
    );
  }
}