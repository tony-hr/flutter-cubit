part of 'news_cubit.dart';

abstract class NewsState extends Equatable {
  const NewsState();

  @override
  List<Object> get props => [];
}

class NewsInitial extends NewsState {}

class LoadingNews extends NewsState {}

class FailureNews extends NewsState {
  final String errorStatus;
  final String errorMessage;
  FailureNews(this.errorStatus, this.errorMessage);

  @override
  List<Object> get props => [errorMessage];
}

class ErrorNews extends NewsState {
  final String errorMessage;
  ErrorNews(this.errorMessage);

  @override
  List<Object> get props => [errorMessage];
}

class SuccessNews extends NewsState {
  final List news;
  SuccessNews(this.news);

  @override
  List<Object> get props => [news];
}
