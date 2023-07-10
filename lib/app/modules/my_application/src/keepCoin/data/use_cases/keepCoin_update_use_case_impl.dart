import 'package:login_with_firebase/app/modules/my_application/src/keepCoin/domain/use_cases_interfaces/keepCoin_update_use_case_contract.dart';

import '../../domain/services_interfaces/keepCoin_service_contract.dart';
import '../../domain/use_cases_interfaces/keepCoin_delete_use_case_contract.dart';

class KeepCoinUpdateUseCaseImpl implements IKeepCoinUpdateUseCase {
  final IKeepCoinService _keepCoinService;

  KeepCoinUpdateUseCaseImpl(this._keepCoinService);

  @override
  Future<void> call(String userId,String conversaoId, String tituloNovo) async => await _keepCoinService.update(userId, conversaoId, tituloNovo);
}
