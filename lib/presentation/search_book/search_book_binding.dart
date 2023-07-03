import 'package:dio/dio.dart';
import 'package:get/get.dart';
import 'package:my_profile/data/book/data_source/remote/book_api_client.dart';
import 'package:my_profile/data/book/data_source/remote/book_api_client_impl.dart';
import 'package:my_profile/data/book/repository/book_repository_impl.dart';
import 'package:my_profile/domain/book/repository/book_repository.dart';
import 'package:my_profile/domain/book/use_case/book_use_case_impl.dart';
import 'package:my_profile/domain/book/use_case/book_usecase.dart';
import 'package:my_profile/presentation/search_book/search_book_controller.dart';

class SearchBookBinding implements Bindings{
  @override
  void dependencies() {
    Get.lazyPut<Dio>(() => Dio());
    Get.lazyPut<BookApiClient>(() => BookApiClientImpl(client: Get.find<Dio>()));
    Get.lazyPut<BookRepository>(() => BookRepositoryImpl(bookApiClient: Get.find<BookApiClient>()));
    Get.lazyPut<BookUseCase>(() => BookUseCaseImpl(repository: Get.find<BookRepository>()));
    Get.put(SearchBookController(bookUseCase: Get.find<BookUseCase>()));
  }

}