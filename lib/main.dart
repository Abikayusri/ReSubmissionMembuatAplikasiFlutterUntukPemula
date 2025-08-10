import 'package:flutter/material.dart';

import 'model/movie_list.dart';
import 'presentation/detail/movie_detail_screen.dart';
import 'presentation/home/home_screen.dart';
import 'presentation/login/login_screen.dart';
import 'presentation/register/register_screen.dart';
import 'static/navigation_route.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // TRY THIS: Try running your application with "flutter run". You'll see
        // the application has a purple toolbar. Then, without quitting the app,
        // try changing the seedColor in the colorScheme below to Colors.green
        // and then invoke "hot reload" (save your changes or press the "hot
        // reload" button in a Flutter-supported IDE, or press "r" if you used
        // the command line to start the app).
        //
        // Notice that the counter didn't reset back to zero; the application
        // state is not lost during the reload. To reset the state, use hot
        // restart instead.
        //
        // This works for code too, not just values: Most code changes can be
        // tested with just a hot reload.
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      ),
      initialRoute: NavigationRoute.loginRoute.name,
      routes: {
        NavigationRoute.loginRoute.name: (context) => const LoginScreen(),
        NavigationRoute.registerRoute.name: (context) => const RegisterScreen(),
        NavigationRoute.homeRoute.name: (context) => HomeScreen(
          username: ModalRoute.of(context)?.settings.arguments as String,
        ),
        NavigationRoute.detailRoute.name: (context) => MovieDetailScreen(
          movie: ModalRoute.of(context)?.settings.arguments as MovieModel,
        ),
      },
    );
  }
}
