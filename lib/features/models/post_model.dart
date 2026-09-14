class PostModel {
  final String userName;
  final String userImage;
  final String postImage;
  final String timeAgo;
  final int commentsCount;
  final int likesCount;

  const PostModel({
    required this.userName,
    required this.userImage,
    required this.postImage,
    required this.timeAgo,
    required this.commentsCount,
    required this.likesCount,
  });
}