import 'package:flutter/material.dart';
import 'package:wayve_test_app/core/ui/base/base_view.dart';
import 'package:wayve_test_app/features/user_status/presentation/view_models/user_view_model.dart';
import 'package:wayve_test_app/features/user_status/presentation/widgets/user_item_group_widget.dart';

class UserListScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BaseView<UserViewModel>(
      model: UserViewModel(),
      onModelReady: (model)=>model.init(),
      builder: (context, model, _) => Scaffold(
        body: SingleChildScrollView(
          child: Column(
            children: [
              UserItemGroup(userEntities: model.activeUserList),
              UserItemGroup(userEntities: model.inactiveUserList)
            ],
          ),
        ),
      ),
    );
  }

}