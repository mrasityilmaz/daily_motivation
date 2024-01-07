part of '../home_view.dart';

@immutable
final class _BottomButtonsSection extends StatelessWidget {
  const _BottomButtonsSection();

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Padding(
          padding: context.paddingLow,
          child: Row(
            children: [
              AdvancedButtonWidget.iconText(
                backgroundColor: context.colors.onBackground.withOpacity(.1),
                onPressed: () async {
                  await AppDialogs.instance.showModalBottomSheetDialog<void>(
                    context,
                    backgroundColor: Colors.transparent,
                    constraints: BoxConstraints(maxHeight: context.mediaQuery.size.height * .9),
                    elevation: 0,
                    useRootNavigator: true,
                    isScrollControlled: true,

                    // shape: RoundedRectangleBorder(borderRadius: BorderRadius.vertical(top: context.radius16.resolve(TextDirection.ltr).topLeft)),
                    child: const CategoriesBottomSheet(),
                  );
                },
                text: 'General',
                icon: const Icon(
                  CupertinoIcons.square_grid_2x2,
                  color: Colors.white,
                  size: 32,
                ),
                textStyle: context.textTheme.bodyMedium?.copyWith(fontWeight: FontWeight.w600),
              ),
              const Spacer(),
              AdvancedButtonWidget.icon(
                backgroundColor: context.colors.onBackground.withOpacity(.1),
                onPressed: () {
                  locator<ThemeService>().toggleDarkLightTheme();
                },
                icon: Icon(
                  Platform.isAndroid ? Icons.format_paint_rounded : CupertinoIcons.paintbrush,
                  size: 32,
                ),
              ),
              SizedBox(
                width: context.lowValue,
              ),
              AdvancedButtonWidget.icon(
                backgroundColor: context.colors.onBackground.withOpacity(.1),
                onPressed: () {
                  locator<ThemeService>().toggleDarkLightTheme();
                },
                icon: Icon(
                  Platform.isAndroid ? Icons.settings : CupertinoIcons.settings,
                  size: 32,
                ),
              ),
            ],
          ),
        ),
        const _AdBanner(),
      ],
    );
  }
}

@immutable
final class _AdBanner extends StatelessWidget {
  const _AdBanner();

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.red,
      height: kBottomNavigationBarHeight,
    );
  }
}

@immutable
final class CategoriesBottomSheet extends StatelessWidget {
  const CategoriesBottomSheet({super.key});

  @override
  Widget build(BuildContext context) {
    return DraggableScrollableSheet(
      initialChildSize: 1,
      builder: (context, scrollController) => ClipRRect(
        borderRadius: const BorderRadius.vertical(top: Radius.circular(16)),
        child: Scaffold(
          backgroundColor: context.colors.surface,
          appBar: AppBar(
            backgroundColor: context.colors.surface,
            title: Text(
              'Categories',
              style: context.textTheme.titleMedium?.copyWith(fontWeight: FontWeight.bold),
            ),
            centerTitle: true,
            actions: [
              AdvancedButtonWidget.text(
                text: 'Kilitleri Kaldır',
                backgroundColor: Colors.transparent,
                onPressed: () {},
              ),
            ],
          ),
          body: CustomScrollView(
            controller: scrollController,
            slivers: [
              SliverToBoxAdapter(
                child: Padding(
                  padding: context.screenPadding + context.paddingNormalBottom,
                  child: AdvancedButtonWidget.text(
                    expand: true,
                    text: 'Create your own mix',
                    onPressed: () {},
                    textStyle: context.textTheme.bodyLarge?.copyWith(fontWeight: FontWeight.bold),
                  ),
                ),
              ),
              ...CategoryStaticService.categories.map((e) {
                return [
                  MultiSliverGridSection(
                    title: Container(
                      height: kToolbarHeight,
                      decoration: BoxDecoration(
                        color: context.appColors.secondBlackColor,
                      ),
                      padding: context.screenPaddingHorizontal,
                      child: Row(
                        children: [
                          Text(e.title, style: context.textTheme.bodyMedium?.copyWith(fontWeight: FontWeight.bold)),
                        ],
                      ),
                    ),
                    gridChildrenPadding: context.screenPaddingHorizontal * .5 + context.paddingMediumBottom + context.screenPaddingTop,
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      crossAxisSpacing: context.screenPaddingHorizontal.horizontal / 4,
                      mainAxisSpacing: context.screenPaddingHorizontal.horizontal / 4,
                      childAspectRatio: 2,
                    ),
                    items: e.subCategories.map((s) {
                      return Opacity(
                        opacity: s.isPremium ? .4 : 1,
                        child: AdvancedButtonWidget(
                          expand: true,
                          onPressed: s.isPremium ? null : () {},
                          bounceIt: true,
                          padding: EdgeInsets.zero,
                          child: Stack(
                            children: [
                              Positioned.fill(
                                child: Padding(
                                  padding: context.paddingLowRight * .5 + context.paddingLowBottom * .5,
                                  child: FractionallySizedBox(
                                    heightFactor: .7,
                                    alignment: Alignment.bottomRight,
                                    child: FittedBox(
                                      alignment: Alignment.bottomRight,
                                      fit: BoxFit.fitHeight,
                                      child: Image.asset(s.categoryImage),
                                    ),
                                  ),
                                ),
                              ),
                              Padding(
                                padding: context.paddingLow,
                                child: Align(
                                  alignment: Alignment.topLeft,
                                  child: Text(
                                    s.title,
                                    style: context.textTheme.bodyMedium?.copyWith(color: context.colors.onSurface, fontWeight: FontWeight.w600),
                                  ),
                                ),
                              ),
                              if (s.isPremium) ...[
                                Positioned.fill(
                                  child: FractionallySizedBox(
                                    heightFactor: .7,
                                    child: Padding(
                                      padding: context.paddingLow,
                                      child: FittedBox(
                                        fit: BoxFit.fitHeight,
                                        child: Icon(
                                          CupertinoIcons.lock_fill,
                                          size: 26,
                                          color: context.colors.onPrimary,
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ],
                          ),
                        ),
                      );
                    }).toList(),
                  ),
                ];
              }).expand((element) => element),
              SliverSafeArea(
                minimum: context.adaptiveScreenPaddingBottom + context.paddingMediumBottom,
                sliver: const SliverToBoxAdapter(
                  child: SizedBox(),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
