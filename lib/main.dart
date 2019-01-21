import 'package:flutter/material.dart';

import 'model.dart';

// Funcion main: lo unico que hace es llamar a la funcion run app
// Como solo llama a una cosa, podemos poner una flechita
// Seria lo mismo poner:
// void main() {
//   runApp(MyApp());
// }
void main() => runApp(MyApp());

// La clase MyApp es un widget estatico
class MyApp extends StatelessWidget {
  // Sobreescribimos la funcion de construccion de la superclase
  @override
  Widget build(BuildContext context) {
    // Retornamos una aplicacion 'material'
    // Constructor parametrizado: titulo, tema, y home
    return MaterialApp(
      title: 'Project: Overfl0w',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(),
    );
  }
}

// Clase Home page, widget dinamico, tiene un estado
class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

// Esta clase representa el estado del widget dinamico superior
class _MyHomePageState extends State<MyHomePage> {
  // Variable donde guardamos el modelos con todos los juegos
  ProfileModel _model;

  // Cuando se crea esta clase, hacemos esto
  @override
  void initState() {
    _model = ProfileModel();
    _model.loadData().then((_) => setState(() {}));
    super.initState();
  }

  // Sobreescribimos la funcion de construccion de la superclase
  @override
  Widget build(BuildContext context) {
    // Creamos una ventana en si, una pantalla
    return Scaffold(
      // Appbar es la barra azul
      appBar: AppBar(
        // Tiene como parametro un texto constante
        title: const Text('Project: Pepper'),
      ),
      // Cuerpo de la ventana
      // Si el modelo todavia esta cargando, generamos un widget que lo refleje
      // Si no, creamos una lista
      body: _model.isLoading
          ? Center(child: CircularProgressIndicator())
          // Este objeto a continuacion es una columna de otros objetos,
          // donde se mostraran todos los detalles del perfil de Rafa.
          : ListView(
              children: <Widget>[
                Text(_model.profile.name),
                Text(_model.profile.wins.toString()),
                Text(_model.profile.level.toString()),
                Text(_model.profile.prestige.toString()),
                Text(_model.profile.rating.toString()),
                Image.network(_model.profile.profileIcon),
                Image.network(_model.profile.prestigeIcon),
                Image.network(_model.profile.ratingIcon),
              ],
            ),
    );
  }
}
