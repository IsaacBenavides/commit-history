import 'dart:convert';

import 'package:commit_history_mobile/data/uses_cases/base.dart';
import 'package:commit_history_mobile/data/uses_cases/get_repo_info.dart';
import 'package:commit_history_mobile/models/api/repo_response.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:http/http.dart' as http;
import 'package:mockito/mockito.dart';
import '../repository.dart';
import 'constants.dart';

void main() async {
  TestWidgetsFlutterBinding.ensureInitialized();
  await dotenv.load(fileName: ".env");

  group("Get Repo Info Use Case Tests: ", () {
    late MockRepoRepository mockRepoRepository;
    late GetRepoInfoUseCase getRepoInfoUseCase;
    setUpAll(() {
      mockRepoRepository = MockRepoRepository();
      getRepoInfoUseCase = GetRepoInfoUseCase(
        repoRepository: mockRepoRepository,
      );
    });
    test("Success", () async {
      when(mockRepoRepository.getRepoInfo()).thenAnswer(
        (_) => Future.value(
          http.Response(json.encode(getRepoInfoResponse), 200),
        ),
      );
      RepoResponse data = await getRepoInfoUseCase.call();
      expect(data.runtimeType, RepoResponse);
      expect(data.owner!.toJson(), (getRepoInfoResponse["owner"])!);
    });

    test("Failed 301", () async {
      when(mockRepoRepository.getRepoInfo()).thenAnswer(
        (_) => Future.value(
          http.Response(
            json.encode(
              {"message": error301},
            ),
            301,
          ),
        ),
      );
      Future<RepoResponse> data = getRepoInfoUseCase.call();
      expect(
        data,
        throwsA(
          predicate(
            (p0) => p0 is UseCaseException && p0.message == error301,
          ),
        ),
      );
    });

    test("Failed 500", () async {
      when(mockRepoRepository.getRepoInfo()).thenAnswer(
        (_) => Future.value(
          http.Response(json.encode({}), 500),
        ),
      );
      Future<RepoResponse> data = getRepoInfoUseCase.call();
      expect(
        data,
        throwsA(
          predicate(
            (p0) => p0 is UseCaseException && p0.message == error500,
          ),
        ),
      );
    });
  });
}
