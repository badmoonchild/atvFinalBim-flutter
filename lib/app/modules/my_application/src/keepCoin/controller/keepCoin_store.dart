import 'package:flutter_triple/flutter_triple.dart';
import 'package:login_with_firebase/app/modules/my_application/src/authentication/domain/use_cases_interfaces/auth_signup_user_case_contract.dart';
import 'package:login_with_firebase/app/modules/my_application/src/authentication/presenter/controller/auth_store.dart';
import 'package:login_with_firebase/app/modules/my_application/src/keepCoin/domain/conversao_entity.dart';
import 'package:login_with_firebase/app/modules/my_application/src/keepCoin/domain/moedaConversao.dart';
import 'package:login_with_firebase/app/modules/my_application/src/keepCoin/domain/use_cases_interfaces/keepCoin_create_use_case_contract.dart';
import 'package:login_with_firebase/app/modules/my_application/src/keepCoin/domain/use_cases_interfaces/keepCoin_delete_use_case_contract.dart';
import 'package:login_with_firebase/app/modules/my_application/src/keepCoin/domain/use_cases_interfaces/keepCoin_get_all_use_case_contract.dart';
import 'package:login_with_firebase/app/modules/my_application/src/keepCoin/domain/use_cases_interfaces/keepCoin_read_use_case_contract.dart';
import 'package:login_with_firebase/app/modules/my_application/src/keepCoin/domain/use_cases_interfaces/keepCoin_update_use_case_contract.dart';

class KeepCoinStore extends Store<Conversao?> {
  late final IKeepCoinCreateUseCase _create;
  late final IKeepCoinDeleteUseCase _delete;
  late final IKeepCoinGetAllUseCase _getAll;
  late final IKeepCoinReadUseCase _read;
  late final IKeepCoinUpdateUseCase _update;
  late final AuthStore _authStore;

  KeepCoinStore({
    required IKeepCoinCreateUseCase create,
    required IKeepCoinDeleteUseCase delete,
    required IKeepCoinGetAllUseCase getAll,
    required IKeepCoinReadUseCase read,
    required IKeepCoinUpdateUseCase update,
    required AuthStore authStore,
  }) : super(null) {
    _create = create;
    _delete = delete;
    _getAll = getAll;
    _read = read;
    _update = update;
    _authStore = authStore;
  }
  Future<void> coinCreate({required MoedaConversao conversao,required String nome,required double real,required double dolar}) async{
    Conversao request = Conversao(
        nome: nome,
        dolar: dolar,
        real: real,
        tipo: conversao.titulo,
        compra: conversao.compra,
        venda: conversao.venda,
        variacao:conversao.variacao,
        pctVariacao: conversao.pctVariacao
    );
    await _create(_authStore.state!.uId!,request);
  }
  Future<void> coinDelete({required String conversaoId}) async{
    await _delete(_authStore.state!.uId!,conversaoId);
  }
  Future<Conversao> coinRead({required String conversaoId}) async{
    return await _read(_authStore.state!.uId!,conversaoId);

  }
  Future<List<Conversao>> coinGetAll() async{
    return await _getAll(_authStore.state!.uId!);
  }
  Future<void> coinUpdate({required String conversaoId,required  String tituloNovo}) async{
    return await _update(_authStore.state!.uId!,conversaoId,tituloNovo);
  }

}
