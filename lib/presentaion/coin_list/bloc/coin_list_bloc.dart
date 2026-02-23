import 'package:dio/dio.dart';
import 'package:flutter_application_1/domain/entity/crypyo_model.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'coin_list_event.dart';
import 'coin_list_state.dart';

class CoinListBloc extends Bloc<CoinListEvent, CoinListState> {
  CoinListBloc() : super(CoinListLoadingState()) {
    on<LoadInitialCoinEvent>((event, emit) async {
      emit(CoinListLoadingState());

      var response = await Dio().get(
        'https://rest.coincap.io/v3/assets?apiKey=e9bdb4d77f65c6e71957c233f65c40a585d6209aff09742c6edacb4305132e31',
      );
      List<Crypto> cryptoList = response.data['data']
          .map<Crypto>((jsonMapObject) => Crypto.fromMapJson(jsonMapObject))
          .toList();

      if (response.statusCode == 200) {
        emit(CoinListSucsessState(cryptoList: cryptoList));
      } else {
        emit(CoinListFaildState(errorMessage: 'faild to fetch data'));
      }
    });

    on<RefreshCoinEvent>((event, emit) async {
      emit(CoinListLoadingState());

      var response = await Dio().get(
        'https://rest.coincap.io/v3/assets?apiKey=e9bdb4d77f65c6e71957c233f65c40a585d6209aff09742c6edacb4305132e31',
      );
      List<Crypto> cryptoList = response.data['data']
          .map<Crypto>((jsonMapObject) => Crypto.fromMapJson(jsonMapObject))
          .toList();

      if (response.statusCode == 200) {
        emit(CoinListSucsessState(cryptoList: cryptoList));
      } else {
        emit(CoinListFaildState(errorMessage: 'faild to fetch data'));
      }
    });
  }
}
