import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:login_with_firebase/app/modules/my_application/src/keepCoin/domain/conversao_entity.dart';
import 'package:login_with_firebase/app/modules/my_application/src/keepCoin/domain/conversao_mapper.dart';
import 'package:login_with_firebase/app/modules/my_application/src/keepCoin/domain/services_interfaces/keepCoin_service_contract.dart';

class KeepCoinServiceImpl implements IKeepCoinService {
  @override
  Future<void> create(String userId, Conversao conversao) async{
    await FirebaseFirestore.instance.collection('Users').doc(userId).collection('Conversoes').doc().set(ConversaoMapper.entityToMap(conversao));
  }

  @override
  Future<void> delete(String userId, String conversaoId) async{
    var conversao = await FirebaseFirestore.instance.collection('Users').doc(userId).collection('Conversoes').doc(conversaoId);
    conversao.delete();
  }

  @override
  Future<List<Conversao>> getAll(String userId) async{
    var response = await FirebaseFirestore.instance.collection('Users').doc(userId).collection('Conversoes').get();
    return response.docs.map((doc) => ConversaoMapper.mapToEntity(doc.data(), doc.id)).toList();
  }

  @override
  Future<Conversao> read(String userId, String conversaoId) async{
    var response = await FirebaseFirestore.instance.collection('Users').doc(userId).collection('Conversoes').doc(conversaoId).get();
    return ConversaoMapper.mapToEntity(response.data()!, response.id);
  }

  @override
  Future<void> update(String userId, String conversaoId, String tituloNovo) async{
    var conversao = await FirebaseFirestore.instance.collection('Users').doc(userId).collection('Conversoes').doc(conversaoId);
    conversao.update({'nome':tituloNovo});
  }
}
