part of '../favorites_view.dart';

@immutable
final class _QuoteRowWidget extends ViewModelWidget<FavoritesViewModel> {
  const _QuoteRowWidget({required this.quote}) : super(reactive: false);
  final QuoteModel quote;

  @override
  Widget build(BuildContext context, FavoritesViewModel viewModel) {
    return Padding(
      padding: const PaddingConstants.lowBottom(),
      child: Slidable(
        // Specify a key if the Slidable is dismissible.
        key: ValueKey(quote.id),

        endActionPane: ActionPane(
          motion: const ScrollMotion(),
          extentRatio: .25,
          children: [
            SlidableAction(
              onPressed: (ctx) async {
                await viewModel.unLikeQuote(quote.id);
              },
              borderRadius: BorderRadius.circular(8),
              backgroundColor: context.colors.surface,
              label: 'Remove',
              icon: Platform.isAndroid ? Icons.delete_outline_rounded : CupertinoIcons.trash,
              padding: const PaddingConstants.lowBottom(),
              foregroundColor: Colors.red.shade600,
            ),
          ],
        ),

        child: Container(
          width: double.maxFinite,
          decoration: BoxDecoration(
            color: context.colors.onSurface.withOpacity(.05),
            borderRadius: const RadiusConstants.allLow(),
          ),
          padding: const PaddingConstants.lowHorizontal() + const PaddingConstants.lowVertical() * 1.2,
          child: GestureDetector(
            onTap: () async => viewModel.copyQuote(context, quote: quote),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  quote.quote,
                  style: context.textTheme.titleSmall,
                ),
                const SizedBox(height: 4),
                Row(
                  children: [
                    Text(
                      quote.author,
                      style: context.textTheme.bodySmall?.copyWith(
                        color: context.colors.onSurface.withOpacity(.7),
                        fontWeight: FontWeight.w600,
                        fontStyle: FontStyle.italic,
                      ),
                    ),
                    const Spacer(),
                    Icon(
                      Icons.copy,
                      color: context.colors.onSurface.withOpacity(.25),
                      size: 18,
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
