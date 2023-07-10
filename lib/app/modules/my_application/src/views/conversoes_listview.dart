import 'package:flutter/material.dart';
import 'package:login_with_firebase/app/modules/my_application/src/keepCoin/domain/conversao_entity.dart';


class ConversoesListView extends StatelessWidget {
  const ConversoesListView({
    super.key,
    required this.conversoes,
    required this.onUpdateConversao,
    required this.onDeleteConversao,
    required this.onReadConversao,
  });

  final List<Conversao> conversoes;
  final void Function({required String conversaoId})? onUpdateConversao;
  final void Function({required String conversaoId})? onReadConversao;
  final void Function({required String conversaoId})? onDeleteConversao;


  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      itemCount: conversoes.length,
      itemBuilder: (context, index) {
        return Card(
          child: ExpansionTile(
            title: Text( '${conversoes[index].real} - ${conversoes[index].dolar}',
              style: const TextStyle( fontWeight: FontWeight.bold, fontSize: 18, ),
            ),
            subtitle: Text(conversoes[index].nome!),
            children: <Widget>[
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  TextButton.icon(
                    onPressed: () => onReadConversao!(conversaoId: conversoes[index].id!),
                    icon: const Icon( Icons.info, color: Colors.blue),
                    label: const Text( "Ver", style: TextStyle(color: Colors.blue), ),
                  ),
                  TextButton.icon(
                    onPressed: () =>  onUpdateConversao!(conversaoId: conversoes[index].id!) ,
                    icon: const Icon( Icons.edit, color: Colors.amber),
                    label: const Text( 'Editar', style: TextStyle(color: Colors.amber), ),
                  ),
                  TextButton.icon(
                    onPressed: () => onDeleteConversao!(conversaoId: conversoes[index].id!),
                    icon: const Icon( Icons.delete, color: Colors.red),
                    label: const Text( "Excluir", style: TextStyle(color: Colors.red), ),
                  ),
                ],
              )
            ],
          ),
        );
      },
    );
  }
}
