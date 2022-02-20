import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:wayve_test_app/core/ui/base/base_view.dart';
import 'package:wayve_test_app/core/utils/splash_screen/view_model.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BaseView<SplashScreenViewModel>(
      onModelReady: (model)=>model.init(),
      model: SplashScreenViewModel(),
      builder: (context, model, _) => const Scaffold(
        body: Center(
          child: Text('Splash Screen', style: TextStyle(color: Colors.red, fontSize: 30),),
        ),
      ),
    );
  }

}