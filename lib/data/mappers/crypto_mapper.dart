import 'package:flutter_application_1/data/dtos/crypto_dto.dart';
import 'package:flutter_application_1/domain/entity/crypyo_model.dart';

class CryptoMapper {
  static CryptoEntity toDomain(CryptoDto cryptoDto) {
    return CryptoEntity(
      cryptoDto.id,
      cryptoDto.name,
      cryptoDto.symbol,
      double.parse(cryptoDto.changePercent24Hr),
      double.parse(cryptoDto.priceUsd),
      double.parse(cryptoDto.marketCapUsd),
      int.parse(cryptoDto.rank),
    );
  }

  static List<CryptoEntity> toDomainList(List<CryptoDto> cryptoDtos) {
    return cryptoDtos.map((cryptoDto) => toDomain(cryptoDto)).toList();
  }
}
