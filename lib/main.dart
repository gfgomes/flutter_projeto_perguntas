import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'questionario.dart';
import 'resultado.dart';

void main() => runApp(PerguntasApp());

//Classe componente
class PerguntasApp extends StatefulWidget {
  _PerguntasAppState createState() => _PerguntasAppState();
}

//Classe que genrencia o estado do componente PerguntasApp
class _PerguntasAppState extends State<PerguntasApp> {
  var _m_perguntaSelecionada = 0;
  final _m_list_perguntas = const [
    {
      'texto': 'Qual é sua cor favorita?',
      'respostas': [
        {'texto': 'Preto', 'nota': 10},
        {'texto': 'Vermelho', 'nota': 5},
        {'texto': 'Verde', 'nota': 3},
        {'texto': 'Branco', 'nota': 1}
      ]
    },
    {
      'texto': 'Qual é o seu animal favorito?',
      'respostas': [
        {'texto': 'Coelho', 'nota': 10},
        {'texto': 'Cobra', 'nota': 5},
        {'texto': 'Elefante', 'nota': 3},
        {'texto': 'Leão', 'nota': 1},
      ],
    },
    {
      'texto': 'Qual é seu instrutor favorito?',
      'respostas': [
        {'texto': 'Leo', 'nota': 10},
        {'texto': 'Maria', 'nota': 5},
        {'texto': 'João', 'nota': 3},
        {'texto': 'Pedro', 'nota': 1},
      ],
    }
  ];

  bool get propTemPerguntaSelecionada {
    return _m_perguntaSelecionada < _m_list_perguntas.length;
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: Text('Perguntas'),
        ),
        body: propTemPerguntaSelecionada
            ? Questionario(
                perguntas: _m_list_perguntas,
                perguntaSelecionada: _m_perguntaSelecionada,
                fnQuandoResponder: _fnResponder,
              )
            : Resultado(),
      ),
    );
  }

  void _fnResponder() {
    if (propTemPerguntaSelecionada == true) {
      setState(() {
        _m_perguntaSelecionada++;
      });
    }
  }
}
