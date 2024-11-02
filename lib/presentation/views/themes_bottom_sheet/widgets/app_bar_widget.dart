part of '../themes_bottom_sheet.dart';

@immutable
final class _ThemesBottomSheetAppBar extends StatelessWidget implements PreferredSizeWidget {
  const _ThemesBottomSheetAppBar();

  @override
  SliverAppBar build(BuildContext context) {
    return SliverAppBar(
      title: Text(
        'Themes',
        style: context.textTheme.titleMedium?.copyWith(fontWeight: FontWeight.bold),
      ),
      centerTitle: true,
      primary: false,
      floating: true,
      actions: [
        CustomButton.text(
          text: 'Kilitleri Kaldır',
          textColor: context.colors.onSurface,
          onPressed: () {},
        ),
      ],
      forceElevated: true,
      bottom: PreferredSize(
        preferredSize: const Size.fromHeight(kTextTabBarHeight + SizeConstants.low),
        child: Padding(
          padding: const PaddingConstants.lowBottom(),
          child: TabBar(
            padding: const PaddingConstants.screenPaddingHorizontal(),
            controller: DefaultTabController.maybeOf(context),
            indicatorSize: TabBarIndicatorSize.tab,
            indicator: BoxDecoration(
              borderRadius: const RadiusConstants.allLow(),
              color: context.colors.primary,
            ),
            indicatorWeight: 0,
            labelColor: context.colors.onPrimary,
            unselectedLabelColor: context.colors.onSurface.withOpacity(.4),
            labelStyle: context.textTheme.bodyMedium?.copyWith(fontWeight: FontWeight.w600),
            onTap: (int index) {},
            dividerHeight: 0,
            isScrollable: true,
            tabs: const [
              Tab(text: 'Backgrounds'),
              Tab(text: 'Fonts'),
            ],
          ),
        ),
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
