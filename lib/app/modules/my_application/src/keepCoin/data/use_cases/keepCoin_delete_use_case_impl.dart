import '../../domain/services_interfaces/keepCoin_service_contract.dart';
import '../../domain/use_cases_interfaces/keepCoin_delete_use_case_contract.dart';

class KeepCoinDeleteUseCaseImpl implements IKeepCoinDeleteUseCase {
  final IKeepCoinService _keepCoinService;

  KeepCoinDeleteUseCaseImpl(this._keepCoinService);

  @override
  Future<void> call(String userId,String conversaoId) async => await _keepCoinService.delete(userId, conversaoId);
}
