// ignore_for_file: depend_on_referenced_packages

import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:commit_history_mobile/data/uses_cases/base.dart';
import 'package:commit_history_mobile/data/uses_cases/get_repo_history.dart';
import 'package:commit_history_mobile/models/api/history_response.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

part 'history_event.dart';
part 'history_state.dart';

class HistoryBloc extends Bloc<HistoryEvent, HistoryState> {
  final GetRepoHistoryUseCase getRepoHistoryUseCase;
  HistoryBloc({required this.getRepoHistoryUseCase}) : super(HistoryInitial()) {
    on<HistoryInitialFetchEvent>(getHistory);
  }

  getHistory(
    HistoryInitialFetchEvent event,
    Emitter<HistoryState> emit,
  ) async {
    emit(HistoryFetchingLoadingState());
    try {
      final List<HistoryResponse> historyList =
          await getRepoHistoryUseCase.call();
      emit(HistorySuccessState(historyList: historyList));
    } on UseCaseException catch (e) {
      emit(HistoryFetchingError(message: e.message));
    } on SocketException {
      emit(HistoryFetchingError(message: "we have a connection problem"));
    } catch (e) {
      emit(
        HistoryFetchingError(message: "There was a mistake. Try again later"),
      );
    }
  }
}
