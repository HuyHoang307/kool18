import 'package:flutter/material.dart';
import 'package:kool18_new/contanst/contanst.dart';

class Feature extends StatelessWidget {
  final IconData icon;
  final Color? iconColor;
  final String label;
  final VoidCallback onPressed;
  Feature({Key? key, required this.label, required this.icon, this.iconColor, required this.onPressed}): super (key: key);

  @override
  Widget build(BuildContext context) {
    final maxWidth = MediaQuery.of(context).size.width * 0.3 - 5.0;
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        padding: EdgeInsets.all(8.0),
        constraints: BoxConstraints(
          maxWidth: maxWidth
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Icon(icon, color: iconColor?? Color(ACTIVE_GREEN), size: 18,),
            SizedBox(width: 5.0,),
            Flexible(
                child: Text(
              label,
              style: TextStyle(fontSize: 12.0, color: Colors.black54),
              textAlign: TextAlign.left,
              overflow: TextOverflow.fade,
            ))
          ],
        ),
        decoration: BoxDecoration(
          color: Colors.grey[200],
          borderRadius: BorderRadius.circular(5.0)
        ),
      ),
    );
  }
}