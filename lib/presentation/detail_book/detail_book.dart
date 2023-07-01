import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_profile/data/book/data_source/remote/book_api_client_impl.dart';
import 'package:my_profile/data/book/repository/book_repository_impl.dart';
import 'package:my_profile/domain/book/use_case/book_use_case_impl.dart';
import 'package:my_profile/presentation/detail_book/detail_book_controller.dart';
import 'package:my_profile/presentation/utils/AppLayout.dart';

class DetailBookScreen extends StatelessWidget {
  final String isbn13;
  const DetailBookScreen({super.key, required this.isbn13});

  @override
  Widget build(BuildContext context) {
    final DetailBookController controller = DetailBookController(bookUseCase: BookUseCaseImpl(repository: BookRepositoryImpl(bookApiClient: BookApiClientImpl(Dio()))));
    return Scaffold(
      appBar: AppBar(
        title: const Text("Detail Book"),
      ),
      body: SingleChildScrollView(
        child: GetBuilder<DetailBookController>(
          init: controller,
          initState: (state)=>controller.getDetailBook(isbn13: isbn13),
          builder: (controller){
            if(controller.detailBookState.value.status.isSuccess){
              var data = controller.detailBookState.value.data!;
              return Container(
                margin: const EdgeInsets.all(16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Align(child: Image.network(data.image)),
                    const SizedBox(height: 8,),
                    Text(data.price, style: TextStyle(fontSize: 14,fontWeight: FontWeight.bold, color: Theme.of(context).colorScheme.primary),),
                    const SizedBox(height: 8,),
                    Text(data.title, style: const TextStyle(fontSize: 16,fontWeight: FontWeight.bold,),),
                    const SizedBox(height: 8,),
                    Text(data.subtitle.isNotEmpty ? data.subtitle : "-", style: const TextStyle(fontSize: 12,fontWeight: FontWeight.w300,),),
                    const SizedBox(height: 8,),
                    Text("By ${data.authors.isNotEmpty ? data.authors : "-"} | Publisher ${data.publisher.isNotEmpty ? data.publisher : "-"}", style: const TextStyle(fontSize: 12,fontWeight: FontWeight.bold,),),
                    const SizedBox(height: 16,),
                    Card(
                      margin: EdgeInsets.zero,
                      child: Padding(
                        padding: const EdgeInsets.all(16),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Column(
                              children: [
                                Text(data.pages, style: const TextStyle(fontSize: 16,fontWeight: FontWeight.bold,),),
                                const Text("Pages", style: TextStyle(fontSize: 12,fontWeight: FontWeight.w300,),),
                              ],
                            ),
                            Column(
                              children: [
                                Row(
                                  children: [
                                    const Icon(Icons.star, color: Colors.yellow,size: 16,),
                                    Text(data.rating, style: const TextStyle(fontSize: 16,fontWeight: FontWeight.bold,),)
                                  ],
                                ),
                                const Text("Rating", style: TextStyle(fontSize: 12,fontWeight: FontWeight.w300,),),
                              ],
                            ),
                            Column(
                              children: [
                                Text(data.year, style: const TextStyle(fontSize: 16,fontWeight: FontWeight.bold,),),
                                const Text("Year", style: TextStyle(fontSize: 12,fontWeight: FontWeight.w300,),),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                    const SizedBox(height: 16,),
                    const Text("Description", style: TextStyle(fontSize: 16,fontWeight: FontWeight.bold,),),
                    const SizedBox(height: 8,),
                    Text(data.desc, style: const TextStyle(fontSize: 12,fontWeight: FontWeight.w300,),textAlign: TextAlign.justify,),
                  ],
                ),
              );
            }else if(controller.detailBookState.value.status.isError){
              return Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset("assets/image/ic_error.png"),
                    const SizedBox(height: 8,),
                    const Text("Something went wrong!", style: TextStyle(fontSize: 21, fontWeight: FontWeight.bold),)
                  ],
                ),
              );
            }else{
              return SizedBox(
                height: AppLayout.getSize(context).height,
                width: AppLayout.getSize(context).width,
                child: const Center(
                  child: CircularProgressIndicator(),
                ),
              );
            }

          },
        ),
      ),
    );
  }
}
