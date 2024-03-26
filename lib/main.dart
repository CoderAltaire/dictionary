import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'add_words.dart';
import 'all_words.dart';
import 'bloc/get_word/get_word_bloc.dart';
import 'bloc/vocabluary/getvocabluary_bloc.dart';
import 'essetianal.dart';
import 'radn_words.dart';
import 'services/isar_service.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
      options: const FirebaseOptions(
    apiKey: 'AIzaSyCtxrfe9GO4_IriYHy33KF8HE9ZJkK2gZQ',
    appId: '1:1016366162369:android:3d2e033087f78ab4280f40',
    messagingSenderId: '',
    projectId: 'dictionary-fb576',
    storageBucket: '',
  ));
  IsarService().openDB();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => GetWordBloc()..add(GetAllEvent()),
        ),
        BlocProvider(
          create: (context) => GetvocabluaryBloc(),
        ),
      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          textSelectionTheme: const TextSelectionThemeData(
            selectionHandleColor: Colors.transparent,
          ),
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        home: const MyHomePage(title: ''),
      ),
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
  int index = 0;
  static const List<Widget> _widgetOptions = <Widget>[
    AllWordsScreen(),
    RandomWordsScreen(),
    EssetianalPage(),
    AddWordsScreen(),
  ];
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: const Color.fromARGB(255, 7, 67, 116),
          title: Center(
              child: Image.asset(
            'assets/images/everest.png',
            scale: 9,
            color: Colors.white,
          )),
        ),
        body: _widgetOptions.elementAt(index),
        bottomNavigationBar: BottomNavigationBar(
          backgroundColor: const Color.fromARGB(255, 7, 67, 116),
          selectedLabelStyle: GoogleFonts.poppins(
              color: Colors.red, fontWeight: FontWeight.w400, fontSize: 13),
          unselectedLabelStyle: GoogleFonts.poppins(
              color: Colors.red, fontWeight: FontWeight.w400, fontSize: 12),
          items: const <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              backgroundColor: Color.fromARGB(255, 7, 67, 116),
              icon: ImageIcon(
                AssetImage("assets/images/house.png"),
              ),
              label: ("Words"),
            ),
            BottomNavigationBarItem(
              backgroundColor: Color.fromARGB(255, 7, 67, 116),
              icon: ImageIcon(
                AssetImage("assets/images/grid.png"),
              ),
              label: ("Random"),
            ),
            BottomNavigationBarItem(
              backgroundColor: Color.fromARGB(255, 7, 67, 116),
              icon: Icon(Icons.book),
              label: ("Essetianal"),
            ),
            BottomNavigationBarItem(
              backgroundColor: Color.fromARGB(255, 7, 67, 116),
              icon: ImageIcon(
                AssetImage("assets/images/add.png"),
              ),
              label: ("Add"),
            )
          ],
          currentIndex: index,
          onTap: (int i) {
            setState(() {
              index = i;
            });
          },
          unselectedItemColor: Colors.white.withOpacity(0.5),
          fixedColor: Colors.white,
        ),
      ),
    );
  }
}
