import 'package:auto_height_grid_view/auto_height_grid_view.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_profile/data/data_state.dart';
import 'package:my_profile/presentation/component/book_item.dart';
import 'package:my_profile/presentation/component/book_skeleton.dart';
import 'package:my_profile/presentation/search_book/search_book_controller.dart';
import 'package:my_profile/presentation/utils/AppLayout.dart';

class SearchBookScreen <C extends SearchBookController> extends GetView<C> {
  const SearchBookScreen({super.key});

  @override
  Widget build(BuildContext context) {
    CancelToken cancelToken = CancelToken();

    void handleSearch(String text) async {
      Future.delayed(400.milliseconds,(){
        cancelToken.cancel();
        cancelToken = CancelToken();
        controller.getSearchBooks(query: text, cancelToken: cancelToken);
      });
    }

    return Scaffold(
      appBar: AppBar(
        title: const Text("Search"),
      ),
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            automaticallyImplyLeading: false,
            floating: true,
            title: TextField(
              decoration: InputDecoration(
                contentPadding: EdgeInsets.zero,
                labelStyle: const TextStyle(fontSize: 14),
                border: OutlineInputBorder(borderRadius: BorderRadius.circular(8)),
                floatingLabelBehavior: FloatingLabelBehavior.never,
                prefixIcon: const Icon(Icons.search),
                hintText: "Search book here",
              ),
              textInputAction: TextInputAction.search,
              onChanged: (text){
                if(text.isNotEmpty){
                  handleSearch(text);
                }else{
                  controller.searchBookState(ResponseData.init());
                }
              },
            ),
          ),
          SliverFillRemaining(
            child: GetBuilder<SearchBookController>(
                init: controller,
                builder: (controller){
                  if (controller.searchBookState.value.status.isSuccess) {
                    var data = controller.searchBookState.value.data;
                    var count = data?.books?.length ?? 0;
                    if(count > 0){
                      return AutoHeightGridView(
                          shrinkWrap: true,
                          crossAxisCount: 2,
                          crossAxisSpacing: 8,
                          mainAxisSpacing: 8,
                          padding: const EdgeInsets.all(16),
                          itemCount: count,
                          builder: (ctx, index) {
                            final book = data?.books![index];
                            return BookItem(bookItem: book!);
                          });
                    }else{
                      return Center(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Image.asset("assets/image/ic_nothing_found.png"),
                            const SizedBox(height: 8,),
                            const Text("Books not found!", style: TextStyle(fontSize: 21, fontWeight: FontWeight.bold),)
                          ],
                        ),
                      );
                    }
                  }else if(controller.searchBookState.value.status == ResponseDataStatus.init){
                    return Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Image.asset("assets/image/ic_books.png"),
                          const SizedBox(height: 8,),
                          const Text("Let's find your books!", style: TextStyle(fontSize: 21, fontWeight: FontWeight.bold),)
                        ],
                      ),
                    );
                  }else{
                    return AutoHeightGridView(
                        shrinkWrap: true,
                        crossAxisCount: 2,
                        crossAxisSpacing: 8,
                        mainAxisSpacing: 8,
                        padding: const EdgeInsets.all(16),
                        itemCount: 4,
                        builder: (ctx, index) {
                          return BookSkeleton(height: AppLayout.getHeight(320),);
                        });
                  }
                }
            ),
          )
        ],
      ),
    );
  }


}
