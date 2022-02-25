import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:wayve_test_app/core/ui/base/base_view.dart';
import 'package:wayve_test_app/core/ui/styles/colors.dart';
import 'package:wayve_test_app/core/utils/splash_screen/view_model.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BaseView<SplashScreenViewModel>(
      onModelReady: (model)=>model.init(context),
      model: SplashScreenViewModel(),
      builder: (context, model, _) => Scaffold(
        body: Stack(
          children: [
            const Center(
              child: Text('Wayve Test App', style: TextStyle(color: AppColors.titleColor, fontSize: 30),),
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: Padding(
                padding: const EdgeInsets.only(bottom: 18),
                child: Text(
                  "Wayve (C) ${DateTime.now().year} All Rights Reserved.",
                  style: const TextStyle(
                      color: AppColors.appGrey,
                      fontSize: 15
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

}