import 'package:dartz/dartz.dart';

import '../../../common/errors/errors_classes.dart';
import '../../domain/services_interfaces/keepCoin_service_contract.dart';
import '../../domain/use_cases_interfaces/keepCoin_read_use_case_contract.dart';
import '../../domain/conversao_entity.dart';

class KeepCoinReadUseCaseImpl implements IKeepCoinReadUseCase {
  final IKeepCoinService _keepCoinService;

  KeepCoinReadUseCaseImpl(this._keepCoinService);

  @override
  Future<Conversao> call(String userId,String conversaoId) async {
    return await _keepCoinService.read(userId, conversaoId);
  }
}
