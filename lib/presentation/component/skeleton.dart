import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class Skeleton extends StatelessWidget {
  final double height;
  final double width;
  final double cornerRadius;
  const Skeleton({super.key, this.height = 16, this.width = double.maxFinite, this.cornerRadius = 8});

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: Theme.of(context).colorScheme.primary.withOpacity(0.5),
      highlightColor: Theme.of(context).colorScheme.onSurface.withOpacity(0.05),
      child: Container(
          height: height,
          width: width,
          decoration: BoxDecoration(
            color: Theme.of(context).colorScheme.primary.withOpacity(0.09),
            borderRadius: BorderRadius.all(Radius.circular(cornerRadius)),
          )
      ),
    );
  }
}
