import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:kool18_new/contanst/post_status.dart';

const primaryColor = Color(0xff249e1b);


const WHAT_DO_YOU_THING = 'Bạn đang nghĩ gì?';

const GREY = 0xFFE0E0E0;
const ACTIVE_GREEN = 0xFF699E3A;

const List<PostStatus> POST_STATUS = [
  PostStatus(icon: Icons.public, label: 'Công khai'),
  PostStatus(icon: CupertinoIcons.person_2_fill, label: 'Bạn bè'),
  PostStatus(icon: CupertinoIcons.person_badge_minus, label: 'Bạn bè trừ ...'),
  PostStatus(icon: CupertinoIcons.lock_fill, label: 'Chỉ mình tôi')
];
