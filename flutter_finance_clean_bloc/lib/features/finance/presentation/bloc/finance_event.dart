abstract class FinanceEvent {}

class LoadTransactionsEvent extends FinanceEvent {}

class AddTransactionEvent extends FinanceEvent {
  final dynamic transaction;
  AddTransactionEvent(this.transaction);
}

class UpdateTransactionEvent extends FinanceEvent {
  final dynamic transaction;
  UpdateTransactionEvent(this.transaction);
}

class DeleteTransactionEvent extends FinanceEvent {
  final String id;
  DeleteTransactionEvent(this.id);
}
