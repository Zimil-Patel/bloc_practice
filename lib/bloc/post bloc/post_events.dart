import 'package:bloc_practice/model/post_model.dart';
import 'package:equatable/equatable.dart';

abstract class PostEvents extends Equatable{
  const PostEvents();

  @override
  List<Object?> get props => [];
}

class FetchPostApi extends PostEvents{}

class DeletePost extends PostEvents{

  final PostModel post;

  const DeletePost({required this.post});

  @override
  List<Object?> get props => [post];
}