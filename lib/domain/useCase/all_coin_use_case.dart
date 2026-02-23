import 'package:flutter_application_1/domain/entity/crypyo_model.dart';
import 'package:flutter_application_1/domain/repositories/coin_list_repository.dart';

class AllCoinUseCase {
  final CoinListRepository repository;

  AllCoinUseCase(this.repository);

  Future<List<Crypto>> call() {
    return repository.getCoins();
  }
}
