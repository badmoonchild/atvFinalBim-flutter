import 'package:dartz/dartz.dart';

import '../../../common/errors/errors_classes.dart';
import '../conversao_entity.dart';

abstract class IKeepCoinReadUseCase {
  Future<Conversao> call(String userId,String conversaoId);
}
