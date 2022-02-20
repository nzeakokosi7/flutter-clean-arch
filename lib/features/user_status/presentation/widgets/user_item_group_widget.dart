import 'package:flutter/cupertino.dart';
import 'package:wayve_test_app/core/enums/user_status.dart';
import 'package:wayve_test_app/core/ui/styles/text_styles.dart';
import 'package:wayve_test_app/features/user_status/domain/entities/user_entity.dart';
import 'package:wayve_test_app/features/user_status/presentation/widgets/user_item_widget.dart';

class UserItemGroup extends StatelessWidget {
  final List<UserEntity> userEntity;
  const UserItemGroup({Key? key, required this.userEntity}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    String getTitle() {
      return userEntity[0].status == UserStatus.active ? "Active" : "Inactive";
    }
    return Column(
      children: [
        Text(
          getTitle(),
          style: AppTextStyles.itemTitleTextStyle,
        ),
        const SizedBox(height: 5),
        ...userEntity.map((item) => UserListItem(userEntity: item)).toList()
      ],
    );
  }
  
}