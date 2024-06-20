import 'package:flutter/material.dart';
import 'package:projeto_perguntas/data/lista_de_perguntas.dart';
import 'package:projeto_perguntas/widgets/questionario.dart';
import 'package:projeto_perguntas/widgets/resultado.dart';

class PerguntasScreen extends StatefulWidget {
  const PerguntasScreen({super.key});

  @override
  PerguntasScreenState createState() => PerguntasScreenState();
}

//Classe que genrencia o estado do componente PerguntasApp
class PerguntasScreenState extends State<PerguntasScreen> {
  var _indexPerguntaSelecionada = 0;
  var _pontuacaoTotal = 0;

  bool get propTemPerguntaSelecionada {
    return _indexPerguntaSelecionada < globalListPerguntas.length;
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Perguntas'),
        ),
        body: propTemPerguntaSelecionada
            //Comunicação direta: PerguntasApp -> Questionario -> Resposta : pai passa parametro para o filho via construtor
            ? Questionario(
                perguntas: globalListPerguntas,
                perguntaSelecionada: _indexPerguntaSelecionada,
                fnQuandoResponder: _fnResponder,
              )
            : Resultado(
                pontuacaoTotal: _pontuacaoTotal,
                fnQuandoReiniciarQuestionario: _fnReiniciarQuestionario),
      ),
    );
  }

// Comunicação indireta: PerguntasApp -> Questionario -> Resposta :Essa função é passada via parametro até o widget Questionario que passa para o widget Resposta que executa essa função chamando o setstate, e o setstate atualiza o estado do componente.
//Através da função passada para o filho, ele atualiza o estado do pai, passa valores para o pai, pois o valor da pontuação vem do filho e armazenada na variavel global do pai: Resposta -> Questionario -> PerguntasApp.
  void _fnResponder(int pontuacao) {
    if (propTemPerguntaSelecionada == true) {
      setState(
        () {
          _indexPerguntaSelecionada++;
          _pontuacaoTotal += pontuacao;
        },
      );
    }
  }

  void _fnReiniciarQuestionario() {
    setState(() {
      _indexPerguntaSelecionada = 0;
      _pontuacaoTotal = 0;
    });
  }
}
