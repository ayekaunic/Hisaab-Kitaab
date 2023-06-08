import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:proj/models/models.dart';
import 'package:proj/repositories/repositories.dart';

part 'search_state.dart';

class SearchCubit extends Cubit<SearchState> {
  final TransactionsRepository _transactionsRepository;

  SearchCubit({required TransactionsRepository transactionsRepository})
      : _transactionsRepository = transactionsRepository,
        super(SearchState.initial());

  void loadAll() async {
    try {
      final transactions = await _transactionsRepository.getAllTransactions();
      emit(state.copyWith(
          transactions: transactions, status: SearchStatus.loaded, error: ''));
    } catch (e) {
      emit(state.copyWith(
          status: SearchStatus.error, error: e.toString(), transactions: []));
    }
  }

  void search(String keyword) async {
    if (keyword.isEmpty) {
      emit(state.copyWith(
          status: SearchStatus.searching, error: '', transactions: []));
      loadAll();
      return;
    }

    try {
      final list =
          await _transactionsRepository.filterTransactions(keyword: keyword);
      emit(state.copyWith(
          status: SearchStatus.loaded, transactions: list, error: ''));
    } catch (e) {
      emit(state.copyWith(
          status: SearchStatus.error, error: e.toString(), transactions: []));
    }
  }
}
