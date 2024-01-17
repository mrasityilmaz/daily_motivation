part of '../home_view.dart';

@immutable
final class _LikeAndOtherButtonsSection extends ViewModelWidget<HomeViewModel> {
  const _LikeAndOtherButtonsSection();

  @override
  Widget build(BuildContext context, HomeViewModel viewModel) {
    return Padding(
      padding: context.paddingLowRight,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          ClipRRect(
            borderRadius: context.radius12,
            child: BackdropFilter(
              filter: ImageFilter.blur(sigmaX: 3.5, sigmaY: 3.5),
              child: ValueListenableBuilder(
                valueListenable: viewModel.currentQuoteIsLiked,
                builder: (BuildContext context, bool isLikedValue, Widget? child) {
                  return AdvancedButtonWidget.icon(
                    backgroundColor: context.colors.scrim.withOpacity(.3),
                    bounceIt: true,
                    icon: Icon(
                      isLikedValue ? CupertinoIcons.heart_fill : CupertinoIcons.heart,
                      size: 32,
                      color: isLikedValue ? Colors.red : Colors.white,
                    ),
                    onPressed: () async {
                      await HapticFeedback.mediumImpact().then((value) async {
                        if (isLikedValue) {
                          await HiveService.instance.unLikeQuote(viewModel.currentQuote.id);
                          viewModel.currentQuoteIsLiked.value = false;
                        } else {
                          await HiveService.instance.likeQuote(viewModel.currentQuote.toHiveModel);
                          viewModel.currentQuoteIsLiked.value = true;
                        }
                      });
                    },
                  );
                },
              ),
            ),
          ),
          SizedBox(
            height: context.lowValue,
          ),
          ClipRRect(
            borderRadius: context.radius12,
            child: BackdropFilter(
              filter: ImageFilter.blur(sigmaX: 3.5, sigmaY: 3.5),
              child: AdvancedButtonWidget.icon(
                backgroundColor: context.colors.scrim.withOpacity(.3),
                bounceIt: true,
                icon: const Icon(
                  CupertinoIcons.share,
                  size: 32,
                  color: Colors.white,
                ),
                onPressed: () async {
                  await HapticFeedback.mediumImpact();
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
