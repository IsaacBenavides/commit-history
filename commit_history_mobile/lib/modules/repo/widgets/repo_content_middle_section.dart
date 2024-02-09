// ignore_for_file: unused_element

import 'package:commit_history_mobile/models/api/repo_response.dart';
import 'package:commit_history_mobile/ui/routes/names.dart';
import 'package:commit_history_mobile/ui/theme/colors.dart';
import 'package:commit_history_mobile/ui/widgets/custom_text.dart';
import 'package:commit_history_mobile/utils/images.dart';
import 'package:commit_history_mobile/utils/size.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

class RepoContentMiddleSection extends StatelessWidget {
  final RepoResponse repoResponse;

  const RepoContentMiddleSection({super.key, required this.repoResponse});

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return Container(
      color: CustomColors.grey,
      width: size.width,
      padding: EdgeInsets.symmetric(horizontal: 20.sp),
      child: Column(
        children: [
          _Item(
            icon: AppIcons.issues,
            indicatorColor: CustomColors.green,
            text: 'Issues',
            value: (repoResponse.issues ?? 0).toString(),
          ),
          _Item(
            icon: AppIcons.pullRequest,
            indicatorColor: CustomColors.blue,
            text: 'Pull Requests',
            onTap: () => Navigator.of(context).pushNamed(Routes.history),
            value: 0.toString(),
          ),
          _Item(
            icon: AppIcons.actions,
            indicatorColor: CustomColors.chocolate,
            text: 'Actions',
            onTap: () => Navigator.of(context).pushNamed(Routes.history),
          ),
          _Item(
            icon: AppIcons.commits,
            indicatorColor: CustomColors.secondGrey,
            text: 'Commits',
            onTap: () => Navigator.of(context).pushNamed(Routes.history),
          ),
        ],
      ),
    );
  }
}

class _Item extends StatelessWidget {
  final Color indicatorColor;
  final String text, icon;
  final VoidCallback? onTap;
  final String? value;

  const _Item({
    required this.indicatorColor,
    required this.text,
    required this.icon,
    this.onTap,
    this.value,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        margin: EdgeInsets.symmetric(vertical: 20.sp),
        width: double.infinity,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                Container(
                  width: 32.sp,
                  height: 32.sp,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5.sp),
                    color: indicatorColor,
                  ),
                  alignment: Alignment.center,
                  child: SvgPicture.asset(
                    icon,
                    theme: const SvgTheme(currentColor: Colors.white),
                    width: 16.sp,
                  ),
                ),
                gapW12,
                CustomText(
                  text: text,
                  fontSize: 16.sp,
                  fontWeight: FontWeight.w600,
                )
              ],
            ),
            if (value != null) CustomText(text: value!)
          ],
        ),
      ),
    );
  }
}
