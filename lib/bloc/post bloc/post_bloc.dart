import 'package:bloc/bloc.dart';
import 'package:bloc_practice/bloc/favourite%20app%20bloc/favourite_state.dart';
import 'package:bloc_practice/bloc/post%20bloc/post_events.dart';
import 'package:bloc_practice/bloc/post%20bloc/post_state.dart';
import 'package:bloc_practice/model/post_model.dart';
import 'package:bloc_practice/utils/post_utils.dart';

class PostBloc extends Bloc<PostEvents, PostState> {
  List<PostModel> postList = [];
  List<PostModel> filterList = [];
  PostUtils postUtils = PostUtils();

  PostBloc() : super(PostState()) {
    on<FetchPostApi>(_fetchPostApi);
    on<DeletePost>(_deletePost);
    on<SearchPost>(_searchPost);
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

  _searchPost(SearchPost event, Emitter<PostState> emit) {
    if (event.searchKey.isNotEmpty) {
      filterList = postList
          .where((element) =>
              element.title.toLowerCase().contains(event.searchKey.toLowerCase()))
          .toList();
      emit(
        state.copyWith(
            postList: List.from(filterList),
            message: filterList.isEmpty ? 'No Post Found' : 'success', listStatus: filterList.isEmpty ? ListStatus.failure : ListStatus.success),
      );
    } else {
      emit(state.copyWith(postList: List.from(postList), message: 'success', listStatus: ListStatus.success));
    }
  }
}
