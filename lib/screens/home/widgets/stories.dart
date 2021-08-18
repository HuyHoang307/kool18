import 'package:flutter/material.dart';
import 'package:kool18_new/data/data.dart';
import 'package:kool18_new/model/models.dart';
import 'package:kool18_new/screens/home/widgets/stories_view_detail.dart';
import 'package:kool18_new/screens/widgets/avatar-circle.dart';
import 'package:persistent_bottom_nav_bar/persistent-tab-view.dart';

class StoriesItems extends StatelessWidget {
  final Story story;
  final VoidCallback onPressed;
  StoriesItems({Key? key, required this.story, required this.onPressed}): super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        width: 120.0,
        child: Stack(
          alignment: Alignment.center,
          children: [
            Container(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(40.0),
                    child: Image.network(story.imageUrl, height: 120.0, width: 120.0, fit: BoxFit.cover,),
                  ),
                  SizedBox(height: 20.0,),
                  Text(story.user.name, maxLines: 1, overflow: TextOverflow.ellipsis, style: TextStyle(color: Colors.black54, fontSize: 16.0),)
                ],
              ),
            ),
            Positioned(
              top: 95.0,
              child: Container(
                padding: const EdgeInsets.all(3.0),
                decoration: BoxDecoration(
                  color: Colors.transparent,
                  border: Border.all(width: 3.0, color: story.isViewed? Colors.grey[400]!: Colors.blue),
                  shape: BoxShape.circle
                ),
                child: AvatarCircleCustom(url: story.user.imageUrl, size: 32.0),
              ),
            )
          ],
        ),
      ),
    );
  }
}

class ListOfStories extends StatefulWidget {
  ListOfStories({Key? key}) : super(key: key);

  @override
  _ListOfStoriesState createState() => _ListOfStoriesState();
}

class _ListOfStoriesState extends State<ListOfStories> {

  late List<Story> _list;

  @override
  void initState() {
    super.initState();
    _list = stories;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 15.0),
      height: 160.0,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) => Container(
          margin: const EdgeInsets.symmetric(horizontal:5.0),
          child: StoriesItems(
            story: _list[index],
            onPressed: () {
              pushNewScreen(context, screen: StoryDetailScreen(stories: [
                            _list[index],
                            _list[index],
                            _list[index]
                          ]), withNavBar: false);
            },
          ),
        ),
        itemCount: _list.length,
      ),
    );
  }
}

