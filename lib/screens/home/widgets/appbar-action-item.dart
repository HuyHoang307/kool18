import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class AppBarActionItem extends StatelessWidget {
  final IconData icon;
  final Color? color;
  final VoidCallback onTap;

  AppBarActionItem({required this.icon, required this.onTap, this.color });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Container(
      height: 35,
      width: 35,
      margin: EdgeInsets.symmetric(horizontal: 5),
      child: Center(child: FaIcon(icon, color: color ?? Color(0xFF000000), size: 20,),),
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: Colors.grey[200]
      ),
    ),
    onTap: onTap,
    );
  }
}