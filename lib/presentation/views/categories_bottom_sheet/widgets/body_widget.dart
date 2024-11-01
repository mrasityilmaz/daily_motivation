part of '../categories_bottom_sheet.dart';

@immutable
final class _BodyWidget extends StatelessWidget {
  const _BodyWidget();

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      clipBehavior: Clip.none,
      controller: ModalScrollController.of(context),
      slivers: [
        const _CategoriesBottomSheetAppBar(),
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
