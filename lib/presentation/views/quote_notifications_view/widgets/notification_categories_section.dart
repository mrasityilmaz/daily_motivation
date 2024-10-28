part of '../quote_notification_view.dart';

@immutable
final class _NotificationcategoriesSection extends ViewModelWidget<QuoteNotificationViewModel> {
  const _NotificationcategoriesSection();

  @override
  Widget build(BuildContext context, QuoteNotificationViewModel viewModel) {
    return Column(
      children: [
        Padding(
          padding: const PaddingConstants.screenPaddingHorizontal(),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Notification Categories',
                style: context.textTheme.bodyLarge
                    ?.copyWith(fontWeight: FontWeight.bold, color: context.colors.onSurface.withOpacity(.75)),
              ),
              Row(
                children: [
                  Icon(
                    Icons.info_outlined,
                    color: context.colors.onSurface.withOpacity(.4),
                    size: 16,
                  ),
                  const SizedBox(width: 4),
                  AutoSizeText(
                    'Maximum 3 categories can be selected',
                    maxLines: 2,
                    style: context.textTheme.bodySmall
                        ?.copyWith(color: context.colors.onSurface.withOpacity(.4), fontStyle: FontStyle.italic),
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
                  padding: const PaddingConstants.screenPaddingHorizontal(),
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 4,
                    mainAxisExtent: ((context.width - const PaddingConstants.screenPaddingHorizontal().horizontal) -
                            (context.lowValue)) /
                        3,
                    mainAxisSpacing: context.lowValue * .5,
                    crossAxisSpacing: context.lowValue * .5,
                  ),
                  itemBuilder: (context, index) {
                    final Categories category = Categories.values.freeCategories[index];
                    final bool isSelected = viewModel.isCategorySelected(category);
                    return CustomButton.outlined(
                      backgroundColor: context.colors.primary.withOpacity(isSelected ? 1 : .2),
                      onPressed: () => viewModel.addOrRemoveCategory(category: category),
                      padding: const PaddingConstants.lowHorizontal() + const PaddingConstants.lowVertical() * .5,
                      child: LayoutBuilder(
                        builder: (BuildContext context, BoxConstraints constraints) {
                          return Row(
                            children: [
                              Expanded(
                                child: AutoSizeText(
                                  category.name,
                                  style: context.textTheme.titleSmall?.copyWith(
                                    color:
                                        isSelected ? context.colors.surface : context.colors.onSurface.withOpacity(.6),
                                    fontWeight: FontWeight.bold,
                                  ),
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
