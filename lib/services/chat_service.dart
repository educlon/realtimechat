import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import 'package:realtimechat/global/environment.dart';
import 'package:realtimechat/models/mensajes_response.dart';
import 'package:realtimechat/models/usuario.dart';
import 'package:realtimechat/services/auth_service.dart';


class ChatService with ChangeNotifier {

  late Usuario usuarioPara;

  Future<List<Mensaje>> getChat( String usuarioId ) async {

    final uri = Uri.parse('${ Environment.apiUrl }/mensajes/$usuarioId');
    String? token = await AuthService.getToken();

    final resp = await http.get(uri,
      headers: {
        'Content-Type': 'application/json',
        'x-token': token.toString()
      }
    );

    final mensajesResp = mensajesResponseFromJson(resp.body);

    return mensajesResp.mensajes;

  }


}
