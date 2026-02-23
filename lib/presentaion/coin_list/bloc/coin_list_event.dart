sealed class CoinListEvent {}

class LoadInitialCoinEvent extends CoinListEvent {}

class RefreshCoinEvent extends CoinListEvent {}

class SearchCoinEvent extends CoinListEvent {
  final String query;
  SearchCoinEvent(this.query);
}
