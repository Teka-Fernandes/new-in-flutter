import 'package:flutter/material.dart';

class IMC extends StatefulWidget {
  @override
  _IMCState createState() => _IMCState();
}

class _IMCState extends State<IMC> {
 final TextEditingController _idadeControler = new TextEditingController();
 final TextEditingController _alturaControler = new TextEditingController();
 final TextEditingController _pesoControler= new TextEditingController();

double resultado = 0.0;
String _resultadoFinal ="";
String _resultadoConsulta = "";

void _CalcularIMC () {
  setState(() {
    int idade = int.parse(_idadeControler.text);
    double altura = double.parse(_alturaControler.text);
    double peso = double.parse(_pesoControler.text);


    if ((_idadeControler.text.isNotEmpty || idade > 0 )
    && (_alturaControler.text.isNotEmpty || altura > 0)
    && (_pesoControler.text.isNotEmpty || peso > 0)) {

      resultado = peso / (altura * altura);

      if (double.parse(resultado.toStringAsFixed(1)) < 16.00){
        _resultadoConsulta = "Baixo peso, Muito GRAVE!!";

      } else if (double.parse(resultado.toStringAsFixed(1)) >= 16.00
      && resultado < 16.99) {
        _resultadoConsulta = "Baixo Peso, Grave!";
      } else if (double.parse(resultado.toStringAsFixed(1)) >= 17.00
      && resultado <= 18.49){
        _resultadoConsulta = "Baixo Peso.";
      } else if (double.parse(resultado.toStringAsFixed(1)) >= 18.50
      && resultado <= 24.99){
        _resultadoConsulta = "Peso Normal";
      } else if (double.parse(resultado.toStringAsFixed(1)) >= 25.00
      && resultado <= 29.99){
        _resultadoConsulta = "Sobrepeso";
      } else if (double.parse(resultado.toStringAsFixed(1)) >= 30.00
      && resultado <= 34.99){
        _resultadoConsulta = "Obesidade grau I";
      } else if (double.parse(resultado.toStringAsFixed(1)) >= 35.00
      && resultado <= 39.99){
        _resultadoConsulta = "Obesidade grau II";
      } else if (double.parse(resultado.toStringAsFixed(1)) >= 40.00){
        _resultadoConsulta = "Obesidade grau III (Obesidade mórbida)";
      } else {
        resultado = 0.0;
      }
    }
  });
}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('IMC Calculator'),
        backgroundColor: Colors.pinkAccent,
      ),

      backgroundColor: Colors.white,
      body:
      Padding(
        padding: const EdgeInsets.all(8.0),
        child: Container(
          alignment: Alignment.topCenter,
          child: ListView (
            children: <Widget>[
              Image.asset("assets/imc_logo.png",
              width: 150.0,
              height: 100.0,
              ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              alignment: Alignment.center,
              color:Colors.grey.shade100,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: <Widget>[
                  TextField(
                keyboardType: TextInputType.number,
                controller: _idadeControler,
                decoration: InputDecoration(
                  labelText: 'Idade',
                  icon: Icon(Icons.person_outline),
                ),
            ),
                  TextField(
                 keyboardType: TextInputType.number,
                 controller: _alturaControler,
                 decoration: InputDecoration(
                   labelText: 'Altura (m)',
                   icon: Icon(Icons.height),
                 ),
                  ),
                  TextField(
                    keyboardType: TextInputType.number,
                    controller: _pesoControler,
                    decoration: InputDecoration(
                      labelText: 'Peso (Kg)',
                      icon: Icon(Icons.line_weight),
                    ),
                  ),
                  Center(
                    child: Row(
                      mainAxisAlignment:MainAxisAlignment.center,
                      children: <Widget>[
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Container(
                            child: RaisedButton( onPressed: _CalcularIMC,
                            color: Colors.pinkAccent,
                            child: Text('Calcular',
                            style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.w700,
                            ),),
                            ),
                          ),
                        )
                      ],
                    ),

                  ),
            ],
            ),
            ),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text("${resultado.toStringAsFixed(2)}",
              style: TextStyle(
                color: Colors.blueAccent,
                fontWeight: FontWeight.w500,
                fontStyle: FontStyle.italic,
                fontSize: 19.9,

              ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text("$_resultadoConsulta",
                style: TextStyle(
                  color: Colors.pinkAccent,
                  fontWeight: FontWeight.w500,
                  fontStyle: FontStyle.italic,
                  fontSize: 19.9,

                ),),
              )
            ],
          )
            ],
          )
        ),
      ),
    );
  }
}
