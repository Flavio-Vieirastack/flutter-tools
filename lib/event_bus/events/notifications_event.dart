final class SnackbarEvent {
  final String message;
  final String isFrom;
  final bool isErrorMessage;
  final bool isSuccessMessage;
  final bool isInfoMessage;
  final int durationInSeconds;
  final String translate;
  final bool enableSnackBarBehavior;
  double? bottomPaddingValue;
  SnackbarEvent({
    required this.message,
    required this.isFrom,
    this.isErrorMessage = false,
    this.isSuccessMessage = true,
    this.isInfoMessage = false,
    this.durationInSeconds = 3,
    this.bottomPaddingValue,
    this.enableSnackBarBehavior = true,
    required this.translate,
  });

  @override
  String toString() {
    return 'SnackbarEvent(message: $message, isFrom: $isFrom, isErrorMessage: $isErrorMessage, isSuccessMessage: $isSuccessMessage, isInfoMessage: $isInfoMessage, durationInSeconds: $durationInSeconds)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
  
    return other is SnackbarEvent &&
      other.message == message &&
      other.isFrom == isFrom &&
      other.isErrorMessage == isErrorMessage &&
      other.isSuccessMessage == isSuccessMessage &&
      other.isInfoMessage == isInfoMessage &&
      other.durationInSeconds == durationInSeconds &&
      other.translate == translate &&
      other.enableSnackBarBehavior == enableSnackBarBehavior &&
      other.bottomPaddingValue == bottomPaddingValue;
  }

  @override
  int get hashCode {
    return message.hashCode ^
      isFrom.hashCode ^
      isErrorMessage.hashCode ^
      isSuccessMessage.hashCode ^
      isInfoMessage.hashCode ^
      durationInSeconds.hashCode ^
      translate.hashCode ^
      enableSnackBarBehavior.hashCode ^
      bottomPaddingValue.hashCode;
  }
}
