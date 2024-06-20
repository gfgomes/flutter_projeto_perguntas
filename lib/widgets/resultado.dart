import 'package:flutter/material.dart';

class Resultado extends StatelessWidget {
  final int pontuacaoTotal;
  final void Function() fnQuandoReiniciarQuestionario;

  const Resultado({
    super.key,
    required this.pontuacaoTotal,
    required this.fnQuandoReiniciarQuestionario,
  });

  String get fraseResultado {
    if (pontuacaoTotal < 8) {
      return 'Parabéns!';
    } else if (pontuacaoTotal < 12) {
      return 'Você é bom!';
    } else if (pontuacaoTotal < 16) {
      return 'Impressionante!';
    } else {
      return 'Nível Jedi!';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Center(
          child: Text(
            fraseResultado,
            style: const TextStyle(fontSize: 28),
          ),
        ),
        TextButton(
            onPressed: fnQuandoReiniciarQuestionario,
            child: const Text(
              'Reiniciar?',
              style: TextStyle(fontSize: 18, color: Colors.blue),
            ))
      ],
    );
  }
}
