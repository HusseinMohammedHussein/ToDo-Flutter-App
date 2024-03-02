import 'package:nb_utils/nb_utils.dart';
import 'package:todo_app/core/functions/navigation.dart';
import 'package:todo_app/core/utils/app_strings.dart';
import 'package:todo_app/core/utils/app_text_styles.dart';
import 'package:flutter/material.dart';

class SplashView extends StatefulWidget {
  const SplashView({super.key});

  @override
  State<SplashView> createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView> {
  @override
  void initState() {
    delayedNavigate(context, "/home");
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            AppStrings.splashFirstWord,
            style: CustomTextStyles.style50,
          ),
          const Text(
            AppStrings.splashSecondWord,
            style: CustomTextStyles.style20,
          ),
        ],
      ).center(),
    );
  }
}

void delayedNavigate(context, path) {
  Future.delayed(
    const Duration(seconds: 1),
    () {
      customReplacementNavigate(context, path);
    },
  );
}
