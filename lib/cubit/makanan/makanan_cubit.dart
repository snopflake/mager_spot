import 'package:bloc/bloc.dart';
import 'package:mager_spot/app/pages/home%20pembeli/navbar/home%20page/kategori/makanan/makanan.dart';
import 'package:mager_spot/data/models/makanan_model.dart';
import 'package:mager_spot/data/repositories/makanan_repositories.dart';
import 'package:meta/meta.dart';

part 'makanan_state.dart';

class MakananCubit extends Cubit<MakananState> {
  MakananCubit() : super(MakananInitial());

  final MakananRepositories _repositories = MakananRepositories();

  void getAllMakanan() async {
    emit(GetMakananLoading());
    try {
      var response = await _repositories.getAllFoods();

      response.isNotEmpty
          ? emit(GetMakananSuccess(listMakananModel: response))
          : emit(GetMakananHasNoData());
    } catch (e) {
      emit(GetMakananEror(eror: e.toString()));
    }
  }

  // void createTweet(String title, String description) async {
  //   emit(CreateMakananLoading());
  //   try {
  //     var response = await _repositories.createMakanan(title, description);

  //     response
  //         ? emit(CreateTweetSuccess())
  //         : emit(CreateTweetEror(eror: "Fail make new tweet"));
  //   } catch (e) {
  //     emit(CreateTweetEror(eror: e.toString()));
  //   }
  // }


}