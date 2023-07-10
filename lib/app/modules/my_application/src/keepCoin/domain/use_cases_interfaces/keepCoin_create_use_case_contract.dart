import 'package:dartz/dartz.dart';
import 'package:login_with_firebase/app/modules/my_application/src/keepCoin/domain/moedaConversao.dart';

import '../../../common/errors/errors_classes.dart';
import '../conversao_entity.dart';

abstract class IKeepCoinCreateUseCase {
  Future<void> call(String userId,Conversao conversao);
}
