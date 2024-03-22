part of 'makanan_cubit.dart';

@immutable
sealed class MakananState {}

final class MakananInitial extends MakananState {}

final class GetMakananLoading extends MakananState {}

final class GetMakananSuccess extends MakananState {
  final List<MakananModel> listMakananModel;

  GetMakananSuccess({required this.listMakananModel});
}

final class GetMakananHasNoData extends MakananState {}

final class GetMakananEror extends MakananState {
  final String eror;

  GetMakananEror({required this.eror});
}

// final class CreateMakananLoading extends MakananState {}

// final class CreateMakananSuccess extends MakananState {}

// final class CreateMakananEror extends MakananState {
//   final String eror;

//   CreateMakananEror({required this.eror});
// }

