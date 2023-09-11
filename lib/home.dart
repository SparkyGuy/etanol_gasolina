import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({Key? key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  TextEditingController _controllerBase = TextEditingController();
  TextEditingController _controllerAltura = TextEditingController();
  String _textoResultado = "";

  void _calcular() {
    double? base = double.tryParse(_controllerBase.text);
    double? altura = double.tryParse(_controllerAltura.text);

    if (base == null || altura == null) {
      setState(() {
        _textoResultado =
            "Número inválido, digite números maiores que 0 e utilizando (.)";
      });
    } else {
      double area = base * altura;
      setState(() {
        _textoResultado = "A área do retângulo é $area";
        _limpaCampos();
      });
    }
  }

  void _limpaCampos() {
    _controllerBase.clear();
    _controllerAltura.clear();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Área do Retângulo"),
        backgroundColor: Colors.blue,
      ),
      body: Container(
        child: SingleChildScrollView(
          padding: EdgeInsets.all(32),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Center(
                child: Padding(
                  padding: EdgeInsets.only(bottom: 32),
                  child: Text(
                    "Calcular a área de um retângulo",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        fontSize: 25,
                        color: Colors.black,
                        fontWeight: FontWeight.bold),
                  ),
                ),
              ),
              TextField(
                keyboardType: TextInputType.number,
                decoration: InputDecoration(labelText: "Comprimento da base:"),
                style: TextStyle(fontSize: 25),
                controller: _controllerBase,
              ),
              TextField(
                keyboardType: TextInputType.number,
                decoration: InputDecoration(labelText: "Altura:"),
                style: TextStyle(fontSize: 25),
                controller: _controllerAltura,
              ),
              Padding(
                padding: EdgeInsets.only(top: 10),
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      padding: EdgeInsets.all(10),
                      backgroundColor: Colors.blue,
                      textStyle: TextStyle(fontSize: 25)),
                  onPressed: _calcular,
                  child: Text(
                    "Calcular",
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ),
              Center(
                child: Padding(
                  padding: EdgeInsets.all(20),
                  child: Text(
                    _textoResultado,
                    style: TextStyle(fontSize: 25, color: Colors.green),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

void main() {
  runApp(MaterialApp(
    home: Home(),
  ));
}
