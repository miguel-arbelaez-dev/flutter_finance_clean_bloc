import '../../domain/entities/transaction.dart';

abstract class FinanceState {}

class FinanceLoading extends FinanceState {}

class FinanceLoaded extends FinanceState {
  final List<FinanceTransaction> transactions;

  FinanceLoaded(this.transactions);
}

class FinanceError extends FinanceState {}
