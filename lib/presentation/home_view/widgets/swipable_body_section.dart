part of '../home_view.dart';

@immutable
final class _SwipableBodySection extends StatelessWidget {
  const _SwipableBodySection(this.list);
  final List<Map<String, dynamic>> list;

  @override
  Widget build(BuildContext context) {
    return PageView.builder(
      itemCount: list.length,
      scrollDirection: Axis.vertical,
      clipBehavior: Clip.none,
      physics: const ClampingScrollPhysics(),
      onPageChanged: (c) {},
      itemBuilder: (context, index) {
        return _QuoteTextSection(
          quote: list[index]['quote'].toString(),
          author: '- ${list[index]['author']}',
        );
      },
    );
  }
}
