import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:photo_album/Bloc/post_event.dart';
import 'package:photo_album/Bloc/post_state.dart';
import '../Repository/data_service.dart';

class PostBloc extends Bloc<PostEvent, PostState> {
  final DataService _dataService;
  PostBloc(this._dataService) : super(LoadingState()) {
    on<PostEvent>((event, emit) async {
      if (event is LoadEvent || event is PullToRefreshEvent) {
        emit(LoadingState());
        try {
          final posts = await _dataService.getPosts();
          final getAlbumId = await _dataService.getPhotoAlbumsId();
          final uniqueList = await _dataService.getPhotoAlbumIdList();
          emit(
            LoadedState(
              posts: posts,
              getAlbumId: getAlbumId,
              uniqueList: uniqueList,
            ),
          );
        } catch (e) {
          emit(
            ErrorState(error: e.toString()),
          );
        }
      }
    });
  }
}
