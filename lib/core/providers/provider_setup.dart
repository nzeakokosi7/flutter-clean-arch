import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';
import 'package:wayve_test_app/features/user_status/presentation/view_models/user_view_model.dart';

List<SingleChildWidget> providers = [
  ...independentServices,
];

List<SingleChildWidget> independentServices = [
  ChangeNotifierProvider.value(value: UserViewModel()),
];
