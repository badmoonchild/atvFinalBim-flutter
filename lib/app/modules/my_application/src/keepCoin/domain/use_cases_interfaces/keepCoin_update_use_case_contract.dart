import 'package:dartz/dartz.dart';

import '../../../common/errors/errors_classes.dart';
import '../conversao_entity.dart';

abstract class IKeepCoinUpdateUseCase {
  Future<void> call(String userId,String conversaoId, String tituloNovo);
}
