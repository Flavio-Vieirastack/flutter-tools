
import 'package:flutter_tools/extensions/translate_extension.dart';

extension ErrorMessage on Object {
  String mappedLogError({
    required String finalMessage,
  }) {
    return 'Erro mapeado ao tentar pegar dados no $finalMessage';
  }

  String notMappedLogError({
    required String finalMessage,
  }) {
    return 'Erro não mapeado ao tentar pegar dados no $finalMessage';
  }

  String defaultMappedErrorMessage({
    required String finalMessage,
  }) {
    return 'Erro ao $finalMessage, por favor tente mais tarde'.translateTo(
      'There was an error performing the operation, please try again later',
    );
  }

  String defaultErrorMessage() {
    return 'Erro interno ao realizar operação, por favor tente mais tarde'
        .translateTo(
      'Internal error performing the operation, please try again later',
    );
  }
}
