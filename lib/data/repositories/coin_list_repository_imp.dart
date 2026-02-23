import 'package:flutter_application_1/data/datasource/coin_list_datasource.dart';
import 'package:flutter_application_1/domain/entity/crypyo_model.dart';
import 'package:flutter_application_1/domain/repositories/coin_list_repository.dart';

class CoinListRepositoryImp extends CoinListRepository {
  CoinListDatasource datasource;
  CoinListRepositoryImp(this.datasource);

  @override
  Future<List<CryptoEntity>> getCoins() {
    return datasource.getCoins();
  }

  @override
  Future<List<CryptoEntity>> searchCoins(String query) {
    return datasource.searchCoins(query);
  }
}
