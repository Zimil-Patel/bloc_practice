import 'package:equatable/equatable.dart';

class PostModel extends Equatable {
  final int userId;
  final String title, body;

  const PostModel(
      {required this.userId, required this.title, required this.body});

  factory PostModel.fromJson(Map map) =>
      PostModel(userId: map['id'], title: map['title'], body: map['body']);

  PostModel copyWith({int? userId, String? title, String? body}) {
    return PostModel(
      userId: userId ?? this.userId,
      title: title ?? this.title,
      body: body ?? this.body,
    );
  }

  @override
  List<Object?> get props => [];
}
