final class AutoNavigateEvent {
  final String route;
  final bool replace;
  final bool removeUntil;
  final Object? args;
  const AutoNavigateEvent({
    required this.route,
    this.replace = false,
    this.removeUntil = false,
    this.args,
  });
}
