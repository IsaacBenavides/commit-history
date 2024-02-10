import 'package:bloc_test/bloc_test.dart';
import 'package:commit_history_mobile/data/uses_cases/base.dart';
import 'package:commit_history_mobile/modules/history/bloc/history_bloc.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

import 'use_case.dart';

void main() async {
  TestWidgetsFlutterBinding.ensureInitialized();
  await dotenv.load(fileName: ".env");

  group("History Bloc", () {
    late MockGetRepoHistoryUseCase mockGetRepoHistoryUseCase;

    setUpAll(() {
      mockGetRepoHistoryUseCase = MockGetRepoHistoryUseCase();
    });

    blocTest(
      "Make Request when call initial state",
      build: () {
        when(mockGetRepoHistoryUseCase.call()).thenAnswer((_) {
          return Future.value([]);
        });
        return HistoryBloc(
          getRepoHistoryUseCase: mockGetRepoHistoryUseCase,
        );
      },
      act: (bloc) => bloc.add(
        HistoryInitialFetchEvent(),
      ),
      expect: () => [
        HistoryFetchingLoadingState(),
        HistorySuccessState(historyList: const []),
      ],
    );

    blocTest(
      "Make Request and got error",
      build: () {
        when(mockGetRepoHistoryUseCase.call()).thenAnswer((_) {
          throw UseCaseException("Error");
        });
        return HistoryBloc(
          getRepoHistoryUseCase: mockGetRepoHistoryUseCase,
        );
      },
      act: (bloc) => bloc..add(HistoryInitialFetchEvent()),
      expect: () => [
        HistoryFetchingLoadingState(),
        HistoryFetchingError(message: "Error"),
      ],
    );
  });
}
