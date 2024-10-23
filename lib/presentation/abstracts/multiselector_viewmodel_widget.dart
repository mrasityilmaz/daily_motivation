// ignore_for_file: library_private_types_in_public_api, depend_on_referenced_packages

import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';

// Tuple class to hold two values
@immutable
@protected
final class Tuple<T1, T2> {
  const Tuple(this.selector1, this.selector2);
  final T1 selector1;
  final T2 selector2;

  @override
  bool operator ==(Object other) => identical(this, other) || other is Tuple && runtimeType == other.runtimeType && selector1 == other.selector1 && selector2 == other.selector2;

  @override
  int get hashCode => selector1.hashCode ^ selector2.hashCode;
}

abstract class MultiSelectorViewModelWidget<T extends ChangeNotifier, K1, K2> extends Widget {
  const MultiSelectorViewModelWidget({super.key});

  Tuple<K1, K2> selector(T viewModel);

  Widget? get staticChild => null;
  bool shouldRebuild(Tuple<K1, K2> v1, Tuple<K1, K2> v2) => v1 != v2;
  Widget build(BuildContext context, Tuple<K1, K2> value);

  @override
  _DataProviderElement<T, K1, K2> createElement() => _DataProviderElement<T, K1, K2>(this);
}

class _DataProviderElement<T extends ChangeNotifier, K1, K2> extends ComponentElement {
  _DataProviderElement(MultiSelectorViewModelWidget<T, K1, K2> super.widget);

  @override
  MultiSelectorViewModelWidget<T, K1, K2> get widget => super.widget as MultiSelectorViewModelWidget<T, K1, K2>;

  @override
  Widget build() {
    return Selector<T, Tuple<K1, K2>>(
      key: widget.key,
      shouldRebuild: widget.shouldRebuild,
      selector: (BuildContext context, T viewModel) => widget.selector(viewModel),
      builder: (BuildContext _, Tuple<K1, K2> value, Widget? child) => widget.build(this, value),
      child: widget.staticChild,
    );
  }

  @override
  void update(MultiSelectorViewModelWidget<T, K1, K2> newWidget) {
    super.update(newWidget);
    if (!(widget == newWidget)) {
      rebuild();
    }
  }
}
