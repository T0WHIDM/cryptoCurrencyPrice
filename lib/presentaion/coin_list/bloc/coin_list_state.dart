import 'package:flutter_application_1/domain/entity/crypyo_model.dart';

sealed class CoinListState {}

class CoinListLoadingState extends CoinListState {}

class CoinListSucsessState extends CoinListState {
  List<Crypto> cryptoList;
  CoinListSucsessState({required this.cryptoList});
}

class CoinListFaildState extends CoinListState {
  final String errorMessage;
  CoinListFaildState({required this.errorMessage});
}
