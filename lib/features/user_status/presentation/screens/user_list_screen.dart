import 'package:flutter/material.dart';
import 'package:wayve_test_app/core/ui/base/base_view.dart';
import 'package:wayve_test_app/core/utils/loaders/shimmer_loader.dart';
import 'package:wayve_test_app/features/user_status/presentation/view_models/user_view_model.dart';
import 'package:wayve_test_app/features/user_status/presentation/widgets/user_item_group_widget.dart';
import 'package:wayve_test_app/core/utils/responsivity.dart';

class UserListScreen extends StatelessWidget {
  const UserListScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BaseView<UserViewModel>(
      model: UserViewModel(),
      onModelReady: (model) => model.init(),
      builder: (context, model, _) => Scaffold(
        body: Column(
          children: [
            model.isLoading
                ? Center(
                    child: SizedBox(
                      height: 1.0.ofHeight,
                      width: 1.0.ofWidth,
                      child: const ShimmerLoadingWidget(),
                    ),
                  )
                : Expanded(
                    child: SingleChildScrollView(
                      child: Column(
                        children: [
                          if (model.activeUserList.isNotEmpty)
                            UserItemGroup(userEntities: model.activeUserList),
                          if (model.inactiveUserList.isNotEmpty)
                            UserItemGroup(userEntities: model.inactiveUserList)
                        ],
                      ),
                    ),
                  ),
          ],
        ),
      ),
    );
  }
}
