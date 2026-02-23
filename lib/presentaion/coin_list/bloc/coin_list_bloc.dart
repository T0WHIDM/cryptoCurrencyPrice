import 'package:flutter_application_1/domain/useCase/all_coin_use_case.dart';
import 'package:flutter_application_1/domain/useCase/search_coin_list_use_case.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'coin_list_event.dart';
import 'coin_list_state.dart';

class CoinListBloc extends Bloc<CoinListEvent, CoinListState> {
  AllCoinUseCase allCoinUseCase;
  SearchCoinListUsecase searchCoinListUsecase;

  CoinListBloc(this.allCoinUseCase, this.searchCoinListUsecase)
    : super(CoinListLoadingState()) {
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
      emit(CoinListLoadingState());

      var response = await searchCoinListUsecase.call(event.query);

      emit(CoinListSucsessState(cryptoList: response));
    });
  }
}
