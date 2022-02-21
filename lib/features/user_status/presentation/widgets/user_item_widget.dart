import 'package:flutter/material.dart';
import 'package:wayve_test_app/core/ui/routing/app_routes.dart';
import 'package:wayve_test_app/core/ui/styles/colors.dart';
import 'package:wayve_test_app/core/ui/routing/app_router.dart';
import 'package:wayve_test_app/core/ui/styles/text_styles.dart';
import 'package:wayve_test_app/features/user_status/domain/entities/user_entity.dart';
import 'package:wayve_test_app/features/user_status/presentation/widgets/user_avatar_widget.dart';

class UserListItem extends StatelessWidget {
  final UserEntity userEntity;

  const UserListItem({Key? key, required this.userEntity}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: (){
        Navigator.push(context, AppRouter.generateRoute(RouteSettings(name: AppRoutes.userDetailScreen, arguments: userEntity)));
      },
      contentPadding: EdgeInsets.zero,
      dense: true,
      minVerticalPadding: 0,
      leading: UserAvatar(
        id: userEntity.id!,
        name: userEntity.name!,
        gender: userEntity.gender!,
      ),
      title: Text(
        userEntity.name!,
        style: AppTextStyles.itemTitleTextStyle,
      ),
      subtitle: Text(
        userEntity.email!,
        style: AppTextStyles.subTitleTextStyle,
      ),
    );
  }

}