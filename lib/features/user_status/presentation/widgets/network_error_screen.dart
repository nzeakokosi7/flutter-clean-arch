import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:wayve_test_app/core/ui/styles/text_styles.dart';
import 'package:wayve_test_app/core/utils/extensions.dart';

class NetworkErrorScreen extends StatelessWidget {
  final Function refreshAction;

  const NetworkErrorScreen({
    Key? key,
    required this.refreshAction,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: context.ofHeight(1.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text(
            "You're currently offline, kindly check your network connectivity",
            textAlign: TextAlign.center,
            style: TextStyle(color: Colors.red, fontSize: 15),
          ),
          TextButton(
              onPressed: ()=>refreshAction,
              child: const Text(
                  "Refresh",
                style: TextStyle(color: Colors.blue, fontSize: 13),
              )
          )
        ],
      ),
    );
  }

}