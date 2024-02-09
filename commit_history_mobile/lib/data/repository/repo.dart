import "package:commit_history_mobile/data/repository/base.dart";
import "package:http/http.dart" as http;

class RepoRepository {
  final BaseRepository baseRepository;
  RepoRepository({required this.baseRepository});

  Future<http.Response> getRepoInfo() {
    return baseRepository.get("/repo-info/");
  }
}
