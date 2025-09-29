import 'dart:io';

class Environment {
  static String apiUrl    = 'https://maimchat2.onrender.com/api' ;
  static String socketUrl = 'https://maimchat2.onrender.com' ;
}


/*
class Environment {
  static String apiUrl    = Platform.isAndroid ? 'http://10.0.2.2:3000/api' : 'http://192.168.0.4:3000/api' ;
  static String socketUrl = Platform.isAndroid ? 'http://10.0.2.2:3000'     : 'http://192.168.0.4:3000' ;
}
*/