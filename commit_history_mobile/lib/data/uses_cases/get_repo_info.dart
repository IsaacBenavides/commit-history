import 'dart:convert';

import 'package:commit_history_mobile/data/repository/repo.dart';
import 'package:commit_history_mobile/data/uses_cases/base.dart';
import 'package:commit_history_mobile/models/api/repo_response.dart';
import 'package:http/http.dart' as http;

class GetRepoInfoUseCase extends UseCaseNoParams<RepoResponse> {
  final RepoRepository repoRepository;

  GetRepoInfoUseCase({required this.repoRepository});

  @override
  Future<RepoResponse> call() async {
    final http.Response response = await repoRepository.getRepoInfo();
    switch (response.statusCode) {
      case 200:
        return repoResponseFromJson(response.bodyBytes);
      case 301:
        throw UseCaseException(
          json.decode(response.body)["message"].toString(),
        );
      case 403:
        throw UseCaseException(
          json.decode(response.body)["message"].toString(),
        );
      case 404:
        throw UseCaseException(
          json.decode(response.body)["message"].toString(),
        );
      default:
        throw UseCaseException("There was a mistake. Try again later");
    }
  }
}
