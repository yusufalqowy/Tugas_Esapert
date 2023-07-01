import 'package:dio/dio.dart';
import 'package:get/get.dart';
import 'package:my_profile/data/book/model/book_response.dart';
import 'package:my_profile/data/data_state.dart';
import 'package:my_profile/domain/book/use_case/book_usecase.dart';

class SearchBookController extends GetxController{
  final BookUseCase bookUseCase;

  SearchBookController({required this.bookUseCase});

  Rx<ResponseData<BookResponse?>> searchBookState = Rx(ResponseData.init<BookResponse>());

  void getSearchBooks({required String query, required CancelToken cancelToken}) async {
    searchBookState(ResponseData.loading<BookResponse>());
    update();
    final result = await bookUseCase.searchBook(query: query, cancelToken: cancelToken);
    searchBookState(result);
    update();
  }
}