part of 'search_cubit.dart';

enum SearchStatus {
  initial,
  searching,
  loaded,
  error,
}

class SearchState extends Equatable {
  SearchState(
      {required this.transactions, required this.status, required this.error});

  final List<Transaction> transactions;
  final SearchStatus status;
  final String error;

  factory SearchState.initial() {
    return SearchState(
        transactions: [], status: SearchStatus.initial, error: '');
  }

  @override
  List<Object> get props => [transactions, status, error];

  SearchState copyWith({
    required List<Transaction> transactions,
    required SearchStatus status,
    required String error,
  }) {
    return SearchState(
      transactions: transactions,
      status: status,
      error: error,
    );
  }
}
