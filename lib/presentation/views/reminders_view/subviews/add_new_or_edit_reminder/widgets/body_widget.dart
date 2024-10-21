part of '../add_new_or_edit_reminder_view.dart';

@immutable
final class _AddNewOrEditReminderViewBodyWidget extends ViewModelWidget<_AddNewOrEditReminderViewModel> {
  const _AddNewOrEditReminderViewBodyWidget() : super(reactive: false);

  @override
  Widget build(BuildContext context, _AddNewOrEditReminderViewModel viewModel) {
    return CustomScrollView(
      slivers: [
        SliverToBoxAdapter(
          child: Padding(
            padding: const PaddingConstants.screenPadding(),
            child: Form(
              key: viewModel.formKey,
              child: Column(
                children: [
                  const _NotificationTitleSection(),
                  SizedBox(
                    height: context.normalValue,
                  ),
                  const _NotificationMessageSection(),
                  SizedBox(
                    height: context.normalValue,
                  ),
                  const _NotificationScheduleSection(),
                ],
              ),
            ),
          ),
        ),
        SliverSafeArea(
          minimum: context.mediaQuery.viewPadding.bottom == 0
              ? EdgeInsets.zero
              : PaddingConstants.adaptiveScreenPaddingBottom(MediaQuery.viewPaddingOf(context).bottom),
          top: false,
          bottom: context.mediaQuery.viewPadding.bottom > 0,
          sliver: SliverToBoxAdapter(
            child: Padding(
              padding: const PaddingConstants.screenPaddingHorizontal() + const PaddingConstants.normalTop(),
              child: Row(
                children: [
                  Expanded(
                    child: CustomButton.text(
                      text: 'Save',
                      textStyle: context.textTheme.titleMedium,
                      onPressed: () async => viewModel.save(),
                      expand: true,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}





  // Column(
                  //   crossAxisAlignment: CrossAxisAlignment.start,
                  //   children: [
                  //     Text(
                  //       'Notification Icon',
                  //       style: context.textTheme.bodyLarge?.copyWith(fontWeight: FontWeight.bold, color: context.colors.onBackground.withOpacity(.75)),
                  //     ),
                  //     Row(
                  //       children: [
                  //         Icon(
                  //           Icons.info_outlined,
                  //           color: context.colors.onBackground.withOpacity(.4),
                  //           size: 16,
                  //         ),
                  //         const SizedBox(width: 4),
                  //         AutoSizeText(
                  //           'Icon is optional\nIf not provided, it will be set to default',
                  //           maxLines: 2,
                  //           style: context.textTheme.bodySmall?.copyWith(color: context.colors.onBackground.withOpacity(.4), fontStyle: FontStyle.italic),
                  //         ),
                  //       ],
                  //     ),
                  //     SizedBox(
                  //       height: context.lowValue,
                  //     ),
                  //     SizedBox(
                  //       height: context.width * .2,
                  //       child: Row(
                  //         children: [
                  //           Container(
                  //             height: context.width * .2,
                  //             width: context.width * .2,
                  //             decoration: BoxDecoration(
                  //               color: context.appColors.surfaceColor.withOpacity(.2),
                  //               borderRadius: BorderRadius.circular(8),
                  //             ),
                  //             child: FractionallySizedBox(
                  //               heightFactor: .45,
                  //               widthFactor: .45,
                  //               child: FittedBox(
                  //                 child: Icon(
                  //                   Platform.isAndroid ? Icons.notifications_none_rounded : CupertinoIcons.bell,
                  //                 ),
                  //               ),
                  //             ),
                  //           ),
                  //           SizedBox(
                  //             width: context.lowValue,
                  //           ),
                  //           Expanded(
                  //             child: SizedBox(
                  //               height: context.width * .2,
                  //               child: ListView.builder(
                  //                 itemCount: Colors.primaries.length,
                  //                 scrollDirection: Axis.horizontal,
                  //                 itemBuilder: (context, index) {
                  //                   return Container(
                  //                     margin: context.paddingLowLeft,
                  //                     height: context.width * .2,
                  //                     width: context.width * .2,
                  //                     decoration: BoxDecoration(
                  //                       color: Colors.primaries[index].withOpacity(.2),
                  //                       borderRadius: BorderRadius.circular(8),
                  //                     ),
                  //                     child: FractionallySizedBox(
                  //                       heightFactor: .45,
                  //                       widthFactor: .45,
                  //                       child: FittedBox(
                  //                         child: Icon(
                  //                           Platform.isAndroid ? Icons.notifications_none_rounded : CupertinoIcons.bell,
                  //                         ),
                  //                       ),
                  //                     ),
                  //                   );
                  //                 },
                  //               ),
                  //             ),
                  //           ),
                  //         ],
                  //       ),
                  //     ),
                  //   ],
                  // ),
                  // SizedBox(
                  //   height: context.normalValue,
                  // ),
