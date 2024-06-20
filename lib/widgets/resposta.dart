import 'package:flutter/material.dart';

class Resposta extends StatelessWidget {
  final String texto;

  // Resposta espera receber uma função sem parametros como parametro, essa função será passada como anonima por outra função que mandará como uma função com parametro.
  // A função anonima recebe uma função com parametro, empacota uma função e passa como parametro para o widget resposta e executa a função anonima que obedece a regra de não ter parametro.
  // Não faz nem sentido pedir a pontuação do widget resposta aqui, pois o widget pai tem que passar a pontuação  para o widget resposta.
  final void Function() fnQuandoSelecionado;

  const Resposta(this.texto, this.fnQuandoSelecionado, {super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SizedBox(
        width: double.infinity,
        child: ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.blue,
              foregroundColor: Colors.white,
            ),
            onPressed: fnQuandoSelecionado,
            child: Text(texto)),
      ),
    );
  }
}
