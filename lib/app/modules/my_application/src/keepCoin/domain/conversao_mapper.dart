import 'dart:convert';

import 'conversao_entity.dart';

abstract class ConversaoMapper {
  static Map<String, dynamic> entityToMap(Conversao conversao) {
    return {
      'nome': conversao.nome,
      'dolar': conversao.dolar,
      'real': conversao.real,
      'tipo': conversao.tipo,
      'compra': conversao.compra,
      'venda': conversao.venda,
      'variacao': conversao.variacao,
      'pctVariacao': conversao.pctVariacao,
    };
  }

  static String entityToJson(Conversao conversao) {
    var map = entityToMap(conversao);
    return mapToJson(map);
  }

  static Conversao mapToEntity(Map<String, dynamic> map, String id) {
    return Conversao(
      id: id,
      nome: map['nome'],
      dolar: map['dolar'],
      real: map['real'],
      tipo: map['tipo'],
      compra: map['compra'],
      venda: map['venda'],
      variacao: map['variacao'],
      pctVariacao: map['pctVariacao']
    );
  }

  static String mapToJson(Map<String, dynamic> map) => json.encode(map);
  static Map<String, dynamic> jsonToMap(String jSon) => json.decode(jSon);
}
