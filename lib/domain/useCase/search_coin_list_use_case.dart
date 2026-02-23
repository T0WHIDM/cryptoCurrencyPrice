import 'package:flutter_application_1/domain/entity/crypyo_model.dart';
import 'package:flutter_application_1/domain/repositories/coin_list_repository.dart';

class SearchCoinListUsecase {
  final CoinListRepository repository;

  SearchCoinListUsecase(this.repository);

  Future<List<CryptoEntity>> call(String query) {
    return repository.searchCoins(query);
  }
}
