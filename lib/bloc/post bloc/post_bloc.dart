
import 'package:bloc/bloc.dart';
import 'package:bloc_practice/bloc/favourite%20app%20bloc/favourite_state.dart';
import 'package:bloc_practice/bloc/post%20bloc/post_events.dart';
import 'package:bloc_practice/bloc/post%20bloc/post_state.dart';
import 'package:bloc_practice/model/post_model.dart';
import 'package:bloc_practice/utils/post_utils.dart';

class PostBloc extends Bloc<PostEvents, PostState> {
  List<PostModel> postList = [];
  PostUtils postUtils = PostUtils();

  PostBloc() : super(PostState()) {
    on<FetchPostApi>(_fetchPostApi);
    on<DeletePost>(_deletePost);
  }

  _fetchPostApi(FetchPostApi event, Emitter<PostState> emit) async {
    await postUtils.callPostApi().then((value) {
      postList = value;
      emit(state.copyWith(
          postList: List.from(postList),
          listStatus: ListStatus.success,
          message: 'success'));
    }).onError((error, stackTrace) {
      emit(state.copyWith(
          listStatus: ListStatus.failure, message: error.toString()));
    });
  }

  _deletePost(DeletePost event, Emitter<PostState> emit) async {
    postList.remove(event.post);
    emit(state.copyWith(postList: List.from(postList)));
  }
}
