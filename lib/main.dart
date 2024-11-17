import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:recipes/firebase_options.dart';
import 'package:recipes/provider/favorite_provider.dart';
import 'package:recipes/navigaton_bar_screen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:recipes/provider/quantity.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => FavoriteProvider()),
        ChangeNotifierProvider(create: (_) => QuantityProvider()),
      ],
      child: const MaterialApp(
        debugShowCheckedModeBanner: false,
        home: NavigationBarScreen(),
      ),
    );
  }
}
