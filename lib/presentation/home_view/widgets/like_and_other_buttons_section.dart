part of '../home_view.dart';

@immutable
final class _LikeAndOtherButtonsSection extends StatelessWidget {
  const _LikeAndOtherButtonsSection({
    this.liked = false,
  });

  final bool liked;

  @override
  Widget build(BuildContext context) {
    final ValueNotifier<bool> isLiked = ValueNotifier<bool>(liked);

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
              child: AdvancedButtonWidget.icon(
                backgroundColor: context.colors.scrim.withOpacity(.3),
                bounceIt: true,
                icon: ValueListenableBuilder(
                  valueListenable: isLiked,
                  builder: (BuildContext context, bool isLikedValue, Widget? child) {
                    return Icon(
                      isLikedValue ? CupertinoIcons.heart_fill : CupertinoIcons.heart,
                      size: 32,
                      color: isLikedValue ? Colors.red : Colors.white,
                    );
                  },
                ),
                onPressed: () async {
                  await HapticFeedback.mediumImpact().then((value) {
                    isLiked.value = !isLiked.value;
                  });
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
