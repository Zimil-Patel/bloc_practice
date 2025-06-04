import 'package:bloc_practice/model/favourite_model.dart';
import 'package:equatable/equatable.dart';

enum ListStatus { loading, success, failure }

class FavouriteState extends Equatable {
  final ListStatus listStatus;
  final List<FavouriteModel> favouriteList;

  const FavouriteState(
      {this.favouriteList = const [], this.listStatus = ListStatus.loading});

  FavouriteState copyWith(
      {List<FavouriteModel>? favouriteList, ListStatus? listStatus}) {
    return FavouriteState(
        favouriteList: favouriteList ?? this.favouriteList,
        listStatus: listStatus ?? this.listStatus);
  }

  @override
  List<Object?> get props => [favouriteList, listStatus];
}
