import 'package:dio/dio.dart';
import 'package:get/get.dart';
import 'package:my_profile/data/book/model/book_response.dart';
import 'package:my_profile/data/data_state.dart';
import 'package:my_profile/domain/book/use_case/book_usecase.dart';

class HomeController extends GetxController {
  final BookUseCase bookUseCase;

  HomeController({required this.bookUseCase});

  Rx<ResponseData<BookResponse?>> newBookState = Rx(ResponseData.init<BookResponse>());

  Rx<ResponseData<BookResponse?>> searchBookState = Rx(ResponseData.init<BookResponse>());

  void getNewBooks() async {
    newBookState(ResponseData.loading<BookResponse>());
    update();
    final result = await bookUseCase.getNewBook();
    newBookState(result);
    update();
  }

  void getSearchBooks({required String query, required CancelToken cancelToken}) async {
    searchBookState(ResponseData.loading<BookResponse>());
    update();
    final result = await bookUseCase.searchBook(query: query, cancelToken: cancelToken);
    searchBookState(result);
    update();
  }
}
