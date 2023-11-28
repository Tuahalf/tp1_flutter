import 'package:flutter/material.dart';
import 'package:flutter_application_1/my_flutter_app_icons.dart';
import 'package:json_theme/json_theme.dart';
import 'package:flutter/services.dart';
import 'dart:convert';

import 'package:flutter_application_1/screens/accueil.dart';
import 'package:flutter_application_1/screens/nextPage.dart';
import 'package:flutter_application_1/screens/parametre.dart';
Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  final themeStr = await rootBundle.loadString('assets/appainter_theme.json');

  final themeJson = jsonDecode(themeStr);

  final theme = ThemeDecoder.decodeThemeData(themeJson)!;

  runApp(MyApp(theme : theme));
}




class MyApp extends StatelessWidget {
  final ThemeData theme;

  const MyApp({Key? key, required this.theme}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      //theme: ThemeData(primarySwatch: Colors.indigo,),
      theme: theme,

      home: const MyHomePage(title: 'Flutter'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});


  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  
  int currentPageIndex = 0;
 
 _getDrawerItemWidget(int pos) {
      switch (pos) {
      case 0:
      return new Accueil();  //Nom de votre StatefulWidget dans votre fichier Acceuil

      case 1:
      return new NextPage(ouiIlLeFaut: 20 );

      case 2:
      return new ParamBody();

      default:
      return new Text('Erreur de page');
      }
      }
    @override
    void initState() {
    super.initState();
    }


  @override
  Widget build(BuildContext context) {
    return Column(
      children: [

          AppBar(
            backgroundColor: Theme.of(context).colorScheme.inversePrimary,
            title: Text(widget.title),
          ),
          
                Expanded(
          child: Scaffold(
              body: _getDrawerItemWidget(currentPageIndex),
            ),
          ),


          NavigationBar(
            onDestinationSelected: (int index) {
              setState(() {
              currentPageIndex = index;
            });
            },
        selectedIndex: currentPageIndex,
            destinations: const <Widget>[
              NavigationDestination(

                icon: Icon(MyFlutterApp.home),
                label: 'Accueil',
              ),
              NavigationDestination(
                icon: Icon(MyFlutterApp.right_open),
                label: 'Page suivante',
              ),
              NavigationDestination(
                icon: Icon(MyFlutterApp.wrench),
                label: 'Parametre',
              ),
            ],
          ),
      ],
    );
  }
}
