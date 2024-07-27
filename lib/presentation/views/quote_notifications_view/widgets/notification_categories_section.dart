part of '../quote_notification_view.dart';

@immutable
final class _NotificationcategoriesSection extends ViewModelWidget<_QuoteNotificationViewModel> {
  const _NotificationcategoriesSection();

  @override
  Widget build(BuildContext context, _QuoteNotificationViewModel viewModel) {
    return Column(
      children: [
        Padding(
          padding: context.screenPaddingHorizontal,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Notification Categories',
                style: context.textTheme.bodyLarge?.copyWith(fontWeight: FontWeight.bold, color: context.colors.onBackground.withOpacity(.75)),
              ),
              Row(
                children: [
                  Icon(
                    Icons.info_outlined,
                    color: context.colors.onBackground.withOpacity(.4),
                    size: 16,
                  ),
                  const SizedBox(width: 4),
                  AutoSizeText(
                    'Maximum 3 categories can be selected',
                    maxLines: 2,
                    style: context.textTheme.bodySmall?.copyWith(color: context.colors.onBackground.withOpacity(.4), fontStyle: FontStyle.italic),
                  ),
                ],
              ),
              SizedBox(
                height: context.lowValue,
              ),
            ],
          ),
        ),
        SizedBox(
          height: kMinInteractiveDimension * 5,
          child: Row(
            children: [
              Expanded(
                child: GridView.builder(
                  shrinkWrap: true,
                  scrollDirection: Axis.horizontal,
                  padding: context.screenPaddingHorizontal,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 4,
                    mainAxisExtent: ((context.width - context.screenPaddingHorizontal.horizontal) - (context.lowValue)) / 3,
                    mainAxisSpacing: context.lowValue * .5,
                    crossAxisSpacing: context.lowValue * .5,
                  ),
                  itemBuilder: (context, index) {
                    final Categories category = Categories.values.freeCategories[index];
                    final bool isSelected = viewModel.isCategorySelected(category);
                    return AdvancedButtonWidget(
                      backgroundColor: context.colors.primary.withOpacity(isSelected ? 1 : .2),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                        side: BorderSide(
                          color: context.colors.primary.withOpacity(.3),
                        ),
                      ),
                      onPressed: () => viewModel.addOrRemoveCategory(category: category),
                      padding: context.paddingLowHorizontal + context.paddingLowVertical * .5,
                      child: LayoutBuilder(
                        builder: (BuildContext context, BoxConstraints constraints) {
                          return Row(
                            children: [
                              Expanded(
                                child: AutoSizeText(
                                  category.name,
                                  style:
                                      context.textTheme.titleSmall?.copyWith(color: isSelected ? context.colors.background : context.colors.onBackground.withOpacity(.6), fontWeight: FontWeight.bold),
                                  maxLines: 1,
                                  maxFontSize: context.textTheme.titleSmall!.fontSize!,
                                  minFontSize: context.textTheme.labelSmall!.fontSize!,
                                ),
                              ),
                              SizedBox(
                                width: context.lowValue,
                              ),
                              Image.asset(
                                category.iconPath,
                                width: constraints.maxHeight * .6,
                                height: constraints.maxHeight * .6,
                              ),
                            ],
                          );
                        },
                      ),
                    );
                  },
                  itemCount: Categories.values.freeCategories.length,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
