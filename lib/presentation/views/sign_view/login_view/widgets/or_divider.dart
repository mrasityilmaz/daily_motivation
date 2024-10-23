part of '../login_view.dart';

@immutable
final class _OrDivider extends StatelessWidget {
  const _OrDivider();

  @override
  Widget build(BuildContext context) {
    return Gap.normalHeight(
          child: Row(
            children: [
              Expanded(
                child: Divider(
                  endIndent: 10,
                  indent: 10,
                  color: Theme.of(context).colorScheme.primary.withOpacity(.5),
                ),
              ),
              Text(
                LocaleKeys.sign_or.tr(),
                style: context.textTheme.labelMedium
                    ?.copyWith(color: Theme.of(context).colorScheme.primary.withOpacity(.5)),
              ),
              Expanded(
                child: Divider(
                  endIndent: 10,
                  indent: 10,
                  color: Theme.of(context).colorScheme.primary.withOpacity(.5),
                ),
              ),
            ],
          ),
        ) *
        5;
  }
}
