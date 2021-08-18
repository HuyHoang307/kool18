import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:kool18_new/contanst/contanst.dart';
import 'package:kool18_new/data/data.dart';
import 'package:kool18_new/screens/home/create_post_screen.dart';
import 'package:kool18_new/screens/home/widgets/appbar-action-item.dart';
import 'package:kool18_new/screens/home/widgets/feature.dart';
import 'package:kool18_new/screens/home/widgets/stories.dart';
import 'package:kool18_new/screens/widgets/avatar-circle.dart';
import 'package:persistent_bottom_nav_bar/persistent-tab-view.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            pinned: false,
            floating: false,
            snap: false,
            title: Container(
              child: Image(
                image: AssetImage('assets/logo.png'),
                fit: BoxFit.fitHeight,
              ),
              height: 50,
            ),
            actions: [
              AppBarActionItem(
                icon: FontAwesomeIcons.search,
                onTap: () {
                  print('search');
                },
              ),
              AppBarActionItem(
                icon: FontAwesomeIcons.facebookMessenger,
                onTap: () {
                  print('chat');
                },
              )
            ],
          ),
          SliverToBoxAdapter(
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 18.0),
                decoration: BoxDecoration(
                  color: Colors.white
                ),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Container(
                      padding: const EdgeInsets.symmetric(vertical: 10.0),
                      decoration: BoxDecoration(
                        border: Border(top: BorderSide(color: Color(GREY))),
                      ),
                      child: Row(
                        children: [
                          AvatarCircleCustom(
                            url: currentUser.imageUrl,
                            size: 32.0,
                          ),
                          Expanded(
                              child: GestureDetector(
                            onTap: () async {
                              final result = await pushNewScreen(context,
                                  screen: CreatePostScreen(
                                    currentUser: currentUser,
                                  ),
                                  withNavBar: false,
                                  pageTransitionAnimation:
                                      PageTransitionAnimation.slideUp);
                              print(result);
                            },
                            child: Container(
                              child: Text(
                                WHAT_DO_YOU_THING,
                                style: TextStyle(fontSize: 18.0),
                              ),
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 20.0, vertical: 5.0),
                            ),
                          ))
                        ],
                      ),
                    ),
                    Container(
                      padding: const EdgeInsets.symmetric(vertical: 20.0),
                      child: IntrinsicHeight(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: [
                            Feature(icon: Icons.videocam, label: 'Phát trực tiếp', onPressed: () {print('Livestream');}, iconColor: Colors.redAccent,),
                            Feature(icon: Icons.photo_camera, label: 'Ảnh', onPressed: () {print('create post with picture');},),
                            Feature(icon: Icons.video_camera_front, label: 'Phòng họp mặt', onPressed: () {print('Create a room');}, iconColor: Colors.blue,)
                          ],
                        ),
                      )
                    )
                  ],
                ),
              )
          ),
          SliverToBoxAdapter(
            child: ListOfStories(),
          ),
          SliverList(
            delegate: SliverChildBuilderDelegate(
              (BuildContext context, int index) {
                return Container(
                  height: 100.0,
                  color: Colors.white,
                  child: Center(child: Text('Item $index'),),
                  margin: const EdgeInsets.symmetric(vertical: 20.0),
                );
              },
              childCount: posts.length
            ),
          )
        ],
      ),
    );
  }
}
