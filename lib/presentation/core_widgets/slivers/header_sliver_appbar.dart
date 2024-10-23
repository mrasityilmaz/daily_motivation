import 'package:flutter/material.dart';
import 'package:quotely/core/extensions/context_extension.dart';
import 'package:quotely/presentation/view_constants/padding_constants.dart';

@immutable
final class HeaderSliverAppBarWidget extends StatelessWidget {
  const HeaderSliverAppBarWidget({
    required this.innerBoxIsScrolled,
    required this.collapsedTitle,
    required this.expandedTitle,
    required this.expandedSubtitle,
    required this.canPop,
    super.key,
    this.primary = true,
  });
  final bool innerBoxIsScrolled;
  final String collapsedTitle;
  final String expandedTitle;
  final String expandedSubtitle;
  final bool canPop;
  final bool primary;

  @override
  Widget build(BuildContext context) {
    return SliverOverlapAbsorber(
      handle: NestedScrollView.sliverOverlapAbsorberHandleFor(context),
      sliver: SliverLayoutBuilder(
        builder: (context, cts) {
          final double collapsedVisibility =
              (((MediaQuery.sizeOf(context).height * .25) - kToolbarHeight) - cts.cacheOrigin.abs()) <= 100
                  ? 1 - ((((MediaQuery.sizeOf(context).height * .25) - kToolbarHeight) - cts.cacheOrigin.abs()) / 100)
                  : 0;

          return SliverAppBar(
            primary: primary,
            expandedHeight: MediaQuery.sizeOf(context).height * .24,
            collapsedHeight: kToolbarHeight,
            automaticallyImplyLeading: canPop,
            leading: canPop
                ? BackButton(
                    color: collapsedVisibility != 0 ? context.colors.onSurface : context.colors.onPrimary,
                  )
                : null,
            title: AnimatedOpacity(
              duration: const Duration(milliseconds: 250),
              opacity: collapsedVisibility,
              child: Text(
                collapsedTitle,
                style: context.textTheme.bodyLarge?.copyWith(fontWeight: FontWeight.bold),
              ),
            ),
            forceElevated: innerBoxIsScrolled,
            pinned: true,
            flexibleSpace: AnimatedSize(
              duration: const Duration(milliseconds: 250),
              curve: Curves.easeInOut,
              child: FlexibleSpaceBar(
                centerTitle: false,
                title: LayoutBuilder(
                  builder: (BuildContext context, BoxConstraints constraints) {
                    return Visibility(
                      visible: !(constraints.maxHeight <=
                          kToolbarHeight + MediaQuery.viewPaddingOf(context).top + (kToolbarHeight * .5)),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            expandedTitle,
                            style: context.textTheme.titleMedium?.copyWith(
                              fontWeight: FontWeight.bold,
                              color: context.colors.onPrimary,
                              height: 1.1,
                            ),
                          ),
                          const SizedBox(height: 4),
                          Text(
                            expandedSubtitle,
                            style:
                                context.textTheme.labelSmall?.copyWith(color: context.colors.onPrimary.withOpacity(.8)),
                            maxLines: 2,
                          ),
                        ],
                      ),
                    );
                  },
                ),
                titlePadding: const PaddingConstants.normalLeft() + const PaddingConstants.normalBottom() * 1.2,
                background: const _HeaderBackgroundWidget(),
              ),
            ),
          );
        },
      ),
    );
  }
}

@immutable
final class _HeaderBackgroundWidget extends StatelessWidget {
  const _HeaderBackgroundWidget();

  @override
  Widget build(BuildContext context) {
    return UnconstrainedBox(
      constrainedAxis: Axis.vertical,
      clipBehavior: Clip.antiAlias,
      child: Container(
        width: MediaQuery.sizeOf(context).width,
        decoration: BoxDecoration(
          color: context.signViewTheme.thirdPrimary,
        ),
        child: Stack(
          clipBehavior: Clip.none,
          children: [
            Positioned.fromRect(
              rect: Rect.fromCenter(
                center: Offset.zero,
                width: MediaQuery.sizeOf(context).width * 1.8,
                height: MediaQuery.sizeOf(context).width * 1.8,
              ),
              child: CircleAvatar(
                radius: MediaQuery.sizeOf(context).width,
                backgroundColor: context.signViewTheme.secondPrimary,
              ),
            ),
            Positioned.fromRect(
              rect: Rect.fromCenter(
                center: Offset.zero,
                width: MediaQuery.sizeOf(context).width * 1.3,
                height: MediaQuery.sizeOf(context).width * 1.3,
              ),
              child: CircleAvatar(
                radius: MediaQuery.sizeOf(context).width,
                backgroundColor: context.signViewTheme.firstPrimary,
              ),
            ),
            Center(
              child: ShaderMask(
                shaderCallback: (bounds) {
                  return LinearGradient(
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                    colors: [
                      context.signViewTheme.thirdPrimary.withOpacity(.5),
                      context.signViewTheme.secondPrimary.withOpacity(.6),
                      context.signViewTheme.firstPrimary.withOpacity(.7),
                    ],
                    stops: const [.15, .55, .8],
                  ).createShader(bounds);
                },
                child: Text(
                  'Quotely App',
                  style: context.textTheme.headlineSmall?.copyWith(color: Colors.white, fontWeight: FontWeight.bold),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
