import 'package:bloc/bloc.dart';
import '../../data/repository/news_repository.dart';
import 'news_event.dart';
import 'news_state.dart';


class NewsBloc extends Bloc<NewsEvent, NewsState> {
  final NewsRepository newsRepository;

  NewsBloc(this.newsRepository) : super(NewsInitial()) {
    on<FetchNewsEvent>((event, emit) async {
      emit(NewsLoading());
      try {
        final newsList = await newsRepository.fetchNews();
        emit(NewsLoaded(newsList: newsList));
      } catch (e) {
        emit(NewsError());
      }
    });
  }
  @override
  Stream<NewsState> mapEventToState(NewsEvent event) async* {
    if (event is FetchNewsEvent) {
      yield NewsLoading();
      try {
        final newsList = await newsRepository.fetchNews();
        yield NewsLoaded(newsList: newsList);
      } catch (e) {
        yield NewsError();
      }
    }
  }
}
