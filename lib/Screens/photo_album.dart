import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive/hive.dart';
import 'package:photo_album/Bloc/post_bloc.dart';
import 'package:photo_album/Bloc/post_state.dart';
import '../Widget/horizontal_list.dart';
import '../model/post.dart';

class PhotoAlbum extends StatefulWidget {
  @override
  State<PhotoAlbum> createState() => _PhotoAlbumState();
}

class _PhotoAlbumState extends State<PhotoAlbum> {

  var box = Hive.box('photoAlbums');

  List<int> albumIds = [];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    setState(() {
      if (box.get('albumId') != null) {
        albumIds = box.get('albumId');
      }
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: albumIds.isEmpty ? BlocConsumer<PostBloc, PostState>(builder: (context, state) {
          if (state is LoadedState) {
            return CarouselSlider.builder(
              itemCount: state.uniqueList.length,
              itemBuilder: (context, index, albumIndex) {
                box.put('albumId', state.uniqueList);
                return Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 15.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(height: 20),
                      Text('${state.uniqueList[index]}'),
                      HorizontalList()
                    ],
                  ),
                );
              },
              options: CarouselOptions(
                scrollDirection: Axis.vertical,
                enableInfiniteScroll: true,
                height: double.infinity,
                viewportFraction: 0.32,
              ),
            );
          }
          return SizedBox();
        }, listener: (context, state) {
          if (state is ErrorState) {
            Text(state.error);
          }
        }) : CarouselSlider.builder(
          itemCount: albumIds.length,
          itemBuilder: (context, index, albumIndex) {
            return Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: 20),
                  Text('${albumIds[index]}'),
                  HorizontalList()
                ],
              ),
            );
          },
          options: CarouselOptions(
            scrollDirection: Axis.vertical,
            enableInfiniteScroll: true,
            height: double.infinity,
            viewportFraction: 0.32,
          ),
        )
      ),
    );
  }
}
