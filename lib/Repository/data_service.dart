import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:photo_album/model/post.dart';

class DataService {
  // https://jsonplaceholder.typicode.com/posts

  Future<List<Post>> getPosts() async {
    try {
      const url = 'https://jsonplaceholder.typicode.com/photos';

      final response = await http.get(Uri.parse(url));
      if (response.statusCode == 200) {
        final data = jsonDecode(response.body) as List;
        final posts = data.map((json) {
          return Post.fromJson(json);
        }).toList();
        return posts;

        } else {
        print(response.statusCode);
      }
    } catch (e) {
      rethrow;
    }
  }

  Future<List<Post>> getPhotoAlbumsId() async {
    try {
      var url = Uri.parse("https://jsonplaceholder.typicode.com/photos");
      http.Response response = await http.get(url);
      if (response.statusCode == 200) {
        final data = jsonDecode(response.body) as List;
        final getAlbumId = data.map((json) {
          return Post(
              albumId: json['albumId']
          );
        }).toList();
        return getAlbumId;
      } else {
        throw Exception("Unable to load data");
      }
    } catch (e) {
      rethrow;
    }

  }

  Future<List<int>> getPhotoAlbumIdList() async {
    List<Post> idLists = await getPhotoAlbumsId();
    List<int> albumIds = [];
    for (var i = 0; i < idLists.length; i++) {
      albumIds.add(idLists[i].albumId);
    }
    var uniqueList = albumIds.toSet().toList();
    return uniqueList;
  }
}



