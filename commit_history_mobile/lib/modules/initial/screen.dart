import 'package:commit_history_mobile/ui/routes/names.dart';
import 'package:commit_history_mobile/ui/widgets/custom_button.dart';
import 'package:commit_history_mobile/ui/widgets/custom_text.dart';
import 'package:commit_history_mobile/ui/widgets/scaffold_with_safe_area.dart';
import 'package:commit_history_mobile/utils/images.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

class InitialScreen extends StatelessWidget {
  const InitialScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const ScaffoldWithSafeArea(
      body: Center(
        child: Column(
          children: [
            MainContent(),
            BottomContent(),
          ],
        ),
      ),
    );
  }
}

class MainContent extends StatelessWidget {
  const MainContent({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Expanded(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        mainAxisSize: MainAxisSize.max,
        children: [
          const CustomText(
            text: "Repo History",
            color: Colors.white,
            fontSize: 22,
            fontWeight: FontWeight.w600,
          ),
          const SizedBox(height: 30),
          Image.asset(
            AppImages.github,
            width: size.width * .7,
          ),
        ],
      ),
    );
  }
}

class BottomContent extends StatelessWidget {
  const BottomContent({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SizedBox(
      width: size.width * .8,
      height: 55.sp,
      child: CustomButtom(
        onTap: () => Navigator.of(context).pushNamed(Routes.repo),
        paddingButtonHorizontal: 30,
        color: const Color(0xff25292e),
        child: Row(
          mainAxisSize: MainAxisSize.max,
          children: [
            SvgPicture.asset(
              AppIcons.github,
              theme: const SvgTheme(currentColor: Colors.white),
              width: 25.sp,
            ),
            Expanded(
              child: Center(
                child: CustomText(
                  text: "Press To Continue",
                  fontWeight: FontWeight.w600,
                  fontSize: 16.sp,
                  color: Colors.white,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
