import 'package:flutter/material.dart';
import 'package:note_app/di/provider_setup.dart';
import 'package:note_app/presentation/notes/notes_screen.dart';
import 'package:note_app/ui/colors.dart';
import 'package:provider/provider.dart';

void main() async{
  // 플랫폼 채널의 위젯 바인딩 보장
  WidgetsFlutterBinding.ensureInitialized();

  final providers = await getProviders();

  runApp(
    MultiProvider(
      providers: providers,
      child: const MyApp(),
    )
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: Colors.white,
        canvasColor: darkGray,
        colorScheme: const ColorScheme.dark(background: darkGray),
        useMaterial3: true,
        floatingActionButtonTheme: Theme.of(context).floatingActionButtonTheme.copyWith(
          backgroundColor: Colors.white,
          foregroundColor: darkGray,
          shape: const CircleBorder()
        ),
        appBarTheme: Theme.of(context).appBarTheme.copyWith(
          backgroundColor: darkGray,
        ),
      ),
      home: const NotesScreen(),
    );
  }
}

