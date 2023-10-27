import 'package:flutter/material.dart';
import '../about.dart';
import '../age.dart';
import '../gender.dart';
import '../news.dart';
import '../university.dart';
import '../weather.dart';
import '../principal.dart';


void main() {
  runApp(const SidebarApp());
}

class SidebarApp extends StatelessWidget {
  const SidebarApp({Key? key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Coteau App', 
    
      theme: ThemeData(
         scaffoldBackgroundColor: const Color.fromARGB(244, 255, 255, 255),
        colorScheme:
        ColorScheme.fromSeed(seedColor:const Color.fromARGB(244, 217, 101, 136), ),
      useMaterial3: true
      ),
      home: const MainScreen(),
    );
  }
}

class MainScreen extends StatefulWidget {
  const MainScreen({Key? key});

  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int indexNavegation = 0;

  final pages = <Widget>[
    const PrincipalScreen(),
    GenderScreen(personName: '',),
    const AgeScreen(),
    const UniversityScreen(),
    const WeatherScreen(),
   const  NewsScreen(),
    AboutScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Coteau', style: TextStyle(color: Colors.white),)
        ,
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            const DrawerHeader(
              decoration: BoxDecoration(
                color: Color.fromARGB( 244, 217, 101, 136),
                image: DecorationImage(
                  fit: BoxFit.fill,
                  image: AssetImage('assets/images/fondo.jpg'),
                ),
              ),
              child: Text(
                'Coteau App',
                style: TextStyle(color: Color.fromARGB(244, 163, 49, 83), fontSize: 25),
              ),
            ),
            ListTile(
              leading: const Icon(Icons.home),
              title: const Text('Inicio'),
              onTap: () {
                setState(() {
                  indexNavegation = 0;
                });
                Navigator.pop(context);
              },
            ),
            ListTile(
              leading: const Icon(Icons.female_sharp),
              title: const Text('Gender Prediction'),
              onTap: () {
                setState(() {
                  indexNavegation = 1;
                });
                Navigator.pop(context);
              },
            ),
            ListTile(
              leading: const Icon(Icons.numbers),
              title: const Text('Age Prediction'),
              onTap: () {
                setState(() {
                  indexNavegation = 2;
                });
                Navigator.pop(context);
              },
            ),
            ListTile(
              leading: const Icon(Icons.pages),
              title: const Text('Colleges'),
              onTap: () {
                setState(() {
                  indexNavegation = 3;
                });
                Navigator.pop(context);
              },
            ),
            ListTile(
              leading: const Icon(Icons.sunny),
              title: const Text('Weather'),
              onTap: () {
                setState(() {
                  indexNavegation = 4;
                });
                Navigator.pop(context);
              },
            ),
            ListTile(
              leading: const Icon(Icons.newspaper_rounded),
              title: const Text('News'),
              onTap: () {
                setState(() {
                  indexNavegation = 5;
                });
                Navigator.pop(context);
              },
            ),
            ListTile(
              leading: const Icon(Icons.assignment_ind_rounded),
              title: const Text('About Me'),
              onTap: () {
                setState(() {
                  indexNavegation = 6;
                });
                Navigator.pop(context);
              },
            ),
          ],
        ),
      ),
      body: IndexedStack(
        index: indexNavegation,
        children: pages,
      ),
    );
  }
}
