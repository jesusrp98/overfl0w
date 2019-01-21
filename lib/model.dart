import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:scoped_model/scoped_model.dart';

import 'profile.dart';

class ProfileModel extends Model {
  // Variable que controla si todavia estamos cargando la informacion
  bool _loading = true;
  Profile _profile;

  Future loadData() async {
    // Realizamos la llamada al servicio
    final response = await http.get(
      'https://ow-api.com/v1/stats/pc/eu/SilveR-24635/profile',
    );

    // Convertimos la llamada previamente realizada en un json
    // Creamos un objeto Profile a partir de un json, el cual tendremos que parsear
    _profile = Profile.fromJson(json.decode(response.body));

    // terminamos de cargar los jueguecitos esos
    loadingState(false);
  }

  bool get isLoading => _loading;

  Profile get profile => _profile;

  void loadingState(bool state) {
    _loading = state;
    notifyListeners();
  }
}

// Hijo apaga la maquinita
// Mamá que no puedo pausarla que es online
// Pues diles a los otros que se esperen
