import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';

abstract class VSelectorViewModelWidget<T extends ChangeNotifier, K> extends Widget {
  const VSelectorViewModelWidget({super.key});

  K selector(T viewModel);
  Widget? get staticChild => null;
  bool shouldRebuild(K v1, K v2) => v1 != v2;
  Widget build(BuildContext context, K value, T viewModel);

  @override
  // ignore: library_private_types_in_public_api
  _DataProviderElement<T, K> createElement() => _DataProviderElement<T, K>(this);
}

final class _DataProviderElement<T extends ChangeNotifier, K> extends ComponentElement {
  _DataProviderElement(VSelectorViewModelWidget<T, K> super.widget);

  @override
  VSelectorViewModelWidget<T, K> get widget => super.widget as VSelectorViewModelWidget<T, K>;

  @override
  Widget build() {
    return Selector<T, K>(
      key: widget.key,
      shouldRebuild: (K v1, K v2) {
        return widget.shouldRebuild(v1, v2);
      },
      selector: (BuildContext context, T viewModel) {
        return widget.selector(viewModel);
      },
      builder: (BuildContext _, K value, Widget? child) {
        return widget.build(this, value, Provider.of<T>(this, listen: false));
      },
      child: widget.staticChild,
    );
  }

  @override
  void update(VSelectorViewModelWidget<T, K> newWidget) {
    super.update(newWidget);
    assert(widget == newWidget);
    rebuild();
  }
}
