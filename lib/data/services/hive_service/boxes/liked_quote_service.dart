import 'package:daily_motivation/data/models/quote_hive_model/quote_hive_model.dart';
import 'package:daily_motivation/data/services/hive_service/i_hivebox_service.dart';

final class LikedQuoteBoxService extends IHiveBoxService<QuoteHiveModel> {
  LikedQuoteBoxService({required super.box});
}
