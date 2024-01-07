part of '../home_view.dart';

@immutable
final class _LikeAndOtherButtonsSection extends StatelessWidget {
  const _LikeAndOtherButtonsSection({
    this.liked = false,
    this.saved = false,
  });

  final bool liked;
  final bool saved;

  @override
  Widget build(BuildContext context) {
    final ValueNotifier<bool> isLiked = ValueNotifier<bool>(liked);
    final ValueNotifier<bool> isSaved = ValueNotifier<bool>(saved);
    return Padding(
      padding: context.screenPaddingRight * .25,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          AdvancedButtonWidget.icon(
            backgroundColor: Colors.transparent,
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
          SizedBox(
            height: context.lowValue * .25,
          ),
          AdvancedButtonWidget.icon(
            backgroundColor: Colors.transparent,
            bounceIt: true,
            icon: ValueListenableBuilder(
              valueListenable: isSaved,
              builder: (BuildContext context, bool isSavedValue, Widget? child) {
                return Icon(
                  isSavedValue ? CupertinoIcons.bookmark_fill : CupertinoIcons.bookmark,
                  size: 32,
                  color: Colors.white,
                );
              },
            ),
            onPressed: () async {
              await HapticFeedback.mediumImpact().then((value) {
                isSaved.value = !isSaved.value;
              });
            },
          ),
          SizedBox(
            height: context.lowValue * .25,
          ),
          AdvancedButtonWidget.icon(
            backgroundColor: Colors.transparent,
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
        ],
      ),
    );
  }
}
