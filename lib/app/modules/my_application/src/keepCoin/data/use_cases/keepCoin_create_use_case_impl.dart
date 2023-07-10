import 'package:dartz/dartz.dart';

import '../../../common/errors/errors_classes.dart';
import '../../domain/services_interfaces/keepCoin_service_contract.dart';
import '../../domain/use_cases_interfaces/keepCoin_create_use_case_contract.dart';
import '../../domain/conversao_entity.dart';

class KeepCoinCreateUseCaseImpl implements IKeepCoinCreateUseCase {
  final IKeepCoinService _keepCoinService;

  KeepCoinCreateUseCaseImpl(this._keepCoinService);

  @override
  Future<void> call(String userId,Conversao conversao) async  => await _keepCoinService.create(userId, conversao);
}
