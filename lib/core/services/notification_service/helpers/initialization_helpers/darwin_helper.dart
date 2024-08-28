part of '../../notification_service.dart';

///
/// Main Darwin Initialization Setting
///
mixin _DarwinInitializationHelper {
  ///
  /// Constant Variables
  ///
  /// A notification action which triggers a App navigation event
  final String _navigationActionId = 'id_3';

  /// Defines a iOS/MacOS notification category for text input actions.
  final String _darwinNotificationCategoryText = 'textCategory';

  /// Defines a iOS/MacOS notification category for plain actions.
  final String _darwinNotificationCategoryPlain = 'plainCategory';

  ///
  /// *
  ///
  ///
  late final List<DarwinNotificationCategory> _darwinNotificationCategories = <DarwinNotificationCategory>[
    DarwinNotificationCategory(
      _darwinNotificationCategoryText,
      actions: <DarwinNotificationAction>[
        DarwinNotificationAction.text(
          'text_1',
          'Action 1',
          buttonTitle: 'Send',
          placeholder: 'Placeholder',
        ),
      ],
    ),
    DarwinNotificationCategory(
      _darwinNotificationCategoryPlain,
      actions: <DarwinNotificationAction>[
        DarwinNotificationAction.plain('id_1', 'Action 1'),
        DarwinNotificationAction.plain(
          'id_2',
          'Action 2 (destructive)',
          options: <DarwinNotificationActionOption>{
            DarwinNotificationActionOption.destructive,
          },
        ),
        DarwinNotificationAction.plain(
          _navigationActionId,
          'Action 3 (foreground)',
          options: <DarwinNotificationActionOption>{
            DarwinNotificationActionOption.foreground,
          },
        ),
        DarwinNotificationAction.plain(
          'id_4',
          'Action 4 (auth required)',
          options: <DarwinNotificationActionOption>{
            DarwinNotificationActionOption.authenticationRequired,
          },
        ),
      ],
      options: <DarwinNotificationCategoryOption>{
        DarwinNotificationCategoryOption.hiddenPreviewShowTitle,
      },
    ),
  ];

  ///
  ///

  /// Note: permissions aren't requested here just to demonstrate that can be
  /// done later
  late final DarwinInitializationSettings _initializationSettingsDarwin = DarwinInitializationSettings(
    requestCriticalPermission: true,
    onDidReceiveLocalNotification: (int id, String? title, String? body, String? payload) async {
      print('ID : $id\n');
      print('Title : $title\n');
      print('Body : $body\n');
      print('Payload : $payload\n');

      ///
      /// TODO - onDidReceiveLocalNotification
      ///
      //  didReceiveLocalNotificationStream.add(
      //    ReceivedNotification(
      //      id: id,
      //      title: title,
      //      body: body,
      //      payload: payload,
      //    ),
      //  );
    },
    notificationCategories: _darwinNotificationCategories,
  );
}
