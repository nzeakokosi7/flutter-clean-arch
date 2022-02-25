import 'package:flutter/material.dart';
import 'package:wayve_test_app/core/ui/base/base_view.dart';
import 'package:wayve_test_app/core/ui/styles/colors.dart';
import 'package:wayve_test_app/core/ui/styles/text_styles.dart';
import 'package:wayve_test_app/core/utils/loaders/shimmer_loader.dart';
import 'package:wayve_test_app/features/user_status/presentation/view_models/user_view_model.dart';
import 'package:wayve_test_app/features/user_status/presentation/widgets/network_error_screen.dart';
import 'package:wayve_test_app/features/user_status/presentation/widgets/user_item_group_widget.dart';
import 'package:wayve_test_app/core/utils/extensions.dart';

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
          titleSpacing: 12,
          centerTitle: false,
          title: const Text(
            "User List",
            style: AppTextStyles.titleTextStyle,
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12),
          child: SingleChildScrollView(
            controller: model.scrollController,
            child: Column(
              children: [
                if (!model.isNetworkAvailable)
                  NetworkErrorScreen(refreshAction: ()=>{})
                else
                  Column(
                    children: [
                      model.isLoading
                          ? Center(
                              child: SizedBox(
                                height: context.ofHeight(1.0),
                                width: context.ofWidth(1.0),
                                child: const ShimmerLoadingWidget(),
                              ),
                            )
                          : Column(
                              children: [
                                for (int k in model.userActivityPageMap.keys)
                                  UserItemGroup(
                                      userEntities:
                                          model.userActivityPageMap[k]!)
                              ],
                            ),
                      if (model.isFetchingNextPage)
                        Center(
                          child: Container(
                              height: 30,
                              width: 30,
                              margin:
                                  const EdgeInsets.only(bottom: 100, top: 20),
                              child: const CircularProgressIndicator(
                                  color: AppColors.appGrey)),
                        )
                    ],
                  )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
