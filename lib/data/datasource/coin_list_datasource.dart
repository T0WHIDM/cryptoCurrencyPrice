import 'package:flutter_application_1/domain/entity/crypyo_model.dart';

abstract class CoinListDatasource {
  Future<List<CryptoEntity>> getCoins();
  Future<List<CryptoEntity>> searchCoins(String query);
}
