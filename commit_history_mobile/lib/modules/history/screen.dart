import 'package:commit_history_mobile/modules/history/bloc/history_bloc.dart';
import 'package:commit_history_mobile/modules/history/history_list.dart';
import 'package:commit_history_mobile/ui/theme/colors.dart';
import 'package:commit_history_mobile/ui/widgets/custom_text.dart';
import 'package:commit_history_mobile/ui/widgets/scaffold_with_safe_area.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HistoryScreen extends StatelessWidget {
  const HistoryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => HistoryBloc(),
      child: const HistoryView(),
    );
  }
}

class HistoryView extends StatefulWidget {
  const HistoryView({super.key});

  @override
  State<HistoryView> createState() => _HistoryViewState();
}

class _HistoryViewState extends State<HistoryView> {
  @override
  void initState() {
    final HistoryBloc bloc = context.read<HistoryBloc>();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      bloc.add(HistoryInitialFetchEvent());
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final HistoryBloc bloc = context.watch<HistoryBloc>();
    return ScaffoldWithSafeArea(
      top: false,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: BlocConsumer<HistoryBloc, HistoryState>(
        builder: (context, state) {
          return Builder(builder: (_) {
            switch (state.runtimeType) {
              case HistoryFetchingLoadingState:
                return Center(
                  child: CircularProgressIndicator(
                    color: CustomColors.green,
                  ),
                );
              case HistorySuccessState:
                final newState = state as HistorySuccessState;
                return HistoryListWidget(historyList: newState.historyList);
              case HistoryFetchingError:
                final newState = state as HistoryFetchingError;
                return Center(
                  child: CustomText(text: newState.message),
                );
              default:
                return const Center(child: CustomText(text: "Repo Screen"));
            }
          });
        },
        listener: (_, __) {},
        bloc: bloc,
        listenWhen: (previous, current) => current is HistoryInitial,
        buildWhen: (previous, current) => current is! HistoryInitial,
      ),
    );
  }
}
