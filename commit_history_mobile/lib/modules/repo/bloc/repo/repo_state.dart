part of 'repo_bloc.dart';

@immutable
sealed class RepoState {}

final class RepoInitial extends RepoState {}

class RepoFetchingLoadingState extends RepoState {}

class RepoFetchingSuccess extends RepoState {
  final RepoResponse repoResponse;
  RepoFetchingSuccess({required this.repoResponse});
}

class RepoFetchingError extends RepoState {
  final String message;
  RepoFetchingError({required this.message});
}
