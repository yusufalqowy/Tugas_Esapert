import 'package:flutter/material.dart';
import 'package:my_profile/presentation/component/skeleton.dart';
import 'package:my_profile/presentation/utils/AppLayout.dart';
import 'package:shimmer/shimmer.dart';

class BookSkeleton extends StatelessWidget {
  final double height;
  const BookSkeleton({super.key, this.height = double.maxFinite});

  @override
  Widget build(BuildContext context) {
    final double width = ((AppLayout.getSize(context).width/2.5)-16);
    return Card(
      elevation: 0.5,
      child: Container(
        height: height,
        width: width,
        margin: const EdgeInsets.all(8),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Skeleton(height: 150),
            const SizedBox(height: 8,),
            const Skeleton(height: 20,),
            const SizedBox(height: 8,),
            const Skeleton(height: 40,),
            const Spacer(),
            Skeleton(width: width/2, height: 16,),
          ],
        ),
      ),
    );
  }
}
