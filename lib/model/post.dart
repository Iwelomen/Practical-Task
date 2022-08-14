
class Post {
  final int albumId;
  final int id;
  final String title;
  final String thumbnailUrl;
  final String url;

  Post({
    this.albumId,
    this.id,
    this.title,
    this.thumbnailUrl,
    this.url
  });

  factory Post.fromJson(Map<String, dynamic> json) {
    return Post(
      albumId: json['albumId'],
      id: json['id'],
      title: json['title'],
      thumbnailUrl: json['thumbnailUrl'],
      url: json['url']
    );
  }
}

// class Post {
//   int albumID;
//   List<PostItems> images;
//
//   Post({
//      this.albumID,
//      this.images,
//   });
//
//   factory Post.fromJson(Map<String, dynamic> json) {
//     return Post(
//         List<PlaceItems>.fromJson(json["thubnailUrl"].map((x) => x))
//     )
//
//   }
//
// }
//
// class PostItems {
//   String thumbnailUrl;
//
//   PostItems({
//      this.thumbnailUrl
//   });
//
//   factory PostItems.fromJson(Map<String, dynamic> json) {
//     return PostItems(
//         thumbnailUrl: json['thumbnailUrl']
//     );
//   }
// }