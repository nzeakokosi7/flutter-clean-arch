import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';
import 'package:wayve_test_app/core/ui/navigation/navigation.dart';

import '../../../di.dart';

class BaseView<T extends ChangeNotifier> extends StatefulWidget {
  final Widget Function(BuildContext context, T model, Widget? child) builder;
  final T model;
  final Widget? child;
  final Function(T)? onModelReady;
  final Function(T)? onDispose;
  final bool closeKeyboardOnTap;

  const BaseView({
    Key? key,
    required this.builder,
    required this.model,
    this.child,
    this.onModelReady,
    this.onDispose,
    this.closeKeyboardOnTap = true,
  }) : super(key: key);
  @override
  _BaseViewState<T> createState() => _BaseViewState<T>();
}

class _BaseViewState<T extends ChangeNotifier> extends State<BaseView<T>> {
  final navigationService = locator<NavigationService>();
  late T model;

  @override
  void initState() {
    super.initState();
    model = widget.model;

    if (widget.onModelReady != null) {
      widget.onModelReady!(model);
    }
  }

  @override
  void dispose() {
    model = widget.model;

    if (widget.onDispose != null) {
      widget.onDispose!(model);
    }

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<T>.value(
      value: model,
      child: Consumer<T>(
        builder: widget.builder,
        child: GestureDetector(
          onTap: () {
            FocusManager.instance.primaryFocus?.unfocus();
          },
          child: widget.child,
        ),
      ),
    );
  }
}