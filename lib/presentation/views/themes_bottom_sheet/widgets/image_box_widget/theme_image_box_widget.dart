part of '../../themes_bottom_sheet.dart';

@immutable
final class _ImageBoxWidget extends ViewModelWidget<ThemesBottomSheetViewModel> {
  const _ImageBoxWidget({
    required this.backgroundPath,
    required this.isPremium,
  }) : super(reactive: false);

  final String backgroundPath;
  final bool isPremium;

  @override
  Widget build(BuildContext context, ThemesBottomSheetViewModel viewModel) {
    // Border radius of the image box
    const BorderRadius borderRadius = RadiusConstants.allNormal();

    return InkWell(
      borderRadius: borderRadius,
      onTap: () async => onSelectedBackground(
        context,
        callback: viewModel.updateThemeConfiguration,
        isPremium: isPremium,
      ),
      child: Ink(
        padding: EdgeInsets.zero,
        decoration: ShapeDecoration(
          shape: RoundedRectangleBorder(
            // Add 1 to the radius to prevent the little fix on the border bc of the border width
            borderRadius: borderRadius.add(const RadiusConstants.all(Radius.circular(1))),
            side: BorderSide(
              color: context.colors.onSurface.withOpacity(.1),
            ),
          ),
        ),
        child: ClipRRect(
          borderRadius: borderRadius,
          child: Stack(
            clipBehavior: Clip.none,
            children: [
              // Background image
              _ImageWidget(
                backgroundPath: backgroundPath,
              ),

              // Abcd text widget
              _AbcdTextWidget(
                isPremium: isPremium,
                currentThemeConfiguration: currentThemeConfiguration,
              ),

              // Lock icon
              if (isPremium) ...[
                const _LockIconWidget(),
              ],
            ],
          ),
        ),
      ),
    );
  }

  /// Current theme configuration depending on the selected background
  ThemeConfigurationModel get currentThemeConfiguration => ThemeConfigurationModel(
        backgroundPath: backgroundPath,
        fontName: DefaultFontsEnum.cormorant.fontFamily,
        maxFontSize: DefaultFontsEnum.cormorant.maxFontSize,
        minFontSize: DefaultFontsEnum.cormorant.minFontSize,
        textColor: Colors.white,
      );

  /// This function will run the callback with an overlay.
  Future<void> onSelectedBackground(
    BuildContext context, {
    required AsyncValueSetter<ThemeConfigurationModel> callback,
    required bool isPremium,
  }) async {
    try {
      late final actualJob = _overlayedCallback(
        context,
        callback: callback,
      );

      // If the theme is not premium, just call the actual job
      if (!isPremium) {
        await actualJob.call();
        return;
      } else {
        // If the theme is premium, show a dialog to user to watch an ad or buy premium
        // Then user will decide to watch an ad or buy premium, if not, the actual job will not run
        await DialogHelper.showWatchAdOrBuyPremiumDialog(
          context,
          params: (
            icon: Platform.isAndroid ? Icons.format_paint_rounded : CupertinoIcons.paintbrush,
            title: null, // Default: LocaleKeys.watch_ad_to_unlock.tr(),
            watchAdPressed: actualJob,
            watchAdText: null, // Default: LocaleKeys.watch_ad.tr(),
          ),
        );
      }
    } catch (e, s) {
      LoggerService.catchLog(e, s);
    }
  }

  /// This is actual function that will change the theme configuration.
  /// It will show an overlay dialog while changing the theme.
  /// If the theme is premium, it will wait for 500ms, otherwise 300ms
  /// Because the premium themes have a dialog before the theme change
  AsyncCallback _overlayedCallback(
    BuildContext context, {
    required AsyncValueSetter<ThemeConfigurationModel> callback,
  }) {
    try {
      return () async {
        return OverlayDialog().showProgressOverlay<bool>(
          context,
          asyncProcess: () async {
            // Wait for the animation for a better user experience
            // If the theme is premium, wait for 500ms, otherwise 300ms
            // Because the premium themes have a dialog before the theme change
            await Future.delayed(Duration(milliseconds: isPremium ? 500 : 300), () async {
              await callback.call(currentThemeConfiguration);
            });

            return true;
          },
        ).then((e) async {
          if (e == true) {
            // Close the current sheet
            await locator<AppRouter>().maybePop();
          }
        });
      };
    } catch (e) {
      rethrow;
    }
  }
}
