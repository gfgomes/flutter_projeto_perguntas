import 'package:flutter/material.dart';
import 'questao.dart';
import 'resposta.dart';

class Questionario extends StatelessWidget {
  final List<Map<String, Object>> perguntas;
  final int perguntaSelecionada;
  final void Function() fnQuandoResponder;

  Questionario(
      {required this.perguntas,
      required this.fnQuandoResponder,
      required this.perguntaSelecionada});

  bool get temPerguntaSelecionada {
    return perguntaSelecionada < perguntas.length;
  }

  Widget build(BuildContext context) {
    List<Map<String, Object>> respostas = temPerguntaSelecionada
        ? perguntas[perguntaSelecionada].cast()['respostas']
        : [];

    return Column(
      children: [
        Questao(perguntas[perguntaSelecionada]['texto'].toString()),
        ...respostas
            .map((resp) => Resposta(resp['texto'] as String, fnQuandoResponder))
            .toList()
      ],
    );
  }
}
