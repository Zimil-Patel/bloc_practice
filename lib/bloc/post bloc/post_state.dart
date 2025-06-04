import 'package:bloc_practice/bloc/favourite%20app%20bloc/favourite_state.dart';
import 'package:bloc_practice/model/post_model.dart';
import 'package:equatable/equatable.dart';

class PostState extends Equatable {
  final ListStatus listStatus;
  final List<PostModel> postList;
  final String message;

  const PostState(
      {this.postList = const [],
      this.listStatus = ListStatus.loading,
      this.message = ''});

  PostState copyWith(
          {List<PostModel>? postList,
          ListStatus? listStatus,
          String? message}) =>
      PostState(
          postList: postList ?? this.postList,
          listStatus: listStatus ?? this.listStatus,
          message: message ?? this.message);

  @override
  List<Object?> get props => [postList, listStatus, message];
}
