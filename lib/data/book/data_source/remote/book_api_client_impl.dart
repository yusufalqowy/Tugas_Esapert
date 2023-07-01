import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:my_profile/data/book/data_source/remote/book_api_client.dart';
import 'package:my_profile/data/book/model/book_response.dart';
import 'package:my_profile/data/book/model/detail_book_response.dart';
import 'package:my_profile/data/data_state.dart';

class BookApiClientImpl implements BookApiClient{
  final Dio client;
  const BookApiClientImpl(this.client);
  
  @override
  Future<ResponseData<BookResponse?>> getNewBook() async {
    try{
      final result = await client.get("https://api.itbook.store/1.0/new");
      if(result.statusCode == 200){
        return ResponseData(status: ResponseDataStatus.success, data: BookResponse.fromJson(result.data));
      }else{
        return ResponseData(status: ResponseDataStatus.error, message: BookResponse.fromJson(result.data).error);
      }
    }catch(e, stacktrace){
      log('Error on BookRemoteDatasource ${e.toString()}: $stacktrace');
      return ResponseData(status: ResponseDataStatus.error, message: e.toString());
    }

  }

  @override
  Future<ResponseData<BookResponse?>> searchBook({required String query, required CancelToken cancelToken}) async {
    try{
      final result = await client.get("https://api.itbook.store/1.0/search/${Uri.encodeQueryComponent(query)}", cancelToken: cancelToken);
      if(result.statusCode == 200){
        return ResponseData(status: ResponseDataStatus.success, data: BookResponse.fromJson(result.data));
      }else{
        return ResponseData(status: ResponseDataStatus.error, message: BookResponse.fromJson(result.data).error);
      }
    }catch(e, stacktrace){
      log('Error on BookRemoteDatasource ${e.toString()}: $stacktrace');
      return ResponseData(status: ResponseDataStatus.error, message: e.toString());
    }
  }

  @override
  Future<ResponseData<DetailBookResponse?>> detailBook({required String isbn13}) async {
    try{
      final result = await client.get("https://api.itbook.store/1.0/books/$isbn13");
      if(result.statusCode == 200){
        return ResponseData(status: ResponseDataStatus.success, data: DetailBookResponse.fromJson(result.data));
      }else{
        return ResponseData(status: ResponseDataStatus.error, message: DetailBookResponse.fromJson(result.data).error);
      }
    }catch(e, stacktrace){
      log('Error on BookRemoteDatasource ${e.toString()}: $stacktrace');
      return ResponseData(status: ResponseDataStatus.error, message: e.toString());
    }
  }

}