import'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class Planeta extends StatefulWidget {
  @override
  _PlanetaState createState() => _PlanetaState();
}

class _PlanetaState extends State<Planeta> {
  final TextEditingController _controldePeso = new TextEditingController();

 int radioValor = 1;

 String _nomePlaneta;

 bool selecaoValorA = true;
 bool selecaoValorB = true;
 bool selecaoValorC;
 bool switchValor = false;

 double _resultadoFinal = 0.0;


 void tomaContaValorRadio (int valor){
setState(() {
  radioValor = valor;
  switch (radioValor) {
    case 0:

      _resultadoFinal = calcularPesoEmPlaneta(_controldePeso.text, 0.06);
      _nomePlaneta = "O seu peso em Pluto é ${_resultadoFinal.toStringAsFixed(2)}";
      break;
    case 1:
      _resultadoFinal = calcularPesoEmPlaneta(_controldePeso.text, 0.38);
      _nomePlaneta = "O seu peso em Marte é ${_resultadoFinal.toStringAsFixed(2)}";

      break;
    case 2:
      _resultadoFinal = calcularPesoEmPlaneta(_controldePeso.text, 0.91);
      _nomePlaneta = "O seu peso em Vênus é ${_resultadoFinal.toStringAsFixed(2)}";
      break;
    default:
      debugPrint('Nada foi Selecionando');
  }
});
 }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Planeta X'),
        backgroundColor: Colors.black45,
      ),

      backgroundColor: Colors.blueGrey,
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Container(
          alignment: Alignment.topCenter,
          child: ListView(
            children:<Widget> [
              Image.asset("assets/planet3.PNG",
              width: 250.0,
                height: 160.0,
              ),
           Container(
             margin: const EdgeInsets.all(3.0),
             alignment: Alignment.center,
             child: Column(
               children: <Widget> [
                 TextField(
                   controller: _controldePeso,
                   keyboardType: TextInputType.number,
                   decoration: InputDecoration(
                     labelText: 'O seu peso na Terra',
                     hintText: 'Kg',
                     icon: Icon(Icons.person_outline),
                   ),
                 ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Radio<int>(
                        activeColor: Colors.pink,
                        value: 0,
                        groupValue: radioValor,
                        onChanged: tomaContaValorRadio ),
                    Text("Pluto"),

                    Radio<int>(
                      activeColor: Colors.brown,
                      value: 1,
                      groupValue: radioValor,
                      onChanged: tomaContaValorRadio,),
                    Text('Marte'),

                    Radio<int>(
                      activeColor: Colors.orangeAccent,
                      value: 2,
                      groupValue: radioValor,
                      onChanged: tomaContaValorRadio,),
                    Text("Vênus"),

                  ],
                ),
                 Text(
                   _controldePeso.text.isEmpty ? "Encira o seu Peso" : _nomePlaneta + "Kg",
                   //"$_nomePlaneta"
                 style: TextStyle(
                   fontSize: 20,
                   fontWeight: FontWeight.w400,
                   color: Colors.white,
                 ),)

               ],
             ),
           )
            ],
          ),
        ),
      ),

    );
  }
  double calcularPesoEmPlaneta(String peso, double gravidadeSuperficial){
   if (int.parse(peso).toString().isNotEmpty &&
   int.parse(peso) > 0){

     return (int.parse(peso)* gravidadeSuperficial);
   }else {
     print("Número errado...");
     return int.parse("180") * 0.38; // retorna um peso padrao

   }

  }
}
