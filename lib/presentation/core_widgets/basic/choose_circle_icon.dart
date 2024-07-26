import 'package:flutter/material.dart';
import 'package:quotely/core/extensions/context_extension.dart';

@immutable
final class ChooseCircleIcon extends StatelessWidget {
  const ChooseCircleIcon({required this.isSelected, super.key});
  final bool isSelected;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 16,
      height: 16,
      decoration: BoxDecoration(
        color: context.colors.surface,
        shape: BoxShape.circle,
        border: Border.all(
          color: isSelected ? context.colors.primary : context.colors.primary.withOpacity(.5),
          width: 2,
        ),
      ),
      child: Container(
        margin: const EdgeInsets.all(2),
        decoration: BoxDecoration(
          color: isSelected ? context.colors.primary : context.colors.surface,
          shape: BoxShape.circle,
        ),
      ),
    );
  }
}
