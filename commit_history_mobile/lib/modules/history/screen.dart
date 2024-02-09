import 'package:commit_history_mobile/ui/widgets/custom_text.dart';
import 'package:commit_history_mobile/ui/widgets/scaffold_with_safe_area.dart';
import 'package:flutter/material.dart';

class HistoryScreen extends StatelessWidget {
  const HistoryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const ScaffoldWithSafeArea(
      body: Center(
        child: CustomText(text: "History Page"),
      ),
    );
  }
}
