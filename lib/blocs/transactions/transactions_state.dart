part of 'transactions_bloc.dart';

enum TStatus {
  initial,
  loading,
  loaded,
  error,
}

class TransactionsState extends Equatable {
  final List<Transaction> transactionsList;
  final TStatus status;
  final String error;

  TransactionsState({
    required this.transactionsList,
    required this.status,
    required this.error,
  });

  factory TransactionsState.initial() {
    return TransactionsState(
      transactionsList: [],
      status: TStatus.initial,
      error: '',
    );
  }

  @override
  List<Object> get props => [
        transactionsList,
        status,
        error,
      ];

  TransactionsState copyWith({
    required List<Transaction> transactionsList,
    required TStatus status,
    required String error,
  }) {
    return TransactionsState(
      transactionsList: transactionsList,
      status: status,
      error: error,
    );
  }
}
