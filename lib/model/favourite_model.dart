import 'package:equatable/equatable.dart';

class FavouriteModel extends Equatable {
  final int id;
  final String value;
  final bool isDeleting, isFavourite;

  const FavouriteModel({
    required this.id,
    required this.value,
    this.isDeleting = false,
    this.isFavourite = false,
  });

  FavouriteModel copyWith(
          {int? id, String? value, bool? isDeleting, bool? isFavourite}) =>
      FavouriteModel(
        id: id ?? this.id,
        value: value ?? this.value,
        isDeleting: isDeleting ?? this.isDeleting,
        isFavourite: isFavourite ?? this.isFavourite,
      );

  @override
  List<Object?> get props => [id, value, isDeleting, isFavourite];
}
