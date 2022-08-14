import 'package:carousel_slider/carousel_slider.dart';
import 'package:extended_image/extended_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive/hive.dart';
import 'package:photo_album/Bloc/post_bloc.dart';
import 'package:photo_album/Bloc/post_state.dart';

import '../model/post.dart';

class HorizontalList extends StatefulWidget {
  @override
  State<HorizontalList> createState() => _HorizontalListState();
}

class _HorizontalListState extends State<HorizontalList> {
  var box = Hive.box('photoAlbums');

  List<Post> thumbnailUrl = [];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    setState(() {
      if (box.get('thumbnailUrl') != null) {
        thumbnailUrl = box.get('thumbnailUrl');
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return thumbnailUrl.isEmpty
        ? BlocConsumer<PostBloc, PostState>(
            builder: (context, state) {
              if (state is LoadedState) {
                return CarouselSlider.builder(
                  itemCount: state.posts.length,
                  itemBuilder: (context, index, pageIndex) {
                    box.put('thumbnailUrl', state.posts);
                    return SizedBox(
                      height: 150,
                      width: 150,
                      child: ExtendedImage.network(
                        state.posts[index].thumbnailUrl,
                        cache: true,
                      ),
                    );
                  },
                  options: CarouselOptions(
                    scrollDirection: Axis.horizontal,
                    enableInfiniteScroll: true,
                    viewportFraction: 0.5,
                  ),
                );
              }
              return SizedBox();
            },
            listener: (context, state) {
              if (state is ErrorState) {
                Text(state.error);
              }
            },
          )
        : CarouselSlider.builder(
            itemCount: thumbnailUrl.length,
            itemBuilder: (context, index, pageIndex) {
              return SizedBox(
                height: 150,
                width: 150,
                child: Image.network(
                  thumbnailUrl[index].thumbnailUrl,
                ),
              );
            },
            options: CarouselOptions(
              scrollDirection: Axis.horizontal,
              enableInfiniteScroll: true,
              viewportFraction: 0.5,
            ),
          );
  }
}
