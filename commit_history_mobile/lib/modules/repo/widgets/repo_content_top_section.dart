import 'package:commit_history_mobile/models/api/repo_response.dart';
import 'package:commit_history_mobile/ui/widgets/custom_text.dart';
import 'package:commit_history_mobile/utils/images.dart';
import 'package:commit_history_mobile/utils/size.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

class RepoContentTopSection extends StatelessWidget {
  final RepoResponse repoResponse;

  const RepoContentTopSection({super.key, required this.repoResponse});

  _numberInfo({
    required String icon,
    required String title,
    required String value,
  }) {
    return Row(
      children: [
        SvgPicture.asset(
          icon,
          theme: const SvgTheme(
            currentColor: Colors.white,
          ),
          width: 12.sp,
        ),
        gapW4,
        RichText(
          text: CustomTextSpan(
            children: [
              CustomTextSpan(
                fontSize: 14.sp,
                text: value,
                fontWeight: FontWeight.w600,
                color: Colors.white,
              ),
              CustomTextSpan(
                text: " $title",
                fontSize: 14.sp,
              )
            ],
          ),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 15.sp),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: 20.sp),
          Row(
            children: [
              CircleAvatar(
                radius: 15.sp,
                backgroundImage: NetworkImage(repoResponse.owner!.avatarUrl!),
              ),
              SizedBox(width: 10.sp),
              CustomText(
                text: repoResponse.owner!.login!,
                fontWeight: FontWeight.w400,
                fontSize: 14.sp,
                color: Colors.white.withOpacity(.9),
              )
            ],
          ),
          gapH12,
          CustomText(
            text: repoResponse.name!,
            fontWeight: FontWeight.w700,
            fontSize: 24.sp,
          ),
          gapH12,
          Row(
            children: [
              _numberInfo(
                icon: AppIcons.start,
                title: "start",
                value: (repoResponse.starts ?? 0).toString(),
              ),
              gapW12,
              _numberInfo(
                icon: AppIcons.forks,
                title: "forks",
                value: (repoResponse.forks ?? 0).toString(),
              ),
            ],
          )
        ],
      ),
    );
  }
}
