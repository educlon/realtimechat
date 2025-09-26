import 'package:http/http.dart' as http;


import 'package:realtimechat/models/usuario.dart';
import 'package:realtimechat/models/usuarios_response.dart';
import 'package:realtimechat/services/auth_service.dart';

import 'package:realtimechat/global/environment.dart';


class UsuariosService {

  Future<List<Usuario>?> getUsuarios() async {
    String? token = await AuthService.getToken();
    try {
      final uri = Uri.parse('${ Environment.apiUrl }/usuarios'); // Solucion error String Uri
      final resp = await http.get(uri,
        headers: {
          'Content-Type': 'application/json',
          'x-token': token.toString()
        }
      );

      final usuariosResponse = usuariosResponseFromJson( resp.body );

      return usuariosResponse.usuarios;

    } catch (e) {
      return [];
    }

  }


}