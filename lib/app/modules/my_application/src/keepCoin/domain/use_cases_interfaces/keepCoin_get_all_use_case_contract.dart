import 'package:dartz/dartz.dart';

import '../../../common/errors/errors_classes.dart';
import '../conversao_entity.dart';

abstract class IKeepCoinGetAllUseCase {
  Future<List<Conversao>> call(String userId);
}
