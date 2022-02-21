import 'package:flutter/material.dart';
import 'package:wayve_test_app/core/enums/user_gender.dart';
import 'package:wayve_test_app/core/ui/styles/colors.dart';
import 'package:wayve_test_app/core/ui/styles/text_styles.dart';
import 'package:wayve_test_app/features/user_status/presentation/widgets/user_avatar_widget.dart';

class UserDetailScreen extends StatelessWidget {
  const UserDetailScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () => Navigator.of(context).pop(),
          icon: const Icon(Icons.arrow_back, color: AppColors.appBlack),
        ),
        backgroundColor: AppColors.appWhite,
        elevation: 0.5,
        titleSpacing: 0,
        centerTitle: false,
        title: const Text(
          "User List",
          style: AppTextStyles.titleTextStyle,
        ),
      ),
      body: Column(
        children: [
          SizedBox(height: 20),
          Center(
              child: UserAvatar(
                scale: 2,
                  id: 1444, name: "Nzeako Kosi", gender: UserGender.male)
          ),
          SizedBox(height: 20),
          Text(
            "Nzeako Kosi",
            style: AppTextStyles.itemTitleTextStyle,
          ),
          Text(
            "Kosi@mmm.cppm",
            style: AppTextStyles.subTitleTextStyle,
          )
        ],
      ),
    );
  }
}
