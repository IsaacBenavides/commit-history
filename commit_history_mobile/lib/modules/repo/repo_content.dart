import 'package:commit_history_mobile/models/api/repo_response.dart';
import 'package:commit_history_mobile/modules/repo/bloc/repo/repo_bloc.dart';
import 'package:commit_history_mobile/modules/repo/widgets/repo_content_middle_section.dart';
import 'package:commit_history_mobile/modules/repo/widgets/repo_content_top_section.dart';
import 'package:commit_history_mobile/utils/size.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class RepoContent extends StatelessWidget {
  final RepoResponse repoResponse;

  const RepoContent({super.key, required this.repoResponse});

  @override
  Widget build(BuildContext context) {
    RepoBloc bloc = context.read<RepoBloc>();
    final Size size = MediaQuery.of(context).size;
    return RefreshIndicator(
      onRefresh: () async => bloc.add(RepoInitialFetchEvent()),
      child: SizedBox(
        width: size.width,
        height: size.height,
        child: SingleChildScrollView(
          physics: const AlwaysScrollableScrollPhysics(),
          child: Column(
            children: [
              RepoContentTopSection(repoResponse: repoResponse),
              gapH32,
              RepoContentMiddleSection(repoResponse: repoResponse)
            ],
          ),
        ),
      ),
    );
  }
}
