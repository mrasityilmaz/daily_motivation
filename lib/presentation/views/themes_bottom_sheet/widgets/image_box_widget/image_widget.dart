part of '../../themes_bottom_sheet.dart';

@immutable
final class _ImageWidget extends StatelessWidget {
  const _ImageWidget({required this.backgroundPath});

  final String backgroundPath;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) => Image.asset(
        backgroundPath,
        cacheWidth: constraints.biggest.width.toInt(),
        cacheHeight: constraints.biggest.height.toInt(),
        height: constraints.biggest.height,
        width: constraints.biggest.width,
        key: ValueKey(backgroundPath),
        fit: BoxFit.cover,
      ),
    );
  }
}
