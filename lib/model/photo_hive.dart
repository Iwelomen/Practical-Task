
import 'package:hive_flutter/hive_flutter.dart';
import 'package:photo_album/model/post.dart';
part 'photo_hive.g.dart';

@HiveType(typeId: 1)
class PhotoHive extends HiveObject {
  @HiveField(1)
   List<Post> albumId;
  @HiveField(2)
   List<Post> thumbnailUrl;



}