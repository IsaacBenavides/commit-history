part of 'history_bloc.dart';

@immutable
sealed class HistoryEvent {}

class HistoryInitialFetchEvent extends HistoryEvent {}
