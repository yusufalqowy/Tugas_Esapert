import 'package:dio/dio.dart';
import 'package:my_profile/data/book/data_source/remote/book_api_client.dart';
import 'package:my_profile/data/book/model/book_response.dart';
import 'package:my_profile/data/book/model/detail_book_response.dart';
import 'package:my_profile/data/data_state.dart';
import 'package:my_profile/domain/book/repository/book_repository.dart';

class BookRepositoryImpl implements BookRepository{

  final BookApiClient bookApiClient;

  BookRepositoryImpl({required this.bookApiClient});

  @override
  Future<ResponseData<BookResponse?>> getNewBook() async => bookApiClient.getNewBook();

  @override
  Future<ResponseData<BookResponse?>> searchBook({required String query, required CancelToken cancelToken}) async => bookApiClient.searchBook(query: query, cancelToken: cancelToken);

  @override
  Future<ResponseData<DetailBookResponse?>> detailBook({required String isbn13}) async => await bookApiClient.detailBook(isbn13: isbn13);

}