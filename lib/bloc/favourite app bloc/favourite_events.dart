import 'package:bloc_practice/model/favourite_model.dart';
import 'package:equatable/equatable.dart';

abstract class FavouriteEvents extends Equatable {
  const FavouriteEvents();

  @override
  List<Object?> get props => [];
}

class FetchFavouriteList extends FavouriteEvents {}

class AddAsFavourite extends FavouriteEvents {
  final FavouriteModel item;

  const AddAsFavourite({required this.item});

  @override
  List<Object?> get props => [item];
}

class RemoveAsFavourite extends FavouriteEvents {
  final FavouriteModel item;

  const RemoveAsFavourite({required this.item});

  @override
  List<Object?> get props => [item];
}

class ToggleCheckBox extends FavouriteEvents {
  final FavouriteModel item;

  const ToggleCheckBox({required this.item});

  @override
  List<Object?> get props => [item];
}

class RemoveItems extends FavouriteEvents{}
