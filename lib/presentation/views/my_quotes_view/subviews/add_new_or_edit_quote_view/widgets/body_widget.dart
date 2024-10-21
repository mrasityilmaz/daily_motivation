part of '../add_new_or_edit_quote_view.dart';

@immutable
final class _AddNewOrEditQuoteViewBodyWidget extends ViewModelWidget<AddNewOrEditQuoteViewModel> {
  const _AddNewOrEditQuoteViewBodyWidget() : super(reactive: false);

  @override
  Widget build(BuildContext context, AddNewOrEditQuoteViewModel viewModel) {
    return Padding(
      padding: const PaddingConstants.screenPadding(),
      child: Form(
        autovalidateMode: AutovalidateMode.onUserInteraction,
        key: viewModel.formKey,
        child: Column(
          children: [
            SizedBox(
              height: context.normalValue,
            ),
            ConstrainedBox(
              constraints: BoxConstraints.tightFor(height: context.height * .25),
              child: CustomTextFormFieldWidget(
                controller: viewModel.quoteTextController,
                verticalTextAlign: TextAlignVertical.top,
                hintText: 'Quote',
                maxLines: null,
                expands: true,
                validator: (p0) {
                  if (p0 == null || p0.isEmpty || p0.trim().isEmpty || p0.replaceAll(' ', '').isEmpty) {
                    return 'Quote cannot be empty';
                  } else if (p0.length < 3) {
                    return 'Quote cannot be smaller than 3 characters';
                  }
                  return null;
                },
              ),
            ),
            SizedBox(
              height: context.normalValue * 1.5,
            ),
            CustomTextFieldWidget(
              controller: viewModel.authorTextController,
              hintText: 'Author',
            ),
            Padding(
              padding: const PaddingConstants.lowVertical() * .5,
              child: Row(
                children: [
                  Icon(
                    Icons.info_outlined,
                    color: context.colors.onSurface.withOpacity(.15),
                    size: 16,
                  ),
                  const SizedBox(width: 4),
                  AutoSizeText(
                    'Author is optional\nIf not provided, it will be set to unvisible',
                    style: context.textTheme.bodySmall?.copyWith(
                      color: context.colors.onSurface.withOpacity(.15),
                      fontWeight: FontWeight.w600,
                      fontStyle: FontStyle.italic,
                    ),
                  ),
                ],
              ),
            ),
            const Spacer(),
            SafeArea(
              minimum: context.mediaQuery.viewPadding.bottom == 0
                  ? EdgeInsets.zero
                  : PaddingConstants.adaptiveScreenPaddingBottom(MediaQuery.viewPaddingOf(context).bottom),
              top: false,
              bottom: context.mediaQuery.viewPadding.bottom > 0,
              child: Row(
                children: [
                  Expanded(
                    child: CustomButton.text(
                      text: 'Save',
                      textStyle: context.textTheme.titleMedium,
                      onPressed: () async => viewModel.saveQuote(),
                      expand: true,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
