import 'package:flutter/material.dart';
import 'questao.dart';
import 'resposta.dart';

class Questionario extends StatelessWidget {
  final List<Map<String, Object>> perguntas;
  final int perguntaSelecionada;
  final void Function(int) fnQuandoResponder;

  const Questionario({
    super.key,
    required this.perguntas,
    required this.perguntaSelecionada,
    required this.fnQuandoResponder,
  });

  bool get temPerguntaSelecionada {
    return perguntaSelecionada < perguntas.length;
  }

  @override
  Widget build(BuildContext context) {
    List<Map<String, Object>> respostas = temPerguntaSelecionada
        ? perguntas[perguntaSelecionada].cast()['respostas']
        : [];

    return Column(
      children: [
        Questao(
          perguntas[perguntaSelecionada]['texto'].toString(),
        ),
        // Dentro do column é inserido um widget de questão e as respostas de cada questão pelo Spread Operator ...
        // ... = Spread Operator insere uma lista de widgets repostas
        // Cada resposta recebe uma função que recebe um texto como parametro e uma função como parametro para ser executada quando for selecionada a resposta
        ...respostas.map<Widget>(
          (Map<String, Object> resp) {
            return Resposta(
              resp['texto'].toString(),
              //O widget resposta espera uma função sem parametro, então a função anonima recebe uma função com parametro, empacota uma função e passa como parametro para o widget resposta e executa a função anonima que obedece a regra de não ter parametro
              () => fnQuandoResponder(resp['pontuacao'] as int),
            );
          },
        ),
      ],
    );
  }
}
