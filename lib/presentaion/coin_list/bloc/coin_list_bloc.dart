import 'package:flutter_application_1/domain/useCase/all_coin_use_case.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'coin_list_event.dart';
import 'coin_list_state.dart';

class CoinListBloc extends Bloc<CoinListEvent, CoinListState> {
  AllCoinUseCase allCoinUseCase;

  CoinListBloc(this.allCoinUseCase) : super(CoinListLoadingState()) {
    on<LoadInitialCoinEvent>((event, emit) async {
      emit(CoinListLoadingState());

      var response = await allCoinUseCase.call();

      emit(CoinListSucsessState(cryptoList: response));
    });

    on<RefreshCoinEvent>((event, emit) async {
      emit(CoinListLoadingState());

      var response = await allCoinUseCase.call();

      emit(CoinListSucsessState(cryptoList: response));
    });

    on<SearchCoinEvent>((event, emit) async {
      // emit(CoinListLoadingState());

      // List<Crypto> filteredList = [];
      // var response = await Dio().get(
      //   'https://rest.coincap.io/v3/assets?apiKey=e9bdb4d77f65c6e71957c233f65c40a585d6209aff09742c6edacb4305132e31',
      // );
      // List<Crypto> cryptoList = response.data['data']
      //     .map<Crypto>((jsonMapObject) => Crypto.fromMapJson(jsonMapObject))
      //     .toList();

      // filteredList = cryptoList.where((element) {
      //   return element.name.toLowerCase().contains(event.query.toLowerCase());
      // }).toList();

      // if (response.statusCode == 200) {
      //   emit(CoinListSucsessState(cryptoList: filteredList));
      // } else {
      //   emit(CoinListFaildState(errorMessage: 'faild to fetch data'));
      // }
    });
  }
}
