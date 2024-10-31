part of '../home_view.dart';

@immutable
final class _LikeAndOtherButtonsSection extends ViewModelWidget<HomeViewModel> {
  const _LikeAndOtherButtonsSection() : super(reactive: false);

  @override
  Widget build(BuildContext context, HomeViewModel viewModel) {
    return Padding(
      padding: const PaddingConstants.lowRight(),
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
                  return CustomButton(
                    backgroundColor: context.colors.scrim.withOpacity(.3),
                    child: Icon(
                      isLikedValue ? CupertinoIcons.heart_fill : CupertinoIcons.heart,
                      size: 32,
                      color: isLikedValue ? Colors.red : Colors.white,
                    ),
                    onPressed: () async => viewModel.toggleLike(),
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
              child: CustomButton(
                backgroundColor: context.colors.scrim.withOpacity(.3),
                child: const Icon(
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
