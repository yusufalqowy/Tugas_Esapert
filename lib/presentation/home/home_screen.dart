import 'package:auto_height_grid_view/auto_height_grid_view.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_profile/data/book/data_source/remote/book_api_client_impl.dart';
import 'package:my_profile/data/book/repository/book_repository_impl.dart';
import 'package:my_profile/data/data_state.dart';
import 'package:my_profile/domain/book/use_case/book_use_case_impl.dart';
import 'package:my_profile/presentation/component/book_item.dart';
import 'package:my_profile/presentation/component/book_skeleton.dart';
import 'package:my_profile/presentation/component/skeleton.dart';
import 'package:my_profile/presentation/home/home_controller.dart';
import 'package:my_profile/presentation/search_book/search_book.dart';
import 'package:my_profile/presentation/utils/AppLayout.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    final HomeController controller = HomeController(bookUseCase: BookUseCaseImpl(repository: BookRepositoryImpl(bookApiClient: BookApiClientImpl(Dio()))));
    return Scaffold(
      appBar: AppBar(
        title: const Text("Hei, Yusuf"),
        automaticallyImplyLeading: false,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Card(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                  side: BorderSide(color: Theme.of(context).dividerColor)),
              margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
              clipBehavior: Clip.antiAliasWithSaveLayer,
              child: InkWell(
                onTap: ()=>Get.to(()=>const SearchBookScreen(), transition: Transition.leftToRightWithFade),
                child: const Padding(
                  padding: EdgeInsets.symmetric(vertical: 8, horizontal: 16),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Search your book...',
                        style:
                            TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
                      ),
                      Icon(
                        Icons.search,
                        size: 24,
                      ),
                    ],
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 8,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Row(
                children: [
                  const Text(
                    "New Books",
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                  ),
                  const Spacer(),
                  InkWell(
                    onTap: () => {},
                    child: const Text(
                      "See All",
                      style: TextStyle(fontSize: 12),
                    ),
                  )
                ],
              ),
            ),
            GetBuilder<HomeController>(
                init: controller,
                initState: (state) => controller.getNewBooks(),
                builder: (controller) {
                  if (controller.newBookState.value.status.isSuccess) {
                    var data = controller.newBookState.value.data;
                    var count = data?.books?.length ?? 0;
                    return SizedBox(
                      height: AppLayout.getHeight(320),
                      child: ListView.separated(
                          physics: const BouncingScrollPhysics(),
                          scrollDirection: Axis.horizontal,
                          shrinkWrap: true,
                          padding: const EdgeInsets.all(16),
                          itemBuilder: (ctx, index) {
                            final book = data?.books![index];
                            return BookItem(
                              bookItem: book!,
                            );
                          },
                          separatorBuilder: (ctx, index) {
                            return const SizedBox(
                              width: 8,
                            );
                          },
                          itemCount: 5),
                    );
                  }
                  return SizedBox(
                    height: AppLayout.getHeight(320),
                    child: ListView.separated(
                        physics: const BouncingScrollPhysics(),
                        scrollDirection: Axis.horizontal,
                        shrinkWrap: true,
                        padding: const EdgeInsets.all(16),
                        itemBuilder: (ctx, index) {
                          return BookSkeleton(height: AppLayout.getHeight(290),);
                        },
                        separatorBuilder: (ctx, index) {
                          return const SizedBox(
                            width: 8,
                          );
                        },
                        itemCount: 5),
                  );
                }),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Row(
                children: [
                  const Text(
                    "Books For You",
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                  ),
                  const Spacer(),
                  InkWell(
                    onTap: () => {},
                    child: const Text(
                      "See All",
                      style: TextStyle(fontSize: 12),
                    ),
                  )
                ],
              ),
            ),
            GetBuilder<HomeController>(
                init: controller,
                initState: (state) =>
                    controller.getSearchBooks(query: "Flutter", cancelToken: CancelToken()),
                builder: (controller) {
                  if (controller.searchBookState.value.status.isSuccess) {
                    var data = controller.searchBookState.value.data;
                    var count = data?.books?.length ?? 0;

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
                  }
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
                }),
          ],
        ),
      ),
    );
  }
}
