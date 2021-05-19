import 'package:GIB_EG/screens/welcome_screen/welcome_screen.dart';
import 'package:GIB_EG/utilities/authentication_services.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:GIB_EG/screens/loadingScreen.dart';
import 'package:GIB_EG/Screens/homeScreen.dart';
import 'package:provider/provider.dart';
import 'models/player.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  //UI
  SystemChrome.setEnabledSystemUIOverlays([
    SystemUiOverlay.bottom, //This line is used for showing the bottom bar
  ]);

  runApp(Myapp());
}

class Myapp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
            ChangeNotifierProvider<Player>(
              create: (_) => Player(),
            ),

            Provider<AuthenticationService>(
              create: (_) => AuthenticationService(FirebaseAuth.instance),
            ),

            StreamProvider(
              create: (context) => context.read<AuthenticationService>().authStateChanges,
            ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        routes: {
          '/': (context) => WelcomeScreen(),
          '/loading': (context) => Loading(),
          '/homeScreen': (contex) => HomeScreen(),
        },
      )
    );
  }
}
