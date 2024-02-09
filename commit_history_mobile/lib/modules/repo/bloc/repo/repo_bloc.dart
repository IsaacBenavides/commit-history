// ignore_for_file: depend_on_referenced_packages

import 'dart:async';
import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:commit_history_mobile/data/repository/base.dart';
import 'package:commit_history_mobile/data/repository/repo.dart';
import 'package:commit_history_mobile/data/uses_cases/base.dart';
import 'package:commit_history_mobile/data/uses_cases/get_repo_info.dart';
import 'package:commit_history_mobile/models/api/repo_response.dart';
import 'package:meta/meta.dart';

part 'repo_event.dart';
part 'repo_state.dart';

class RepoBloc extends Bloc<RepoEvent, RepoState> {
  RepoBloc() : super(RepoInitial()) {
    on<RepoInitialFetchEvent>(getRepoInfo);
  }

  FutureOr<void> getRepoInfo(
      RepoInitialFetchEvent event, Emitter<RepoState> emit) async {
    emit(RepoFetchingLoadingState());

    try {
      final GetRepoInfoUseCase getRepoInfoUseCase = GetRepoInfoUseCase(
        repoRepository: RepoRepository(
          baseRepository: BaseRepository(),
        ),
      );
      final RepoResponse repoResponse = await getRepoInfoUseCase.call();
      emit(RepoFetchingSuccess(repoResponse: repoResponse));
    } on UseCaseException catch (e) {
      emit(RepoFetchingError(message: e.message));
    } on SocketException {
      emit(RepoFetchingError(message: "we have a connection problem"));
    } catch (e) {
      emit(RepoFetchingError(message: "There was a mistake. Try again later"));
    }
  }
}
