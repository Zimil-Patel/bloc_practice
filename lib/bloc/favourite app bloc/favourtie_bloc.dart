import 'package:bloc/bloc.dart';
import 'package:bloc_practice/bloc/favourite%20app%20bloc/favourite_events.dart';
import 'package:bloc_practice/bloc/favourite%20app%20bloc/favourite_state.dart';
import 'package:bloc_practice/model/favourite_model.dart';
import 'package:bloc_practice/utils/favourite_utils.dart';

class FavouriteBloc extends Bloc<FavouriteEvents, FavouriteState>{

  List<FavouriteModel> favouriteList = [];
  final FavouriteUtils favouriteUtils = FavouriteUtils();

  FavouriteBloc(super.initialState) {
    on<FetchFavouriteList>(_fetchList);
    on<AddAsFavourite>(_addAsFavourite);
    on<RemoveAsFavourite>(_removeAsFavourite);
    on<ToggleCheckBox>(_toggleCheckBox);
    on<RemoveItems>(_removeItems);
  }

  _fetchList(FetchFavouriteList event, Emitter<FavouriteState> emit) async {
    favouriteList = await favouriteUtils.fetchFavouriteList();
    emit(state.copyWith(favouriteList: List.from(favouriteList), listStatus: ListStatus.success));
  }
  
  _addAsFavourite(AddAsFavourite event, Emitter<FavouriteState> emit){
    final index = favouriteList.indexWhere((ele) => ele.id == event.item.id);
    favouriteList[index] = favouriteList[index].copyWith(isFavourite: true);
    emit(state.copyWith(favouriteList: List.from(favouriteList)));
  }

  _removeAsFavourite(RemoveAsFavourite event, Emitter<FavouriteState> emit){
    final index = favouriteList.indexWhere((ele) => ele.id == event.item.id);
    favouriteList[index] = favouriteList[index].copyWith(isFavourite: false);
    emit(state.copyWith(favouriteList: List.from(favouriteList)));
  }

  _toggleCheckBox(ToggleCheckBox event, Emitter<FavouriteState> emit){
    final index = favouriteList.indexWhere((ele) => ele.id == event.item.id);
    favouriteList[index] = favouriteList[index].copyWith(isDeleting: !favouriteList[index].isDeleting);
    emit(state.copyWith(favouriteList: List.from(favouriteList)));
  }

  _removeItems(RemoveItems event, Emitter<FavouriteState> emit){
    favouriteList.removeWhere((element) => element.isDeleting == true);
    emit(state.copyWith(favouriteList: List.from(favouriteList)));
  }

}