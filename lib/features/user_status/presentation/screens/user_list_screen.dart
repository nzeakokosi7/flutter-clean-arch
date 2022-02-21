import 'package:flutter/material.dart';
import 'package:wayve_test_app/core/ui/base/base_view.dart';
import 'package:wayve_test_app/core/ui/styles/colors.dart';
import 'package:wayve_test_app/core/ui/styles/text_styles.dart';
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
        appBar: AppBar(
          backgroundColor: AppColors.appWhite,
          elevation: 0.5,
          titleSpacing: 0,
          leadingWidth: 12,
          centerTitle: false,
          title: const Text(
            "User List",
            style: AppTextStyles.titleTextStyle,
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 12),
          child: SingleChildScrollView(
            child: Column(
              children: [
                model.isLoading
                    ? Center(
                        child: SizedBox(
                          height: 1.0.ofHeight,
                          width: 1.0.ofWidth,
                          child: const ShimmerLoadingWidget(),
                        ),
                      )
                    : Column(
                        children: [
                          if (model.activeUserList.isNotEmpty)
                            UserItemGroup(userEntities: model.activeUserList),
                          if (model.inactiveUserList.isNotEmpty)
                            UserItemGroup(userEntities: model.inactiveUserList)
                        ],
                      ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
