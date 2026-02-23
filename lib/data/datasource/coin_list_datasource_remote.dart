import 'package:dio/dio.dart';
import 'package:flutter_application_1/data/datasource/coin_list_datasource.dart';
import 'package:flutter_application_1/domain/entity/crypyo_model.dart';

class CoinListDatasourceRemote extends CoinListDatasource {
  Dio dioClient;
  CoinListDatasourceRemote(this.dioClient);

  @override
  Future<List<Crypto>> getCoins() async {
    var response = await Dio().get(
      'https://rest.coincap.io/v3/assets?apiKey=e9bdb4d77f65c6e71957c233f65c40a585d6209aff09742c6edacb4305132e31',
    );
    List<Crypto> cryptoList = response.data['data']
        .map<Crypto>((jsonMapObject) => Crypto.fromMapJson(jsonMapObject))
        .toList();
    return cryptoList;
  }
}
