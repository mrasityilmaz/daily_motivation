import 'package:flutter/material.dart';
import 'package:quotely/presentation/view_constants/gap_constants.dart';
import 'package:quotely/presentation/view_constants/padding_constants.dart';

part 'widgets/sheet_header.dart';
part 'widgets/title.dart';

@immutable
class InformationSheetTemplate extends StatelessWidget {
  const InformationSheetTemplate({
    required this.title,
    super.key,
    this.subtitle,
    this.useSafeArea = true,
    this.icon,
    this.headerPadding = const PaddingConstants.allLow(),
  });
  final bool useSafeArea;

  final EdgeInsetsGeometry headerPadding;

  final Icon? icon;

  final Text title;
  final Widget? subtitle;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      top: false,
      bottom: useSafeArea,
      child: _SheetBody(
        headerPadding: headerPadding,
        title: _Title(
          icon: icon,
          title: title,
        ),
        subtitle: subtitle,
      ),
    );
  }
}
