import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:wayve_test_app/core/enums/user_status.dart';
import 'package:wayve_test_app/core/ui/styles/colors.dart';
import 'package:wayve_test_app/core/ui/styles/text_styles.dart';
import 'package:wayve_test_app/features/user_status/domain/entities/user_entity.dart';
import 'package:wayve_test_app/features/user_status/presentation/widgets/user_item_widget.dart';

class UserItemGroup extends StatelessWidget {
  final List<UserEntity> userEntities;

  const UserItemGroup({Key? key, required this.userEntities}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    String getTitle() {
      return userEntities[0].status == UserStatus.active ? "Active" : "Inactive";
    }
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(height: 15),
        Text(
          getTitle(),
          style: AppTextStyles.groupTitleTextStyle,
        ),
        const SizedBox(height: 10),
        Container(
          padding: const EdgeInsets.all(8),
          decoration:  const BoxDecoration(
            color: AppColors.itemBackground,
            borderRadius: BorderRadius.all(Radius.circular(10))
          ),
          child: Column(
            children: [
              ...userEntities.map((item) => UserListItem(userEntity: item)).toList()
            ],
          ),
        )
      ],
    );
  }
  
}