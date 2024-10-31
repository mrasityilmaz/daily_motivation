part of '../categories_view.dart';

@immutable
final class _SubCategoriesButton extends VSelectorViewModelWidget<CategoriesBottomSheetViewModel, bool> {
  const _SubCategoriesButton({
    required this.category,
  });

  final Categories category;

  @override
  Widget build(BuildContext context, bool isSelected, CategoriesBottomSheetViewModel viewModel) {
    return CustomButton.outlined(
      backgroundColor: isSelected ? context.colors.primary.withOpacity(.75) : context.colors.primary.withOpacity(.1),
      onPressed: isSelected
          ? null
          : () async => onChangeCategoryCallback(
                context,
                category: category,
                onChangeFunction: () async => viewModel.changeCategory(
                  context,
                  category: category,
                  locale: context.locale.languageCode,
                ),
              ),
      padding: EdgeInsets.zero,
      child: _CategoryButtonDesign(category: category, isSelected: isSelected),
    );
  }

  @override
  bool selector(CategoriesBottomSheetViewModel viewModel) {
    return viewModel.isCategorySelected(category);
  }

  Future<void> onChangeCategoryCallback(
    BuildContext context, {
    required Categories category,
    required Future<void> Function() onChangeFunction,
  }) async {
    try {
      late final Future<bool?> future = OverlayDialog().showProgressOverlay<bool>(
        context,
        asyncProcess: () async {
          await Future.delayed(const Duration(milliseconds: 400), () async {
            await onChangeFunction.call();
          });

          return true;
        },
      ).then((result) async {
        if (result == true) {
          await locator<AppRouter>().maybePop();
        }
        return true;
      });

      ///
      /// If the category is a premium
      ///
      if (category.isPremium) {
        await AppDialogs.instance.showDialog<void>(
          context,
          child: ShowOrPayDialogBody(
            icon: Icon(
              Platform.isAndroid ? Icons.grid_view_rounded : CupertinoIcons.square_grid_2x2,
              size: kMinInteractiveDimension * 1.2,
              color: context.colors.primary,
            ),
            firstButtonText: 'Premium Ol',
            firstButtonOnPressed: () async {
              await locator<AppRouter>().maybePop().whenComplete(() async {
                await future;
              });
            },
            title: 'Seçili Kategorinin Kilidini Aç',
          ),
        );
      }

      ///
      /// Other
      ///
      else {
        await future;
      }

      ///
      ///
      ///
    } catch (e, s) {
      await locator<AppRouter>().maybePop();
      OverlayDialog().closeOverlay();
      LoggerService.catchLog(e, s);
    }
  }
}

@immutable
final class _CategoryButtonDesign extends StatelessWidget {
  const _CategoryButtonDesign({
    required this.category,
    required this.isSelected,
  });

  final Categories category;
  final bool isSelected;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Positioned.fill(
          child: Padding(
            padding: const PaddingConstants.lowRight() * .5 + const PaddingConstants.lowBottom() * .5,
            child: FractionallySizedBox(
              heightFactor: .7,
              alignment: Alignment.bottomRight,
              child: FittedBox(
                alignment: Alignment.bottomRight,
                fit: BoxFit.fitHeight,
                child: Image.asset(
                  category.iconPath,
                ),
              ),
            ),
          ),
        ),
        Padding(
          padding: const PaddingConstants.allLow(),
          child: Align(
            alignment: Alignment.topLeft,
            child: Text(
              category.name,
              style: context.textTheme.bodyMedium?.copyWith(
                color: isSelected ? context.colors.onPrimary : context.colors.onSurface.withOpacity(.75),
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
        ),
        if (category.isPremium && !isSelected) ...[
          Align(
            alignment: Alignment.bottomLeft,
            child: FractionallySizedBox(
              alignment: Alignment.bottomLeft,
              heightFactor: .5,
              child: Padding(
                padding: const PaddingConstants.allLow(),
                child: FittedBox(
                  fit: BoxFit.fitHeight,
                  child: Icon(
                    CupertinoIcons.lock_fill,
                    size: 26,
                    color: context.colors.onSurface,
                  ),
                ),
              ),
            ),
          ),
        ],
        if (isSelected) ...[
          Align(
            alignment: Alignment.bottomLeft,
            child: FractionallySizedBox(
              alignment: Alignment.bottomLeft,
              heightFactor: .5,
              child: Padding(
                padding: const PaddingConstants.allLow(),
                child: FittedBox(
                  fit: BoxFit.fitHeight,
                  child: Icon(
                    CupertinoIcons.check_mark_circled,
                    size: 26,
                    color: context.colors.onPrimary,
                  ),
                ),
              ),
            ),
          ),
        ],
      ],
    );
  }
}
