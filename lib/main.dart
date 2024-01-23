
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_api_integration_bloc_demo/presentation/pages/news_page.dart';
import 'bloc/news_bloc.dart';
import 'data/repository/news_repository.dart';

void main() {
  runApp(const MyApp());
}
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'News App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: BlocProvider(
        create: (context) => NewsBloc(NewsRepository()),
        child: const NewsPage(),
      ),
    );
  }
}









