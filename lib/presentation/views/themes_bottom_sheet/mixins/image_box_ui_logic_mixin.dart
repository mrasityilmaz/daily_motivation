part of '../themes_bottom_sheet.dart';

mixin _ImageBoxUILogicMixin on Object {
  @mustBeOverridden
  Future<void> onChooseThemeCallback(
    BuildContext context, {
    required bool isLocked,
    required Future<void> Function() onChanged,
  });
}
