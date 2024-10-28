part of '../sheet_template.dart';

@immutable
final class _Title extends StatelessWidget {
  const _Title({
    required this.title,
    this.icon,
  });
  final Icon? icon;
  final Text title;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      mainAxisSize: MainAxisSize.min,
      children: [
        if (icon != null) ...[
          icon!,
          const Gap.mediumHeight(),
        ],
        title,
        const Gap.highHeight(),
      ],
    );
  }
}
