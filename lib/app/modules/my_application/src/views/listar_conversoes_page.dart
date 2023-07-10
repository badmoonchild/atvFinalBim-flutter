import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_triple/flutter_triple.dart';
import 'package:login_with_firebase/app/modules/my_application/src/keepCoin/controller/keepCoin_store.dart';
import 'package:login_with_firebase/app/modules/my_application/src/keepCoin/domain/conversao_entity.dart';
import 'package:login_with_firebase/app/modules/my_application/src/keepCoin/domain/moedaConversao.dart';

import 'package:http/http.dart' as http;
import 'package:login_with_firebase/app/modules/my_application/src/views/conversoes_listview.dart';
import 'package:login_with_firebase/app/modules/my_application/src/views/text_componente.dart';
import 'package:login_with_firebase/app/modules/my_application/src/views/text_input.dart';
import '../authentication/presenter/controller/auth_store.dart';

class ListarConversoes extends StatefulWidget {
  const ListarConversoes({super.key});

  @override
  State<ListarConversoes> createState() => _ListarConversoesState();
}

class _ListarConversoesState extends State<ListarConversoes> {
  @override
  Widget build(BuildContext context) {
    final KeepCoinStore keepCoinStore = context.watch<KeepCoinStore>();
    return Scaffold(
        appBar: AppBar(
          title: const Text('KeepCoin'),
        ),
        body: FutureBuilder<List<Conversao>>(
          future: keepCoinStore.coinGetAll(),
          builder: (context, snapshot) {
            if (!snapshot.hasError) {
              if (snapshot.connectionState == ConnectionState.done) {
                List<Conversao> conversoes = snapshot.data!;
                return SingleChildScrollView  (
                  padding: const EdgeInsets.all(20),
                  child: Column(
                    children: <Widget>[
                      const Icon(
                        Icons.monetization_on_outlined,
                        color: Colors.blue,
                        size: 60,
                      ),
                      ConversoesListView(
                        conversoes: conversoes,
                        onUpdateConversao: onUpdateConversao,
                        onReadConversao: onReadConversao,
                        onDeleteConversao: ({required String conversaoId})  {keepCoinStore.coinDelete(conversaoId: conversaoId); setState(() {}); },
                      )
                      //ContactListView(users: users)
                    ],
                  ),
                );
              } else {
                return waitingIndicator();
              }
            } else {
              return waitingIndicator();
            }
          },
        )
    );
  }

  Center waitingIndicator() {
    return const Center(
      child: CircularProgressIndicator(),
    );
  }
  void onUpdateConversao({required String conversaoId}){
    Modular.to.pushNamed('./editarConversao', arguments: conversaoId).then((value) => setState(() {}));
  }

  void onReadConversao({required String conversaoId}){
    Modular.to.pushNamed('./detalheConversao', arguments: conversaoId);
  }

}