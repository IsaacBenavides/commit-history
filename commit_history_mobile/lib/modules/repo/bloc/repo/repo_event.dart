part of 'repo_bloc.dart';

@immutable
sealed class RepoEvent {}

class RepoInitialFetchEvent extends RepoEvent {}
