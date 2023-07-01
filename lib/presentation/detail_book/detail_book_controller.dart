import 'package:get/get.dart';
import 'package:my_profile/data/book/model/detail_book_response.dart';
import 'package:my_profile/data/data_state.dart';
import 'package:my_profile/domain/book/use_case/book_usecase.dart';

class DetailBookController extends GetxController{
  final BookUseCase bookUseCase;

  DetailBookController({required this.bookUseCase});

  Rx<ResponseData<DetailBookResponse?>> detailBookState = Rx(ResponseData.init<DetailBookResponse>());

  void getDetailBook({required String isbn13}) async {
    detailBookState(ResponseData.loading<DetailBookResponse>());
    update();
    final result = await bookUseCase.detailBook(isbn13: isbn13);
    detailBookState(result);
    update();
  }


}