import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:login_with_firebase/app/modules/my_application/src/common/messages/messages_app.dart';
import 'package:login_with_firebase/app/modules/my_application/src/keepCoin/controller/keepCoin_store.dart';
import 'package:login_with_firebase/app/modules/my_application/src/keepCoin/domain/conversao_entity.dart';
import 'package:login_with_firebase/app/modules/my_application/src/views/text_input.dart';

class EditarConversao  extends StatelessWidget {
  const EditarConversao({
    super.key,
    required this.conversaoId,
  });
  final String conversaoId;

  @override
  Widget build(BuildContext context) {
    final KeepCoinStore keepCoinStore = context.watch<KeepCoinStore>();
    return Scaffold(
        appBar: AppBar(
          title: const Text('KeepCoin'),
        ),
        body: FutureBuilder<Conversao>(
          future: keepCoinStore.coinRead(conversaoId: conversaoId),
          builder: (context, snapshot) {
            var nomeControl = TextEditingController();
            var realControl = TextEditingController();
            var dolarControl = TextEditingController();
            if (!snapshot.hasError) {
              if (snapshot.connectionState == ConnectionState.done) {
                Conversao conversaoDetail = snapshot.data!;
                nomeControl.text=conversaoDetail.nome!;
                realControl.text=conversaoDetail.real!.toString();
                dolarControl.text=conversaoDetail.dolar!.toString();
                return SingleChildScrollView  (
                  padding: const EdgeInsets.all(20),
                  child: Column(
                    children: <Widget>[
                      const Icon(
                        Icons.monetization_on_outlined,
                        color: Colors.blue,
                        size: 60,
                      ),
                      Card(
                        child: SizedBox(
                            child: Padding(
                                padding: EdgeInsets.all(16.0),
                                child:Column(
                                    children: <Widget>[
                                      const SizedBox(height: 30),
                                      TextInput( controller: nomeControl, hintTextName: 'Nome'),
                                      const SizedBox(height: 10),
                                      TextInput(controller: realControl,hintTextName: 'Real', enable: false,),
                                      const SizedBox(height: 10),
                                      TextInput(controller: dolarControl, hintTextName: 'Dolar', enable: false,),
                                      const SizedBox(height: 10),
                                      Container(
                                        child: Row(
                                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                          children: <Widget>[
                                            Expanded(
                                              child: ElevatedButton(
                                                onPressed: () {
                                                  if(nomeControl.text != null && nomeControl.text.isNotEmpty){
                                                    keepCoinStore.coinUpdate(conversaoId: conversaoId, tituloNovo: nomeControl.text);
                                                    MessagesApp.showCustom(context,"Sucesso");
                                                    Modular.to.pop();
                                                  }else{
                                                    MessagesApp.showCustom(context,"Preencha todos os campos");
                                                  }
                                                },
                                                child: const Text('Editar'),
                                              ),
                                            ),
                                          ],
                                        ),
                                      )
                                    ]
                                )
                            )
                        ),
                      ),
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
}
