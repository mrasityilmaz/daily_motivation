part of '../../themes_bottom_sheet.dart';

@immutable
final class _LockIconWidget extends StatelessWidget {
  const _LockIconWidget();

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: const Alignment(0, .7),
      child: Container(
        width: kMinInteractiveDimension,
        height: kMinInteractiveDimension,
        decoration: BoxDecoration(
          color: context.colors.surface.withOpacity(.5),
          borderRadius: const RadiusConstants.allLow(),
        ),
        child: Icon(CupertinoIcons.lock_fill, color: context.colors.onSurface),
      ),
    );
  }
}
