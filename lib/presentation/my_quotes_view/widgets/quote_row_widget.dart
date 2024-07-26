part of '../my_quotes_view.dart';

@immutable
final class _QuoteRowWidget extends ViewModelWidget<MyQuotesViewModel> {
  const _QuoteRowWidget({required this.quote}) : super(reactive: false);
  final QuoteHiveModel quote;

  @override
  Widget build(BuildContext context, MyQuotesViewModel viewModel) {
    return Padding(
      padding: context.paddingLowBottom,
      child: Slidable(
        // Specify a key if the Slidable is dismissible.
        key: ValueKey(quote.id),

        endActionPane: ActionPane(
          motion: const ScrollMotion(),
          children: [
            SlidableAction(
              onPressed: (ctx) async => viewModel.onPressedDeleteMyQuoteButton(id: quote.id),
              borderRadius: BorderRadius.circular(8),
              backgroundColor: context.colors.surface,
              label: 'Remove',
              icon: Platform.isAndroid ? Icons.delete_outline_rounded : CupertinoIcons.trash,
              padding: EdgeInsets.zero,
              foregroundColor: Colors.red.shade600,
            ),
            SlidableAction(
              onPressed: (ctx) async => viewModel.onPressedEditMyQuoteButton(quoteHiveModel: quote),
              borderRadius: BorderRadius.circular(8),
              backgroundColor: context.colors.surface,
              label: 'Edit',
              icon: Platform.isAndroid ? Icons.edit_note_rounded : CupertinoIcons.pencil_circle,
              padding: EdgeInsets.zero,
            ),
          ],
        ),

        child: Container(
          width: double.maxFinite,
          decoration: BoxDecoration(color: context.colors.onSurface.withOpacity(.05), borderRadius: context.radius8),
          padding: context.paddingLowHorizontal + context.paddingLowVertical * 1.2,
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
                  if (quote.author.isNotEmpty) ...[
                    Text(
                      quote.author,
                      style: context.textTheme.bodySmall?.copyWith(color: context.colors.onSurface.withOpacity(.7), fontWeight: FontWeight.w600, fontStyle: FontStyle.italic),
                    ),
                  ],
                  const Spacer(),
                  GestureDetector(
                    onTap: () async => viewModel.copyQuote(context, quote: quote),
                    child: Icon(
                      Icons.copy,
                      color: context.colors.onSurface.withOpacity(.25),
                      size: 16,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
