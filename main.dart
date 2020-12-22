
import 'package:flutter/material.dart';
import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:intl/intl.dart';


//https://earthquake.usgs.gov/earthquakes/feed/v1.0/summary/all_hour.geojson

Map _dados;
List _features;

void main() async {
 // Intl.defaultLocale = 'pt_BR';
  _dados = await pegaTerramoto();
  _features = _dados['features'];
  runApp(new MaterialApp(
    home: Terramoto(),
  ));
}

class Terramoto extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: AppBar(
        title: Text('Earthquakes'),
        centerTitle: true,
        backgroundColor: Colors.red,

      ),
      body: Center(
        child: ListView.builder(
            itemCount: _features.length,
            padding: const EdgeInsets.all(15.5),
            itemBuilder: (BuildContext context, int posicao){

              var format = new DateFormat.yMMMMd("en_US").add_jm();
              var data = format.format(new DateTime.fromMicrosecondsSinceEpoch(
                  _features[posicao]['properties']['time'] * 1000
              ));
              return Column(
                children: <Widget>[
                  Divider(height: 5.5,),
                  ListTile(
                    title: Text("$data",
                    style: TextStyle(
                      fontSize: 15.5,
                      color: Colors.orange,
                      fontWeight: FontWeight.w500
                    ),),
                    subtitle: Text(
                        "${_features[posicao]['properties']['place']}",
                    style: TextStyle(
                      fontSize: 14.5,
                      fontWeight: FontWeight.normal,
                      color: Colors.black,
                      fontStyle: FontStyle.italic
                    ),),
                    leading: CircleAvatar(
                      backgroundColor: Colors.greenAccent,
                      child: Text("${ _features[posicao]['properties']['mag']}",
                      style: TextStyle(
                        fontSize: 16.5,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                        fontStyle: FontStyle.normal
                      ),),
                    ),

                    onTap: () {
                      mostrarMensagem(context,"${_features[posicao]['properties']['title']}");
                    },

                  ),
                ],
              );
            }

        ),

      ),
    );
  }

  void mostrarMensagem(BuildContext context, String mensagem) {
    var alert = new AlertDialog(
      title: Text('Earthquakes'),
      content: Text(mensagem),
      actions: [
        FlatButton(onPressed: () => Navigator.pop(context),
        child: Text('OK'),)
      ],
    );
  showDialog(context: context, builder: (_){
    return alert;
  });
  }

}

Future<Map> pegaTerramoto () async {
  String url = 'https://earthquake.usgs.gov/earthquakes/feed/v1.0/summary/all_hour.geojson';
  http.Response response = await http.get(url);

  return json.decode(response.body);

}