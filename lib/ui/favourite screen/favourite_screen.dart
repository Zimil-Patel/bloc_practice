import 'package:bloc_practice/bloc/favourite%20app%20bloc/favourite_events.dart';
import 'package:bloc_practice/bloc/favourite%20app%20bloc/favourite_state.dart';
import 'package:bloc_practice/bloc/favourite%20app%20bloc/favourtie_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class FavouriteScreen extends StatelessWidget {
  const FavouriteScreen({super.key});

  @override
  Widget build(BuildContext context) {
    context.read<FavouriteBloc>().add(FetchFavouriteList());

    return Scaffold(
      appBar: AppBar(
        title: Text('Favourite Bloc'),
        elevation: 2,
        centerTitle: true,
        actions: [
          BlocBuilder<FavouriteBloc, FavouriteState>(
              builder: (context, state) {
                return Visibility(
                    visible: state.favouriteList.any((element) => element.isDeleting == true),
                    child: IconButton(onPressed: (){
                      context.read<FavouriteBloc>().add(RemoveItems());
                    }, icon: Icon(Icons.delete, color: Colors.redAccent.shade200,),));
              },
          ),
          SizedBox(width: 8,),
        ],
      ),
      body:
          BlocBuilder<FavouriteBloc, FavouriteState>(builder: (context, state) {
        switch (state.listStatus) {
          case ListStatus.loading:
            return Center(
              child: CircularProgressIndicator(),
            );
          case ListStatus.failure:
            return Center(
              child: Text('Something Went Wrong'),
            );
          case ListStatus.success:
            return ListView.builder(
              padding: EdgeInsets.all(20),
              itemCount: state.favouriteList.length,
              itemBuilder: (context, index) {
                final item = state.favouriteList[index];

                // Item Card
                return Card(
                  child: ListTile(
                    // CHECK BOX
                    leading:
                        Checkbox(value: item.isDeleting, onChanged: (value) {
                          context.read<FavouriteBloc>().add(ToggleCheckBox(item: item));
                        }),

                    // ITEM VALUE
                    title: Text(
                      item.value,
                    ),

                    // IS FAVOURITE OR NOT ICON
                    trailing: IconButton(
                      onPressed: () {
                        item.isFavourite
                            ? context
                                .read<FavouriteBloc>()
                                .add(RemoveAsFavourite(item: item))
                            : context
                                .read<FavouriteBloc>()
                                .add(AddAsFavourite(item: item));
                      },
                      icon: item.isFavourite
                          ? Icon(
                              Icons.favorite,
                              color: Colors.redAccent,
                            )
                          : Icon(
                              Icons.favorite_outline_rounded,
                            ),
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
