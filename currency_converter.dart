import 'api_service.dart'; // добавьте эту строку

class CurrencyConverter {
  final String baseCurrency;
  final String targetCurrency;

  CurrencyConverter({required this.baseCurrency, required this.targetCurrency});

  Future<double> getExchangeRate() async {
    return await ApiService.fetchExchangeRate(baseCurrency, targetCurrency);
  }
}
