import 'package:commit_history_mobile/models/api/history_response.dart';
import 'package:commit_history_mobile/ui/routes/names.dart';
import 'package:commit_history_mobile/ui/theme/colors.dart';
import 'package:commit_history_mobile/ui/widgets/custom_text.dart';
import 'package:commit_history_mobile/utils/size.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'bloc/history_bloc.dart';

class HistoryListWidget extends StatelessWidget {
  const HistoryListWidget({super.key, required this.historyList});

  final List<HistoryResponse> historyList;

  @override
  Widget build(BuildContext context) {
    final HistoryBloc bloc = context.watch<HistoryBloc>();

    return RefreshIndicator(
      onRefresh: () async => bloc.add(HistoryInitialFetchEvent()),
      color: CustomColors.green,
      child: ListView.builder(
        itemCount: historyList.length,
        itemBuilder: (_, index) {
          final HistoryResponse history = historyList[index];
          return GestureDetector(
            onTap: () => Navigator.of(context)
                .pushNamed(Routes.webview, arguments: history.htmlUrl),
            child: Container(
              color: CustomColors.secondGrey,
              padding: EdgeInsets.symmetric(vertical: 15.sp, horizontal: 20.sp),
              width: double.infinity,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CustomText(
                    text: history.commit!.message!,
                    fontWeight: FontWeight.w600,
                    fontSize: 15.sp,
                    textOverflow: TextOverflow.ellipsis,
                  ),
                  gapH12,
                  Row(
                    children: [
                      CircleAvatar(
                        radius: 10.sp,
                        backgroundImage: NetworkImage(
                          history.commit!.author!.avatar!,
                        ),
                      ),
                      gapW8,
                      CustomText(
                        text: history.commit!.author!.login!,
                        fontWeight: FontWeight.w500,
                      ),
                      gapW4,
                      const CustomText(
                        text: "authored",
                        color: Colors.white54,
                      )
                    ],
                  )
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
