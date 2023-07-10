import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:login_with_firebase/app/modules/my_application/src/common/messages/messages_app.dart';
import 'package:login_with_firebase/app/modules/my_application/src/keepCoin/controller/keepCoin_store.dart';
import 'package:http/http.dart' as http;
import 'package:login_with_firebase/app/modules/my_application/src/keepCoin/domain/moedaConversao.dart';
import 'package:login_with_firebase/app/modules/my_application/src/views/text_input.dart';

class AdicionarConversao extends StatefulWidget {
  const AdicionarConversao({super.key});

  @override
  State<AdicionarConversao> createState() => _AdicionarConversaoState();
}

class _AdicionarConversaoState extends State<AdicionarConversao> {

  final nomeControl = TextEditingController();
  final realControl = TextEditingController();
  final dolarControl = TextEditingController();
  late MoedaConversao moeda;
  @override
  Widget build(BuildContext context) {
    final KeepCoinStore keepCoinStore = context.watch<KeepCoinStore>();
    return Scaffold(
      appBar: AppBar(
        title: const Text('KeepCoin'),
      ),
      body: FutureBuilder<MoedaConversao>(
        future: getApiMoeda(),
        builder: (context, snapshot) {
          if (!snapshot.hasError) {
            if (snapshot.connectionState == ConnectionState.done) {
              moeda = snapshot.data!;
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
                              TextInput(controller: realControl,hintTextName: 'Real', onChanged: _convertReal, textInputType: TextInputType.number),
                              const SizedBox(height: 10),
                              TextInput(controller: dolarControl, hintTextName: 'Dolar', onChanged: _convertDolar, textInputType: TextInputType.number),
                              const SizedBox(height: 10),
                              Container(
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                  children: <Widget>[
                                    Expanded(
                                      child: ElevatedButton(
                                        onPressed: () {
                                          if(realControl.text != null && realControl.text.isNotEmpty &&
                                              dolarControl.text != null && dolarControl.text.isNotEmpty &&
                                              nomeControl.text != null && nomeControl.text.isNotEmpty){
                                            keepCoinStore.coinCreate(conversao: moeda, nome: nomeControl.text, real:  double.parse(realControl.text),dolar: double.parse(dolarControl.text));
                                            _clearFields();
                                            MessagesApp.showCustom(context,"Sucesso");
                                          }else{
                                            MessagesApp.showCustom(context,"Preencha todos os campos");
                                          }
                                        },
                                        child: const Text('Adicionar'),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
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


  void _clearFields() {
    realControl.clear();
    dolarControl.clear();
  }
  void _convertReal(String text) {
    print("tste21");
    if (text.trim().isEmpty) {
      _clearFields();
      return;
    }

    double real = double.parse(text);
    dolarControl.text = (real / double.parse(moeda.compra)).toStringAsFixed(2);
  }

  void _convertDolar(String text) {
    if (text.trim().isEmpty) {
      _clearFields();
      return;
    }
    double dolar = double.parse(text);
    realControl.text = ( double.parse(moeda.compra) * dolar).toStringAsFixed(2);
  }
Center waitingIndicator() {
    return const Center(
      child: CircularProgressIndicator(),
    );
  }
}

Future<MoedaConversao> getApiMoeda() async {
  const requestApi = "https://economia.awesomeapi.com.br/last/USD-BRL";
  var response = await http.get(Uri.parse(requestApi));
  Map<String, dynamic> json = jsonDecode(response.body);
  return MoedaConversao.fromJson(json['USDBRL']);
}