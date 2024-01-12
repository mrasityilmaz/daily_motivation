import 'package:daily_motivation/core/constants/category_group_enum.dart';
import 'package:daily_motivation/core/extensions/context_extension.dart';
import 'package:daily_motivation/presentation/core_widgets/advanced_button/advanced_button_widget.dart';
import 'package:daily_motivation/presentation/core_widgets/slivers/mutli_sliver_grid.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

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
              ...CategoryGroup.values.map((e) {
                return MultiSliverGridSection(
                  title: Container(
                    height: kToolbarHeight,
                    decoration: BoxDecoration(
                      color: context.appColors.secondBlackColor,
                    ),
                    padding: context.screenPaddingHorizontal,
                    child: Row(
                      children: [
                        Text(e.name, style: context.textTheme.bodyMedium?.copyWith(fontWeight: FontWeight.bold)),
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
                                    child: Image.asset(s.iconPath),
                                  ),
                                ),
                              ),
                            ),
                            Padding(
                              padding: context.paddingLow,
                              child: Align(
                                alignment: Alignment.topLeft,
                                child: Text(
                                  s.name,
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
                );
              }),
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
