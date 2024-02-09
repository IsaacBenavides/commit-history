import 'package:commit_history_mobile/data/repository/repo.dart';
import 'package:commit_history_mobile/data/uses_cases/base.dart';
import 'package:commit_history_mobile/models/api/history_response.dart';
import 'package:http/http.dart' as http;

class GetRepoHistoryUseCase extends UseCaseNoParams<List<HistoryResponse>> {
  final RepoRepository repoRepository;

  GetRepoHistoryUseCase({required this.repoRepository});

  @override
  Future<List<HistoryResponse>> call() async {
    final http.Response response = await repoRepository.getRepoHistory();

    switch (response.statusCode) {
      case 200:
        return historyResponseFromJson(response.bodyBytes);
      default:
        throw UseCaseException("There was a mistake. Try again later");
    }
  }
}
