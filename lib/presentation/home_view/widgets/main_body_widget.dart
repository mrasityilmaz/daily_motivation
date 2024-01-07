part of '../home_view.dart';

@immutable
final class _MainBodyWidget extends StatelessWidget {
  const _MainBodyWidget();

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        image: DecorationImage(
          image: CachedNetworkImageProvider(
            'https://images.unsplash.com/photo-1693306240102-2f718b282e1c?w=900&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxjb2xsZWN0aW9uLXBhZ2V8N3wzNTc1MjUzfHxlbnwwfHx8fHw%3D',
          ),
          fit: BoxFit.cover,
        ),
      ),
      child: SafeArea(
        minimum: context.adaptiveScreenPaddingBottom + EdgeInsets.only(top: context.adaptiveScreenPaddingBottom.bottom),
        child: Column(
          children: [
            const _TopSection(),
            const Expanded(
              child: Stack(
                children: [
                  Positioned.fill(
                    child: _SwipableBodySection(),
                  ),
                  Positioned.fill(
                    child: _LikeAndOtherButtonsSection(),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: context.screenPadding.bottom * 1.5,
            ),
          ],
        ),
      ),
    );
  }
}
