import 'package:flutter/material.dart';

class ScaffoldWithSafeArea extends StatelessWidget {
  final Widget body;
  final PreferredSizeWidget? appBar;
  final bool? top, bottom;
  const ScaffoldWithSafeArea(
      {super.key, required this.body, this.appBar, this.top, this.bottom});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar,
      body: SafeArea(
        top: top ?? true,
        bottom: bottom ?? true,
        child: body,
      ),
    );
  }
}
