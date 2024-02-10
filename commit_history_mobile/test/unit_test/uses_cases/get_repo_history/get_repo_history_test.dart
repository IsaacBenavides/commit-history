import 'dart:convert';

import 'package:commit_history_mobile/data/uses_cases/base.dart';
import 'package:commit_history_mobile/data/uses_cases/get_repo_history.dart';
import 'package:commit_history_mobile/models/api/history_response.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:http/http.dart' as http;

import '../repository.dart';
import 'constants.dart';

void main() async {
  TestWidgetsFlutterBinding.ensureInitialized();
  await dotenv.load(fileName: ".env");
  late MockRepoRepository mockRepoRepository;
  late GetRepoHistoryUseCase getRepoHistoryUseCase;
  setUpAll(() {
    mockRepoRepository = MockRepoRepository();
    getRepoHistoryUseCase = GetRepoHistoryUseCase(
      repoRepository: mockRepoRepository,
    );
  });
  group("Get Repo History Use Case Tests: ", () {
    test("Success", () async {
      when(mockRepoRepository.getRepoHistory()).thenAnswer(
        (_) => Future.value(
          http.Response(json.encode(getRepoHistory), 200),
        ),
      );
      List<HistoryResponse> data = await getRepoHistoryUseCase.call();
      expect(data.runtimeType, List<HistoryResponse>);
      expect(
        data[0].commit!.author!.name,
        getRepoHistory[0]["commit"]!["author"]!["name"],
      );
    });

    test("Failed 500", () async {
      when(mockRepoRepository.getRepoHistory()).thenAnswer(
        (_) => Future.value(
          http.Response(json.encode({}), 500),
        ),
      );
      Future<List<HistoryResponse>> data = getRepoHistoryUseCase.call();
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
