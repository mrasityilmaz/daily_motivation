### Application Startup Hierrachy

- **Mappers** - Initialize the Mappers for Mappable objects.
- **Firebase** - Initialize the Firebase services.
- **Dependency Injection** - Initialize the Dependency Injection.
  - **These are the following steps:**
    - **GetIt** - Configuring the GetIt service locator.
    - **AppRouter** - Initialize the AppRouter.
      ```dart
      // It's annotated with @LazySingleton(order: 1)
      // So, it will be initialized first.
      gh.lazySingleton<_i15.AppRouter>(() => _i15.AppRouter());
      ```
    - **HiveService** - Initialize the HiveService for caching.
      ```dart
      // It's annotated with @LazySingleton(order: 2)
      // So, it will be initialized second.
      // Also, it's pre-resolved, it has a postConstruct init method.
      await gh.lazySingletonAsync<_i16.HiveService>(
      () {
          final i = _i16.HiveService();
          // @PostConstruct(preResolve: true)
          return i.init().then((_) => i);
        },
        preResolve: true,
      );
      ```
    - **UserServices** - Initialize the UserServices.
      ```dart
      // It's annotated with @LazySingleton(order: 3)
      // Also, it's pre-resolved, it has a postConstruct init method.
      await gh.singletonAsync<_i17.UserService>(
      () {
          final i = _i17.UserService();
          // @PostConstruct(preResolve: true)
          return i.initUser().then((_) => i);
        },
        preResolve: true,
      );
      ```
