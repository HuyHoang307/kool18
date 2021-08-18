import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:kool18_new/contanst/contanst.dart';
import 'package:kool18_new/model/user_model.dart';
import 'package:kool18_new/screens/widgets/avatar-circle.dart';

class CreatePostScreen extends StatefulWidget {
  final User currentUser;
  CreatePostScreen({Key? key, required this.currentUser}) : super(key: key);

  @override
  _CreatePostScreenState createState() => _CreatePostScreenState();
}

class _CreatePostScreenState extends State<CreatePostScreen> {
  bool canPost = false;
  int status = 0;
  bool disableStatus = false;
  final TextEditingController _controller = TextEditingController();

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(CupertinoIcons.arrow_left),
          onPressed: () {
            Navigator.pop(context, null);
          },
        ),
        actions: [
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 10.0),
            child: TextButton(
              child: Text(
                'ĐĂNG',
                style: TextStyle(color: Colors.white),
              ),
              style: TextButton.styleFrom(
                backgroundColor: canPost
                    ? CupertinoColors.activeGreen
                    : Color(GREY),
                padding: const EdgeInsets.all(5.0),
                shadowColor: Colors.transparent
              ),
              onPressed: canPost
                  ? () {
                      print('Call api creat post');
                      Navigator.pop(context, 'a post');
                    }
                  : null,
            ),
          )
        ],
      ),
      body: Container(
        color: Colors.white,
        padding: const EdgeInsets.only(top: 20.0, left: 10.0, right: 10.0),
        child: Column(
          children: [
            Row(
              children: [
                AvatarCircleCustom(url: widget.currentUser.imageUrl, size: 50.0,),
                Expanded(
                  child: Container(
                    margin: const EdgeInsets.only(left: 20.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(widget.currentUser.name, style: TextStyle(fontSize: 16.0, fontWeight: FontWeight.bold),),
                        SizedBox(height: 5.0,),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            SelectButtonCustom(
                              icon: POST_STATUS[status].icon,
                              label: POST_STATUS[status].label,
                              disable: disableStatus,
                              onPressed: () {
                                print('Select status');
                              },
                            ),
                            SizedBox(
                              width: 10.0,
                            ),
                            SelectButtonCustom(
                              icon: CupertinoIcons.plus,
                              label: 'Chọn album',
                              disable: false,
                              onPressed: () {
                                print('Select album');
                              },
                            )
                          ],
                        )
                      ],
                    ),
                  ),
                )
              ],
            ),
            Expanded(
              child: TextField(
                maxLines: null,
                controller: _controller,
                onChanged: (String value) {
                  if(value != '') {
                    setState(() {
                      canPost = true;
                    });
                    return;
                  }
                  setState(() {
                    canPost = false;
                  });
                },
                style: TextStyle(fontSize: 30.0, color: Colors.black),
                decoration: InputDecoration(
                  hintText: WHAT_DO_YOU_THING,
                  hintStyle: TextStyle(color: Color(GREY), fontSize: 30.0),
                  border: InputBorder.none,
                  contentPadding: const EdgeInsets.symmetric(vertical: 20.0, horizontal: 10.0)
                ),
              )
            )
          ],
        ),
      ),
    );
  }
}


class SelectButtonCustom extends StatelessWidget {
  final bool? disable;
  final String label;
  final IconData icon;
  final VoidCallback onPressed;
  SelectButtonCustom({Key? key, this.disable = false, required this.label, required this.icon, required this.onPressed}):super(key: key);
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: disable!?null: onPressed,
      child: Container(
        padding: const EdgeInsets.all(5.0),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Icon(icon, size: 12.0, color: Colors.grey[350],),
            SizedBox(width: 5.0,),
            Text(label, style: TextStyle(fontSize: 12, color: Colors.grey,),),
            disable!? SizedBox.shrink(): SizedBox(width: 5.0,),
            disable!? SizedBox.shrink(): Icon(CupertinoIcons.arrowtriangle_down_fill, size: 8.0, color: Colors.grey[400],)
          ],
        ),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(3.0),
          border: Border.all(color: Colors.grey[400]!)
        ),
      ),
    );
  }
}