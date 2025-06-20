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
      Column(
        children: [
          Padding(
            padding: EdgeInsets.symmetric(vertical: 14, horizontal: 18),
            child: TextField(
              onChanged: (value) {
                context.read<PostBloc>().add(SearchPost(searchKey: value));
              },
              onTapOutside: (event) {
                FocusManager.instance.primaryFocus!.unfocus();
              },
              decoration: InputDecoration(
                hintText: 'Search Post Title',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                  borderSide: BorderSide(width: 2),
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                  borderSide: BorderSide(width: 1, color: Colors.grey.shade600),
                ),
              ),
            ),
          ),

          Expanded(
            child: BlocBuilder<PostBloc, PostState>(builder: (context, state) {
              switch (state.listStatus) {
                case ListStatus.loading:
                  return Center(
                    child: CircularProgressIndicator(),
                  );
                case ListStatus.failure:
                  return Center(
                    child: Text(state.message),
                  );
                case ListStatus.success:
                  return ListView.builder(
                    shrinkWrap: true,
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
          ),
        ],
      ),
    );
  }
}
