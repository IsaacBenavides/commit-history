part of 'history_bloc.dart';

@immutable
sealed class HistoryState {}

final class HistoryInitial extends HistoryState {}

class HistoryFetchingLoadingState extends HistoryState {}

class HistorySuccessState extends HistoryState {
  final List<HistoryResponse> historyList;
  HistorySuccessState({required this.historyList});
}

class HistoryFetchingError extends HistoryState {
  final String message;
  HistoryFetchingError({required this.message});
}
