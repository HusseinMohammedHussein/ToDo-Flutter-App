import 'package:flutter/cupertino.dart';
import 'package:todo_app/core/routes/app_router.dart';
import 'package:todo_app/core/utils/app_colors.dart';
import 'package:flutter/material.dart';

class TODOAPP extends StatelessWidget {
  const TODOAPP({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      localizationsDelegates: const [
        DefaultMaterialLocalizations.delegate,
        DefaultCupertinoLocalizations.delegate,
        DefaultWidgetsLocalizations.delegate,
      ],
      theme: ThemeData(scaffoldBackgroundColor: AppColors.offWhite),
      debugShowCheckedModeBanner: false,
      routerConfig: router,
    );
  }
}
