import 'package:bloc_practice/bloc/favourite%20app%20bloc/favourite_state.dart';
import 'package:bloc_practice/bloc/post%20bloc/post_bloc.dart';
import 'package:bloc_practice/bloc/post%20bloc/post_events.dart';
import 'package:bloc_practice/bloc/post%20bloc/post_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class PostScreen extends StatelessWidget {
  const PostScreen({super.key});

  @override
  Widget build(BuildContext context) {
    context.read<PostBloc>().add(FetchPostApi());

    return Scaffold(
      appBar: AppBar(
        title: Text('Post Api Bloc'),
        elevation: 2,
        centerTitle: true,

      ),
      body:
      BlocBuilder<PostBloc, PostState>(builder: (context, state) {
        switch (state.listStatus) {
          case ListStatus.loading:
            return Center(
              child: CircularProgressIndicator(),
            );
          case ListStatus.failure:
            return Center(
              child: Text('Something Went Wrong : ${state.message}'),
            );
          case ListStatus.success:
            return ListView.builder(
              padding: EdgeInsets.all(20),
              itemCount: state.postList.length,
              itemBuilder: (context, index) {
                final post = state.postList[index];

                // POST Card
                return Card(
                  child: ListTile(
                    // POST ID
                    leading: Text(post.userId.toString()),

                    // POST TITLE
                    title: Text(
                      post.title,
                    ),

                    // POST BODY
                    subtitle: Text(
                      post.body,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),

                    // POST BODY
                    trailing: IconButton(
                      onPressed: () {
                        context.read<PostBloc>().add(DeletePost(post: post));
                      },
                      icon: Icon(Icons.delete),
                    ),
                  ),
                );
              },
            );
        }
      }),
    );
  }
}
