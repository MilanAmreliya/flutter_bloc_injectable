import 'package:equatable/equatable.dart';
import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:http/http.dart' as http;
import 'package:injectable/injectable.dart';
import '../google_response_model.dart';
import '../repo/google_api_impl.dart';
part 'api_state.dart';

@injectable
class GoogleApiCubit extends Cubit<GoogleApiState> {
  GooGleApiRepository _gooGleApiRepository;
  GoogleApiCubit(this._gooGleApiRepository) : super(GoogleApiState.initial());
  Future<void> googleApiCall() async {
    try {
      emit(state.copyWith(googleApiStatus: GoogleApiStatus.loading));
      http.Response response = await _gooGleApiRepository.gooGleApi();
      if (response.statusCode == 200) {
        emit(state.copyWith(googleApiStatus: GoogleApiStatus.loaded));
      } else {
        print(response.reasonPhrase);
      }
    } catch (e) {
      print('sdfsdfsdfsdv  $e');
    }
  }

  void setIStap() {
    emit(state.copyWith(isTap: !state.isTap));
  }
}
