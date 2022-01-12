import 'package:flutter/material.dart';
import 'package:skeletons/skeletons.dart';

class CustomNetworkImage extends StatelessWidget {
  const CustomNetworkImage({
    Key? key,
    required this.url,
    this.height=double.infinity,
    this.width=double.infinity,
    this.fit=BoxFit.fill,
  }) : super(key: key);
  final String url;
  final double width;
  final double height;
  final BoxFit fit;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      child: Image.network(url,
      fit: fit,
      loadingBuilder:(context, child, loadingProgress) {
        if(loadingProgress==null) return child;

        return SkeletonAvatar(style: SkeletonAvatarStyle(),);
      },
      )
      );
  }
}