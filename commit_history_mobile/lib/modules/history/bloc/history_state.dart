part of 'history_bloc.dart';

@immutable
sealed class HistoryState extends Equatable {}

final class HistoryInitial extends HistoryState {
  @override
  List<Object?> get props => [];
}

class HistoryFetchingLoadingState extends HistoryState {
  @override
  List<Object?> get props => [];
}

class HistorySuccessState extends HistoryState {
  final List<HistoryResponse> historyList;
  HistorySuccessState({required this.historyList});

  @override
  List<Object?> get props => [historyList];
}

class HistoryFetchingError extends HistoryState {
  final String message;
  HistoryFetchingError({required this.message});

  @override
  List<Object?> get props => [message];
}
