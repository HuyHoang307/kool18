import 'dart:js';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:kool18_new/data/data.dart';
import 'package:kool18_new/model/models.dart';

class StoryDetailScreen extends StatefulWidget {

  final int currentIndex;
  final List<Story> stories;
  StoryDetailScreen({Key? key, this.currentIndex = 0, required this.stories}) : super(key: key);

  @override
  _StoryDetailScreenState createState() => _StoryDetailScreenState();
}

class _StoryDetailScreenState extends State<StoryDetailScreen> with SingleTickerProviderStateMixin{
  late PageController _pageController;
  late AnimationController _animationController;
  late int _currentIndex;

  @override
  void initState() {
    super.initState();
    _currentIndex = widget.currentIndex;
    _pageController = PageController();
    _animationController = AnimationController(vsync: this);

    final firstStory = widget.stories[_currentIndex];
    _loadStory(story: firstStory, animateToPage: false);

    _animationController.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        _animationController.stop();
        _animationController.reset();
        setState(() {
          if (_currentIndex + 1 < widget.stories.length) {
            _currentIndex += 1;
            _loadStory(story: widget.stories[_currentIndex]);
          }
        });
      }
    });
  }

  @override
  void dispose() {
    _pageController.dispose();
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
       child: Scaffold(
         backgroundColor: Colors.black,
         body: GestureDetector(
           child: Stack(
             children: [
               PageView.builder(
                controller: _pageController,
                physics: NeverScrollableScrollPhysics(),
                itemCount: widget.stories.length,
                itemBuilder: (context, i) {
                  final Story story = widget.stories[i];
                  return CachedNetworkImage(imageUrl: story.imageUrl, fit: BoxFit.cover,);
                },
              ),
              Positioned(
                top: 20.0,
                left: 10.0,
                right: 10.0,
                child: Column(
                  children: [
                    Row(
                      children: widget.stories
                          .asMap()
                          .map((key, value) => MapEntry(
                              key,
                              AnimateBar(
                                animationController: _animationController,
                                position: key,
                                currentIndex: _currentIndex,
                              )))
                          .values
                          .toList(),
                    ),
                  ],
                ),
              )
             ],
           ),
         ),
       ),
    );
  }

  void _loadStory({required Story story, bool animateToPage = true}) {
    _animationController.stop();
    _animationController.reset();
    _animationController.duration = const Duration(seconds: 5);
    _animationController.forward();
    if (animateToPage) {
      _pageController.animateToPage(_currentIndex, duration: const Duration(milliseconds: 100), curve: Curves.easeInOut);
    }
  }
}

class AnimateBar extends StatelessWidget {
  final AnimationController animationController;
  final int position;
  final int currentIndex;

  const AnimateBar({
    Key? key,
    required this.animationController,
    required this.position,
    required this.currentIndex
  }): super(key: key);

  @override
  Widget build(BuildContext context) {
    return Flexible(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 1.5),
        child: LayoutBuilder(
          builder: (context, constraint) {
            return Stack(
              children: [
                _builderContainer(
                  double.infinity,
                  position < currentIndex ? Colors.white : Colors.white.withOpacity(0.5)
                ),
                position == currentIndex
                ? AnimatedBuilder(
                  animation: animationController,
                  builder: (context, child) {
                    return _builderContainer(
                      constraint.maxWidth * animationController.value, 
                      Colors.white
                    );
                  },
                )
                : const SizedBox.shrink()
              ],
            );
          },
        ),
      ),
    );
  }

  Container _builderContainer(double width, Color color) {
    return Container(
      height: 5.0,
      width: width,
      decoration: BoxDecoration(
        color: color,
        border: Border.all(
          color: Colors.black26,
          width: 0.8
        ),
        borderRadius: BorderRadius.circular(3.0),
      ),
    );
  }
}