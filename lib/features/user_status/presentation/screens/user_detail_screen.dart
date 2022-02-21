import 'package:flutter/material.dart';
import 'package:wayve_test_app/core/enums/user_gender.dart';
import 'package:wayve_test_app/core/ui/styles/colors.dart';
import 'package:wayve_test_app/core/ui/styles/text_styles.dart';
import 'package:wayve_test_app/features/user_status/domain/entities/user_entity.dart';
import 'package:wayve_test_app/features/user_status/presentation/widgets/user_avatar_widget.dart';

class UserDetailScreen extends StatelessWidget {
  final UserEntity userEntity;
  const UserDetailScreen({Key? key, required this.userEntity}) : super(key: key);

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
          const SizedBox(height: 20),
          Center(
              child: UserAvatar(
                scale: 2,
                  id: userEntity.id!, name: userEntity.name!, gender: userEntity.gender!)
          ),
          const SizedBox(height: 20),
          Text(
            userEntity.name!,
            style: AppTextStyles.itemTitleTextStyle,
          ),
          Text(
            userEntity.email!,
            style: AppTextStyles.subTitleTextStyle,
          )
        ],
      ),
    );
  }
}
