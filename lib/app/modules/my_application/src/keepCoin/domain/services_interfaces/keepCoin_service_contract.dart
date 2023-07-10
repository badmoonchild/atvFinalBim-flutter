import 'package:dartz/dartz.dart';
import 'package:login_with_firebase/app/modules/my_application/src/keepCoin/domain/conversao_entity.dart';

import '../../../common/errors/errors_classes.dart';

abstract class IKeepCoinService {
  Future<void> create(String userId,Conversao conversao);
  Future<void> delete(String userId,String conversaoId);
  Future<Conversao> read(String userId,String conversaoId);
  Future<void> update(String userId,String conversaoId, String tituloNovo);
  Future<List<Conversao>> getAll(String userId);
}
