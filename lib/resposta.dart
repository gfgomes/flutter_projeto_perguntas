import 'package:flutter/material.dart';

class Resposta extends StatelessWidget {
  final String texto;

  final void Function() fnQuandoSelecionado;

  Resposta(this.texto, this.fnQuandoSelecionado);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.blue,
            foregroundColor: Colors.white,
          ),
          child: Text(texto),
          onPressed: this.fnQuandoSelecionado),
    );
  }
}
