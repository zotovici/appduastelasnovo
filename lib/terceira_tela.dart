import 'package:flutter/material.dart';

class Terceira extends StatefulWidget {
  @override
  State<Terceira> createState() => _TerceiraEstado();
}

class _TerceiraEstado extends State<Terceira> {
  final placa = TextEditingController();
  final rodizio = {
    "1": "Segunda-Feira",
    "2": "Segunda-Feira",
    "3": "Terça-Feira",
    "4": "Terça-Feira",
    "5": "Quarta-Feira",
    "6": "Quarta-Feira",
    "7": "Quinta-Feira",
    "8": "Quinta-Feira",
    "9": "Sexta-Feira",
    "0": "Sexta-Feira"
  };
  String? dia = "";
  String digito = "0";
  void _verificaDia() {
    setState(() {
      String p = placa.text;
      digito = p[p.length-1];
      dia = rodizio[digito];
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Verifica Rodízio',
        home: Scaffold(
            appBar: AppBar(title: const Text('Verificar Rodízio')),
            body: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: <Widget>[
                  Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Text('Placa: '),
                        SizedBox(
                            width: 250,
                            child: TextField(
                                decoration: InputDecoration(
                                  border: OutlineInputBorder(),
                                  labelText: 'Digite a Placa do Veículo',
                                ),
                                controller: placa,
                                minLines: 1,
                                maxLines: 1))
                      ]),
                  ElevatedButton(
                      style: ButtonStyle(
                        backgroundColor:
                            MaterialStateProperty.all<Color>(Colors.green),
                      ),
                      onPressed: () {
                        _verificaDia();
                      },
                      child: const Text('Qual é meu dia de Rodízio')),
                  Text('Para placa final $digito o rodízio é : $dia'),
                  ElevatedButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    child: Text('Voltar'),
                  )
                ],
              ),
            )));
  }
}
