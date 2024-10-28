part of '../categories_view.dart';

@immutable
final class _BodyWidget extends StatelessWidget {
  const _BodyWidget();

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      clipBehavior: Clip.none,
      controller: ModalScrollController.of(context),
      slivers: [
        ...CategoryGroup.values.map(
          (e) => _CategoriesSection(
            categoryGroup: e,
          ),
        ),
        const SliverAdaptiveBottomSafeAreaWidget(),
      ],
    );
  }
}
