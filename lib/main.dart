import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:realtimechat/services/auth_service.dart';
import 'package:realtimechat/services/chat_service.dart';
import 'package:realtimechat/services/socket_service.dart';

import 'package:realtimechat/routes/routes.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: ( _ ) => AuthService()),
        ChangeNotifierProvider(create: ( _ ) => SocketService()),
        ChangeNotifierProvider(create: ( _ ) => ChatService()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'MaimChat',
        initialRoute: 'loading', // 'login',
        routes: appRoutes,
      ),
    );
  }
}