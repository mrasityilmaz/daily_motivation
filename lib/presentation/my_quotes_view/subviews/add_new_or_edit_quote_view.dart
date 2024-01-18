import 'package:auto_route/auto_route.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:daily_motivation/core/extensions/context_extension.dart';
import 'package:daily_motivation/core/navigator/app_navigator.dart';
import 'package:daily_motivation/core/services/logger_service.dart';
import 'package:daily_motivation/data/models/quote_hive_model/quote_hive_model.dart';
import 'package:daily_motivation/data/services/hive_service/hive_service.dart';
import 'package:daily_motivation/injection/injection_container.dart';
import 'package:daily_motivation/presentation/core_widgets/advanced_button/advanced_button_widget.dart';
import 'package:daily_motivation/presentation/core_widgets/loading_indicator/viewmodel_loading_indicator_widget.dart';
import 'package:daily_motivation/presentation/core_widgets/textfield/textfield_widget.dart';
import 'package:daily_motivation/presentation/core_widgets/textfield/textformfield_widget.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:uuid/uuid.dart';

part 'add_new_or_edit_quote_viewmodel.dart';

@immutable
@RoutePage(name: 'AddNewOrEditQuoteViewRoute')
final class AddNewOrEditQuoteView<T extends QuoteHiveModel?> extends StatelessWidget {
  const AddNewOrEditQuoteView({super.key, this.editQuote});
  final QuoteHiveModel? editQuote;

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder.nonReactive(
      viewModelBuilder: () => _AddNewQuoteViewModel(editQuote: editQuote),
      onViewModelReady: (viewModel) => viewModel.onReady(),
      builder: (context, model, child) {
        return Stack(
          children: [
            Scaffold(
              appBar: AppBar(
                backgroundColor: context.colors.surface,
                title: Text(
                  editQuote != null ? 'Edit Quote' : 'New Quote',
                  style: context.textTheme.titleMedium?.copyWith(fontWeight: FontWeight.bold),
                ),
                centerTitle: true,
              ),
              body: const _AddNewOrEditQuoteViewBodyWidget(),
            ),
            const ViewModelLoadingIndicator<_AddNewQuoteViewModel>(),
          ],
        );
      },
    );
  }
}

@immutable
final class _AddNewOrEditQuoteViewBodyWidget extends ViewModelWidget<_AddNewQuoteViewModel> {
  const _AddNewOrEditQuoteViewBodyWidget();

  @override
  Widget build(BuildContext context, _AddNewQuoteViewModel viewModel) {
    return Padding(
      padding: context.screenPadding,
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
              padding: context.paddingLowVertical * .5,
              child: Row(
                children: [
                  Icon(
                    Icons.info_outlined,
                    color: context.colors.onBackground.withOpacity(.15),
                    size: 16,
                  ),
                  const SizedBox(width: 4),
                  AutoSizeText(
                    'Author is optional\nIf not provided, it will be set to unvisible',
                    style: context.textTheme.bodySmall?.copyWith(color: context.colors.onBackground.withOpacity(.15), fontWeight: FontWeight.w600, fontStyle: FontStyle.italic),
                  ),
                ],
              ),
            ),
            const Spacer(),
            SafeArea(
              minimum: context.mediaQuery.viewPadding.bottom == 0 ? EdgeInsets.zero : context.adaptiveScreenPaddingBottom,
              top: false,
              bottom: context.mediaQuery.viewPadding.bottom > 0,
              child: Row(
                children: [
                  Expanded(
                    child: AdvancedButtonWidget.text(
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
