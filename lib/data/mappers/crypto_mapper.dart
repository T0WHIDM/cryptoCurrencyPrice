import 'package:flutter_application_1/data/dtos/crypto_dto.dart';
import 'package:flutter_application_1/domain/entity/crypyo_model.dart';

class CryptoMapper {
  String id;
  String name;
  String symbol;
  double changePercent24Hr;
  double priceUsd;
  double marketCapUsd;
  int rank;

  CryptoMapper(
    this.id,
    this.name,
    this.symbol,
    this.changePercent24Hr,
    this.priceUsd,
    this.marketCapUsd,
    this.rank,
  );

  static Crypto toDomain(CryptoDto cryptoDto) {
    return Crypto(
      cryptoDto.id,
      cryptoDto.name,
      cryptoDto.symbol,
      double.parse(cryptoDto.changePercent24Hr),
      double.parse(cryptoDto.priceUsd),
      double.parse(cryptoDto.marketCapUsd),
      int.parse(cryptoDto.rank),
    );
  }
}
