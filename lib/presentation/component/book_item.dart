import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_profile/data/book/model/book.dart';
import 'package:my_profile/presentation/detail_book/detail_book.dart';
import 'package:my_profile/presentation/utils/AppLayout.dart';
import 'package:my_profile/route/pages_binding.dart';
import 'package:my_profile/route/routes.dart';

class BookItem extends StatelessWidget {
  final Book bookItem;
  final EdgeInsets margin;
  final double column;
  final double height;

  const BookItem(
      {super.key,
      required this.bookItem,
      this.margin = EdgeInsets.zero,
      this.column = 2.5,
      this.height = 290});

  @override
  Widget build(BuildContext context) {
    var title = bookItem.title.isBlank == true ? "-\n" : bookItem.title;
    var subTitle =
        bookItem.subtitle.isBlank == true ? "-\n\n" : bookItem.subtitle;

    return Container(
      margin: margin,
      width: (AppLayout.getSize(context).width / column) - 16,
      height: AppLayout.getHeight(height),
      child: Card(
        margin: EdgeInsets.zero,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
        clipBehavior: Clip.antiAliasWithSaveLayer,
        child: InkWell(
          onTap: ()=>Get.toNamed(Routes.detailBook,arguments: { "isbn13": bookItem.isbn13}),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(
                child: Image.network(
                  bookItem.image ?? "",
                  fit: BoxFit.fitWidth,
                  height: 150,
                  loadingBuilder: (context, child, progress) {
                    if (progress == null) {
                      return child;
                    } else {
                      return SizedBox(
                        height: 150,
                        child: Center(
                          child: CircularProgressIndicator(
                            valueColor: AlwaysStoppedAnimation<Color>(
                                Theme.of(context).colorScheme.primaryContainer),
                          ),
                        ),
                      );
                    }
                  },
                ),
              ),
              // const SizedBox(height: 8,),
              Container(
                margin: const EdgeInsets.all(16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      title ?? "-\n",
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      style: const TextStyle(
                          fontSize: 12, fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(
                      height: 8,
                    ),
                    Text(
                      subTitle ?? "-\n\n",
                      maxLines: 3,
                      overflow: TextOverflow.ellipsis,
                      style: const TextStyle(
                          fontSize: 10, fontWeight: FontWeight.w300),
                    ),
                    const SizedBox(
                      height: 8,
                    ),
                    Align(
                      alignment: Alignment.bottomLeft,
                      child: Text(
                        bookItem.price ?? "-",
                        style: const TextStyle(
                            fontSize: 10, fontWeight: FontWeight.bold),
                      ),
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
