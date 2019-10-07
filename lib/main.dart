import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter/material.dart';
import 'package:prodesys_mobi/src/models/user_repository.dart';
import 'package:prodesys_mobi/src/screens/home_screen.dart';
import 'package:prodesys_mobi/src/screens/login_screen.dart';
import 'package:prodesys_mobi/src/screens/signup_screen.dart';
import 'package:provider/provider.dart';


void main() => runApp(MyApp());


class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
            localizationsDelegates: [
              GlobalMaterialLocalizations.delegate,
              GlobalWidgetsLocalizations.delegate
            ],
            supportedLocales: [
              const Locale('pt', 'BR')
            ],
            key: Key('materialapp'),
            debugShowCheckedModeBanner: false,
            theme: ThemeData(
              primaryColor: Colors.blue[800],
              accentColor: Colors.blueGrey[300],
            ),
      home: HomeScreen(),
    );
  }
}



class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      builder: (_) => UserRepository.instance(),
      child: Consumer(
        builder: (context, UserRepository user, _) {
          switch (user.status) {
            case Status.Uninitialized:
              return Splash();
            case Status.Unauthenticated:
            case Status.Authenticating:
              return LoginPage();
            case Status.Authenticated:
              return HomePage();
            case Status.NewUser:
            case Status.Registering:
            case Status.Unregistred:
              return SignUpScreen();
          }
        },
      ),
    );
  }
}



class Splash extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Material(
      child: Center(
        child: Text("Aguarde ..."),
      ),
    );
  }
}





