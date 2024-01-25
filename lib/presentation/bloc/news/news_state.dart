

import '../../../data/models/news_model.dart';
import '../../../main.dart';

class NewsState {}

class NewsInitial extends NewsState {}

class NewsLoading extends NewsState {}

class NewsLoaded extends NewsState {
  final List<News> newsList;

  NewsLoaded({required this.newsList});
}

class NewsError extends NewsState {}