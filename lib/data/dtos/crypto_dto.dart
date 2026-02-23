class CryptoDto {
  String id;
  String name;
  String symbol;
  String changePercent24Hr;
  String priceUsd;
  String marketCapUsd;
  String rank;

  CryptoDto(
    this.id,
    this.name,
    this.symbol,
    this.changePercent24Hr,
    this.priceUsd,
    this.marketCapUsd,
    this.rank,
  );

  factory CryptoDto.fromMapJson(Map<String, dynamic> jsonObject) {
    return CryptoDto(
      jsonObject['id'],
      jsonObject['name'],
      jsonObject['symbol'],
      jsonObject['changePercent24Hr'],
      jsonObject['priceUsd'],
      jsonObject['marketCapUsd'],
      jsonObject['rank'],
    );
  }
}
