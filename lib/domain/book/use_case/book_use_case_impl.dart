import 'package:dio/dio.dart';
import 'package:my_profile/data/book/model/book_response.dart';
import 'package:my_profile/data/book/model/detail_book_response.dart';
import 'package:my_profile/data/data_state.dart';
import 'package:my_profile/domain/book/repository/book_repository.dart';
import 'package:my_profile/domain/book/use_case/book_usecase.dart';

class BookUseCaseImpl implements BookUseCase{
  final BookRepository repository;

  const BookUseCaseImpl({required this.repository});

  @override
  Future<ResponseData<BookResponse?>> getNewBook() async {
    return await repository.getNewBook();
  }

  @override
  Future<ResponseData<BookResponse?>> searchBook({required String query, required CancelToken cancelToken}) async => await repository.searchBook(query: query, cancelToken: cancelToken);

  @override
  Future<ResponseData<DetailBookResponse?>> detailBook({required String isbn13}) async => await repository.detailBook(isbn13: isbn13);
}