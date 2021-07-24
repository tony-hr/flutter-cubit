import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:test_tony/config/config.dart';
import 'package:test_tony/models/news.dart';
import 'package:test_tony/services/dioClient.dart';
import 'package:test_tony/services/networkExceptions.dart';

part 'news_state.dart';

class NewsCubit extends Cubit<NewsState> {
  NewsCubit() : super(NewsInitial());

  Future<void> getNewsList(String idStatus) async {
    emit(LoadingNews());

    try {
      final response = await DioClient().get("/v2/top-headlines?country=$idStatus&apiKey=${Url.API_KEY}");
      print("status code ${response.data["articles"]}");

      switch(response.statusCode){
        case 200:
          if(response.data["totalResults"] > 0){
            final newsList = newsFromJson(response.data["articles"]);
            emit(SuccessNews(newsList));
          }else{
            emit(FailureNews("Berita Kosong", "Tidak ada berita untuk negara ini"));
          }
          break;
        default:
          emit(FailureNews("Terjadi Kesalahan", response.data["message"]));
          break;
      }
    } catch (e) {
      print("error catch: $e");
      final exception = NetworkExceptions.getDioException(e);
      emit(ErrorNews(NetworkExceptions.getErrorMessage(exception)));
    }
  }
}