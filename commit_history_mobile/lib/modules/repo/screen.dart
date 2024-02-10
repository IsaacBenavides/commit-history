import 'package:commit_history_mobile/data/repository/base.dart';
import 'package:commit_history_mobile/data/repository/repo.dart';
import 'package:commit_history_mobile/data/uses_cases/get_repo_info.dart';
import 'package:commit_history_mobile/modules/repo/bloc/repo/repo_bloc.dart';
import 'package:commit_history_mobile/modules/repo/repo_content.dart';
import 'package:commit_history_mobile/ui/theme/colors.dart';
import 'package:commit_history_mobile/ui/widgets/custom_text.dart';
import 'package:commit_history_mobile/ui/widgets/scaffold_with_safe_area.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class RepoScreen extends StatelessWidget {
  const RepoScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => RepoBloc(
        getRepoInfoUseCase: GetRepoInfoUseCase(
          repoRepository: RepoRepository(
            baseRepository: BaseRepository(),
          ),
        ),
      ),
      child: const RepoView(),
    );
  }
}

class RepoView extends StatefulWidget {
  const RepoView({super.key});

  @override
  State<RepoView> createState() => _RepoViewState();
}

class _RepoViewState extends State<RepoView>
    with AutomaticKeepAliveClientMixin {
  @override
  void initState() {
    RepoBloc bloc = context.read<RepoBloc>();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      bloc.add(RepoInitialFetchEvent());
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    RepoBloc bloc = context.watch<RepoBloc>();
    return ScaffoldWithSafeArea(
      top: false,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: BlocConsumer<RepoBloc, RepoState>(
        listenWhen: (previous, current) => current is RepoInitial,
        buildWhen: (previous, current) => current is! RepoInitial,
        builder: (context, state) {
          switch (state.runtimeType) {
            case RepoFetchingLoadingState:
              return Center(
                child: CircularProgressIndicator(
                  color: CustomColors.green,
                ),
              );
            case RepoFetchingSuccess:
              final newState = state as RepoFetchingSuccess;
              return RepoContent(repoResponse: newState.repoResponse);
            case RepoFetchingError:
              final newState = state as RepoFetchingError;
              return Center(
                child: CustomText(text: newState.message),
              );
            default:
              return const Center(child: CustomText(text: "Repo Screen"));
          }
        },
        bloc: bloc,
        listener: (_, __) {},
      ),
    );
  }

  @override
  bool get wantKeepAlive => true;
}
