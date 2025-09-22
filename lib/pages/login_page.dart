import 'package:realtimechat/widgets/boton_azul.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:realtimechat/services/auth_service.dart';

import 'package:realtimechat/helpers/mostrar_alerta.dart';

import 'package:realtimechat/widgets/labels.dart';
import 'package:realtimechat/widgets/logo.dart';
import 'package:realtimechat/widgets/custom_input.dart';

//import 'package:realtimechat/global/environment.dart';

class LoginPage extends StatelessWidget {

  const LoginPage({super.key}); // Lo puse yo

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffF2F2F2),
      body: SafeArea(
        child: SingleChildScrollView(
          physics: BouncingScrollPhysics(),
          child: Container(
            height: MediaQuery.of(context).size.height * 0.9,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                
                Logo(titulo: 'MaimChat v2'),
            
                _Form(),
            
                Labels(
                  ruta: 'register',
                  titulo: '¿No tienes cuenta?',
                  subtitulo: 'Crea una ahora!',
                ),
            
                Text('Términos y condiciones de uso', style: TextStyle(fontWeight: FontWeight.w200))
            
              ],
            ),
          ),
        ),
      ),
   );
  }
}

class _Form extends StatefulWidget {

  @override
  State<_Form> createState() => __FormState();
}

class __FormState extends State<_Form> {

  final emailCtrl = TextEditingController();
  final passCtrl  = TextEditingController();

  @override
  Widget build(BuildContext context) {

    final authService = Provider.of<AuthService>( context );

    return Container(
      margin: EdgeInsets.only(top: 40),
      padding: EdgeInsets.symmetric(horizontal: 50),
      child: Column(
        children: <Widget>[
        
          CustomInput(
            icon: Icons.mail_outline,
            placeholder: 'Correo',
            keyboardType: TextInputType.emailAddress,
            textController: emailCtrl,
          ),

          CustomInput(
            icon: Icons.lock_outline,
            placeholder: 'Contraseña',
            textController: passCtrl,
            isPassword: true,
          ),

          BotonAzul(
            text: 'Ingrese',
            onPressed: authService.autenticando ? null : () async {
              //print(emailCtrl.text);
              //print(passCtrl.text);
              //print(Environment.apiUrl);

              FocusScope.of(context).unfocus();

              final loginOk = await authService.login(emailCtrl.text.trim(), passCtrl.text.trim());

              if ( loginOk ) {
                // TODO: Conectar a nuestro socket server
                Navigator.pushReplacementNamed(context, 'usuarios');
              } else {
                mostrarAlerta(context, 'Login incorrecto', 'Revise sus credenciales nuevamente');
              }

            },
          ),

        ],
      ),
    );
  }
}
