import 'package:flutter/cupertino.dart';
import 'package:photo_album/model/post.dart';

@immutable
abstract class PostState {}

class PostInitial extends PostState {}

class LoadingState extends PostState {}

class LoadedState extends PostState {
  List<Post> posts;
  List<Post> getAlbumId;
  List<int> uniqueList;

  LoadedState({
    this.uniqueList,
    this.getAlbumId,
    this.posts,
  });
}

class ErrorState extends PostState {
  String error;

  ErrorState({this.error});
}
