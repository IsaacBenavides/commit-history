import 'package:commit_history_mobile/modules/initial/screen.dart';
import 'package:commit_history_mobile/ui/routes/routes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

void main() async {
  await dotenv.load(fileName: ".env");
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(430, 932),
      minTextAdapt: true,
      splitScreenMode: true,
      useInheritedMediaQuery: true,
      builder: (_, child) {
        return MaterialApp(
          themeMode: ThemeMode.dark,
          theme: ThemeData.dark(),
          builder: (context, child) {
            return MediaQuery(
              data: MediaQuery.of(context).copyWith(
                textScaleFactor:
                    MediaQuery.of(context).textScaleFactor.clamp(.5, 1.3),
              ),
              child: child!,
            );
          },
          onGenerateRoute: CustomRoutes.routes,
          debugShowCheckedModeBanner: false,
          title: 'Repo History',
          home: const InitialScreen(),
        );
      },
    );
  }
}
