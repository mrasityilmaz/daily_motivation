part of 'favorites_view.dart';

final class _FavoritesViewModel extends BaseViewModel {
  final HiveService _hiveService = HiveService.instance;

  List<QuoteHiveModel> get likedQuoteList => _hiveService.likedQuoteList..sort((a, b) => b.createdAt.compareTo(a.createdAt));
}
