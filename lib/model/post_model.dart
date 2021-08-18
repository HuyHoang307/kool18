import 'package:kool18_new/model/models.dart';

class Post{
  final User user;
  final String? caption;
  final String? timeAgo;
  final String? imageUrl;
  final int likes;
  final int comments;
  final int shares;

  const Post({
    required this.user,
    this.caption,
    this.timeAgo,
    this.imageUrl,
    required this.likes,
    required this.comments,
    required this.shares
  }): assert(caption!=null || imageUrl!=null);
}