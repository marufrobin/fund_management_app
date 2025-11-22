import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AppImagePlaceHolderWidget extends StatelessWidget {
  const AppImagePlaceHolderWidget({
    super.key,
    this.height,
    this.width,
    this.fit,
  });

  final double? height;
  final double? width;
  final BoxFit? fit;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      width: width,
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.surfaceContainerHighest,
        borderRadius: BorderRadius.circular(8.r),
      ),
      child: Icon(
        Icons.image_outlined,
        color: Theme.of(context).colorScheme.onSurfaceVariant.withOpacity(0.5),
        size: 24.r,
      ),
    );
  }
}
