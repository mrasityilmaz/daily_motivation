import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:sliver_tools/sliver_tools.dart';

@immutable
final class MultiSliverGridSection extends MultiSliver {
  MultiSliverGridSection({
    required Widget title,
    required List<Widget> items,
    required SliverGridDelegate gridDelegate,
    EdgeInsetsGeometry gridChildrenPadding = EdgeInsets.zero,
    super.key,
  }) : super(
          pushPinnedChildren: true,
          children: [
            SliverPinnedHeader(
              child: title,
            ),
            SliverPadding(
              padding: gridChildrenPadding,
              sliver: SliverGrid.builder(
                gridDelegate: gridDelegate,
                itemCount: items.length,
                itemBuilder: (context, index) {
                  return items[index];
                },
              ),
            ),
          ],
        );
}
