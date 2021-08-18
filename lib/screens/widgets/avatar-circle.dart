import 'package:flutter/material.dart';

class AvatarCircleCustom extends StatelessWidget {
  final String url;
  final double? size;
  AvatarCircleCustom({Key? key, required this.url, this.size = 50.0}): super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: ClipRRect(
        borderRadius: BorderRadius.circular(size!/2),
        child: Image.network(
          url,
          fit: BoxFit.cover,
          height: size,
          width: size,
        ),
      ),
    );
  }
}