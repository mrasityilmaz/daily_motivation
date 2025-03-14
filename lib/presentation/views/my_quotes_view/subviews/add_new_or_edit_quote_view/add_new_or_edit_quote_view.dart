import 'package:auto_route/auto_route.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:quotely/core/extensions/context_extension.dart';
import 'package:quotely/data/models/quote_model/quote_model.dart';
import 'package:quotely/presentation/components/viewmodel_loading_indicator.dart';
import 'package:quotely/presentation/core_widgets/custom_buttons/custom_button.dart';
import 'package:quotely/presentation/core_widgets/textfield/textfield_widget.dart';
import 'package:quotely/presentation/core_widgets/textfield/textformfield_widget.dart';
import 'package:quotely/presentation/view_constants/padding_constants.dart';
import 'package:quotely/presentation/views/my_quotes_view/subviews/add_new_or_edit_quote_view/add_new_or_edit_quote_viewmodel.dart';
import 'package:stacked/stacked.dart';

part 'widgets/app_bar_widget.dart';
part 'widgets/body_widget.dart';

@immutable
@RoutePage(name: 'AddNewOrEditQuoteViewRoute')
final class AddNewOrEditQuoteView<T> extends StatelessWidget {
  const AddNewOrEditQuoteView({super.key, this.editQuote});
  final QuoteModel? editQuote;

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder.nonReactive(
      viewModelBuilder: () => AddNewOrEditQuoteViewModel(editQuote: editQuote),
      onViewModelReady: (viewModel) => viewModel.onReady(editQuote),
      builder: (context, model, child) {
        return Stack(
          children: [
            Scaffold(
              appBar: _AddNewOrEditAppBar(
                editQuote: editQuote,
              ),
              body: const _AddNewOrEditQuoteViewBodyWidget(),
            ),
            const ViewModelLoadingIndicator<AddNewOrEditQuoteViewModel>(),
          ],
        );
      },
    );
  }
}
