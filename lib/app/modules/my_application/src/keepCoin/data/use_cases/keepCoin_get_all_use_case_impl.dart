import 'package:dartz/dartz.dart';
import 'package:login_with_firebase/app/modules/my_application/src/keepCoin/domain/use_cases_interfaces/keepCoin_get_all_use_case_contract.dart';

import '../../../common/errors/errors_classes.dart';
import '../../domain/services_interfaces/keepCoin_service_contract.dart';
import '../../domain/use_cases_interfaces/keepCoin_read_use_case_contract.dart';
import '../../domain/conversao_entity.dart';

class KeepCoinGetAllUseCaseImpl implements IKeepCoinGetAllUseCase {
  final IKeepCoinService _keepCoinService;

  KeepCoinGetAllUseCaseImpl(this._keepCoinService);

  @override
  Future<List<Conversao>> call(String userId) async {
    return await _keepCoinService.getAll(userId);
  }
}
