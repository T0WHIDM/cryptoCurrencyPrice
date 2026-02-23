import 'package:dio/dio.dart';
import 'package:flutter_application_1/data/datasource/coin_list_datasource.dart';
import 'package:flutter_application_1/data/dtos/crypto_dto.dart';
import 'package:flutter_application_1/data/mappers/crypto_mapper.dart';
import 'package:flutter_application_1/domain/entity/crypyo_model.dart';

class CoinListDatasourceRemote extends CoinListDatasource {
  final Dio dioClient;
  CoinListDatasourceRemote(this.dioClient);

  @override
  Future<List<CryptoEntity>> getCoins() async {
    try {
      var response = await Dio().get(
        'https://rest.coincap.io/v3/assets?apiKey=e9bdb4d77f65c6e71957c233f65c40a585d6209aff09742c6edacb4305132e31',
      );
      List<CryptoDto> cryptoDtoList = response.data['data']
          .map<CryptoDto>(
            (jsonMapObject) => CryptoDto.fromMapJson(jsonMapObject),
          )
          .toList();

      return CryptoMapper.toDomainList(cryptoDtoList);
    } catch (e) {
      throw Exception('Something went wrong');
    }
  }

  @override
  Future<List<CryptoEntity>> searchCoins(String query) async {
    try {
      var response = await Dio().get(
        'https://rest.coincap.io/v3/assets?apiKey=e9bdb4d77f65c6e71957c233f65c40a585d6209aff09742c6edacb4305132e31',
      );
      List<CryptoDto> cryptoList = response.data['data']
          .map<CryptoDto>(
            (jsonMapObject) => CryptoDto.fromMapJson(jsonMapObject),
          )
          .toList();

      List<CryptoDto> filteredList = cryptoList.where((element) {
        return element.name.toLowerCase().contains(query.toLowerCase());
      }).toList();

      return CryptoMapper.toDomainList(filteredList);
    } catch (e) {
      throw Exception('Something went wrong');
    }
  }
}
