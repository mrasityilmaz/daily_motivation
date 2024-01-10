part of '../home_view.dart';

@immutable
final class _MainBodyWidget extends StatefulWidget {
  const _MainBodyWidget();

  @override
  State<_MainBodyWidget> createState() => _MainBodyWidgetState();
}

class _MainBodyWidgetState extends State<_MainBodyWidget> {
  Future<String> get _localPath async {
    final directory = await getApplicationDocumentsDirectory();
    return directory.path;
  }

  Future<File> get _localFile async {
    final path = await _localPath;
    return File('$path/tsttr.json');
  }

  Future<void> _writeJson() async {
    final Stopwatch stopwatch = Stopwatch()..start();
    final mapData = await readFile();
    final file = await _localFile;

    await file.writeAsString(mapData).then((value) {
      stopwatch.stop();
      print('Time elapsed: ${stopwatch.elapsed}');
    });
  }

  Future<String> readFile() async {
    final quotesString = await rootBundle.loadString('assets/quotes/tr/all_quotes_tr.json');

    final quotes = json.decode(quotesString);

    final String categorssss = (quotes as Map<String, dynamic>).entries.map((e) => e.key).toList().toString();

    // final List<({String categoryName, List<Map<String, dynamic>> quotes})> quotesList = List<({String categoryName, List<Map<String, dynamic>> quotes})>.empty(growable: true);

    // final categoriesList = quotes.map((e) => e['category'] as String).toSet().toList();

    // for (final category in categoriesList) {
    //   final quotesForCategory = quotes.where((e) => e['category'] == category).toList();
    //   quotesList.add((categoryName: category, quotes: quotesForCategory.map((e) => e as Map<String, dynamic>).toList()));
    // }

    // final Map<String, dynamic> lastMap = {};

    // quotesList.map((e) => {e.categoryName.toLowerCase().trim(): e.quotes}).toList().forEach(lastMap.addAll);

    // return json.encode(lastMap);
    return '';
  }

  @override
  void initState() {
    _writeJson();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        image: DecorationImage(
          image: CachedNetworkImageProvider(
            'https://images.unsplash.com/photo-1693306240102-2f718b282e1c?w=900&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxjb2xsZWN0aW9uLXBhZ2V8N3wzNTc1MjUzfHxlbnwwfHx8fHw%3D',
          ),
          fit: BoxFit.cover,
        ),
      ),
      child: SafeArea(
        minimum: context.adaptiveScreenPaddingBottom + EdgeInsets.only(top: context.adaptiveScreenPaddingBottom.bottom),
        child: Column(
          children: [
            const _TopSection(),
            const Expanded(
              child: Stack(
                children: [
                  Positioned.fill(
                    child: _SwipableBodySection(),
                  ),
                  Positioned.fill(
                    child: _LikeAndOtherButtonsSection(),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: context.screenPadding.bottom * 1.5,
            ),
          ],
        ),
      ),
    );
  }
}
