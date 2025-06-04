import 'package:bloc_practice/model/favourite_model.dart';

class FavouriteUtils {
  Future<List<FavouriteModel>> fetchFavouriteList() async {
    await Future.delayed(Duration(seconds: 2));
    return List.generate(
      10,
      (index) => FavouriteModel(id: index + 1, value: 'item ${index + 1}'),
    );
  }
}
