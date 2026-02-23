class CryptoEntity {
  String id;
  String name;
  String symbol;
  double changePercent24Hr;
  double priceUsd;
  double marketCapUsd;
  int rank;

  CryptoEntity(
    this.id,
    this.name,
    this.symbol,
    this.changePercent24Hr,
    this.priceUsd,
    this.marketCapUsd,
    this.rank,
  );
}
