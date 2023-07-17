final class CrashlyticsErrorEvent {
  final String log;
  final Object error;
  final StackTrace stackTrace;
  final String information;
  final String? userIdentity;
  CrashlyticsErrorEvent({
    required this.log,
    required this.error,
    required this.stackTrace,
    required this.information,
    this.userIdentity,
  });
}
