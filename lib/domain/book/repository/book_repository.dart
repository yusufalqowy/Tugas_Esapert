import 'package:dio/dio.dart';
import 'package:my_profile/data/book/model/book_response.dart';
import 'package:my_profile/data/book/model/detail_book_response.dart';
import 'package:my_profile/data/data_state.dart';

abstract class BookRepository {
  Future<ResponseData<BookResponse?>> getNewBook();

  Future<ResponseData<BookResponse?>> searchBook({required String query, required CancelToken cancelToken});

  Future<ResponseData<DetailBookResponse?>> detailBook({required String isbn13});

}
