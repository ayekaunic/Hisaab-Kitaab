import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:proj/models/models.dart';
import 'package:proj/repositories/repositories.dart';

part 'transactions_event.dart';
part 'transactions_state.dart';

class TransactionsBloc extends Bloc<TransactionsEvent, TransactionsState> {
  final TransactionsRepository _transactionsRepository;

  TransactionsBloc({required TransactionsRepository transactionsRepository})
      : this._transactionsRepository = transactionsRepository,
        super(TransactionsState.initial()) {
    on<TransactionsEvent>(
        (TransactionsEvent event, Emitter<TransactionsState> emit) async {
      if (event is UpdateTransactions) {
        emit(state.copyWith(
            transactionsList: event.transactions,
            status: TStatus.loaded,
            error: ''));
      }
      if (event is GetTransactions) {
        emit(state.copyWith(
            status: TStatus.loading, error: '', transactionsList: []));
        try {
          final transactions = await _transactionsRepository.loadTransactions();
          add(UpdateTransactions(transactions: transactions));
        } catch (e) {
          emit(state.copyWith(
              status: TStatus.error, error: "error", transactionsList: []));
        }
      }

      if (event is AddTransaction) {
        emit(state.copyWith(
            status: TStatus.loading, error: '', transactionsList: []));
        try {
          final transactions = await _transactionsRepository.addTransaction(
              list: state.transactionsList, addT: event.transaction);
          add(UpdateTransactions(transactions: transactions));
        } catch (e) {
          emit(state.copyWith(
              status: TStatus.error,
              error: e.toString(),
              transactionsList: []));
        }
      }

      if (event is RemoveTransaction) {
        emit(state.copyWith(
            status: TStatus.loading, error: '', transactionsList: []));
        try {
          final transactions = await _transactionsRepository.removeTransaction(
              list: state.transactionsList, remTID: event.transactionID);
          add(UpdateTransactions(transactions: transactions));
        } catch (e) {
          emit(state.copyWith(
              status: TStatus.error,
              error: e.toString(),
              transactionsList: []));
        }
      }

      if (event is UpdateTransaction) {
        emit(state.copyWith(
            status: TStatus.loading, error: '', transactionsList: []));
        try {
          await _transactionsRepository.updateTransaction(
              transaction: event.transaction);
          final transactions =
              await _transactionsRepository.getAllTransactions();
          add(UpdateTransactions(transactions: transactions));
        } catch (e) {
          emit(state.copyWith(
              status: TStatus.error,
              error: e.toString(),
              transactionsList: []));
        }
      }
    });
  }
}
