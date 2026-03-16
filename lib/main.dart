import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gozie_williams_portfolio/screens/portfolio/portfolio_screen.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Gozie Williams Portfolio',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: const Color(0xFF6D6AFD)),
        scaffoldBackgroundColor: const Color(0xFF0D1025),
        useMaterial3: true,
      ),
      scrollBehavior: const CupertinoScrollBehavior(),
      home: const PortfolioScreen(),
    );
  }
}
