import 'package:flutter/material.dart';

class Segunda extends StatefulWidget {
  @override
  State<Segunda> createState() => _SegundaEstado();
}

class _SegundaEstado extends State<Segunda> {
  final peso = TextEditingController();
  final altura = TextEditingController();
  String imc = "0.0";
  void _calcula() {
    setState(() {
      double p = double.parse(peso.text);
      double a = double.parse(altura.text);
      imc = (p / (a * a)).toStringAsFixed(1);
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Cálculo do IMC',
        home: Scaffold(
            appBar: AppBar(title: const Text('Exemplo 1')),
            body: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: <Widget>[
                  Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Text('Peso: '),
                        SizedBox(
                            width: 250,
                            child: TextField(
                                decoration: InputDecoration(
                                  border: OutlineInputBorder(),
                                  labelText: 'Digite o seu peso',
                                ),
                                controller: peso,
                                minLines: 1,
                                maxLines: 1))
                      ]),
                  Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Text('Altura: '),
                        SizedBox(
                            width: 250,
                            child: TextField(
                                decoration: InputDecoration(
                                  border: OutlineInputBorder(),
                                  labelText: 'Digite a sua altura',
                                ),
                                controller: altura,
                                minLines: 1,
                                maxLines: 1))
                      ]),
                  ElevatedButton(
                      style: ButtonStyle(
                        backgroundColor:
                            MaterialStateProperty.all<Color>(Colors.green),
                      ),
                      onPressed: () {
                        _calcula();
                      },
                      child: const Text('Calcular IMC')),
                  Text('Resultado do IMC: $imc %'),
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