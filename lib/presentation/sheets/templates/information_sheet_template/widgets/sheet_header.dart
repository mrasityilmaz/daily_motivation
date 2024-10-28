part of '../sheet_template.dart';

@immutable
final class _SheetBody extends StatelessWidget {
  const _SheetBody({
    required this.title,
    this.subtitle,
    this.headerPadding = const PaddingConstants.allLow(),
  });
  final Widget title;
  final Widget? subtitle;
  final EdgeInsetsGeometry headerPadding;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: headerPadding,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              title,
            ],
          ),
          if (subtitle != null) ...[
            subtitle!,
          ],
        ],
      ),
    );
  }
}
