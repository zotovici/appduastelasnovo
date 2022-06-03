import 'package:flutter/material.dart';
import 'segunda_tela.dart';
import 'terceira_tela.dart';

enum Menu { itemUm }

class Primeira extends StatefulWidget {
  String opcao = "Operações Disponíveis";

  State<Primeira> createState() => _EstadoPrimeira();
}

class _EstadoPrimeira extends State<Primeira> {
  Future<void> janelaDois(BuildContext context) async {
    final resultado = await Navigator.push(
        context, MaterialPageRoute(builder: (context) => Segunda()));
    setState(() {
      widget.opcao = resultado;
    });
  }

  Future<void> janelaTres(BuildContext context) async {
    final resultado = await Navigator.push(
        context, MaterialPageRoute(builder: (context) => Terceira()));
    setState(() {
      widget.opcao = resultado;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Calcular o IMC'), actions: <Widget>[
        PopupMenuButton<Menu>(
            onSelected: (Menu item) {
              janelaDois(context);
            },
            itemBuilder: (BuildContext context) => <PopupMenuEntry<Menu>>[
                  const PopupMenuItem<Menu>(
                    value: Menu.itemUm,
                    child: Text('Calcular IMC'),
                  ),
                ])
      ]),
      body: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            
            children: <Widget>[
        ElevatedButton(
          child: Text('Calcular IMC'),
          onPressed: () {
            janelaDois(context);
          },
        ),
        ElevatedButton(
          child: Text('Dia do Rodízio'),
          onPressed: () {
            janelaTres(context);
          },
        )
      ])),
    );
  }
}
