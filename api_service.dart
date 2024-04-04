import 'dart:convert';
import 'package:http/http.dart' as http;

class ApiService {
  static const String apiKey = 'fca_live_dMKvpNb9U4rYMFw1RHG5H9j5HA3PFSGavjbgJqro';
  static const String baseUrl = 'https://api.freecurrencyapi.com/v1/latest?apikey=fca_live_dMKvpNb9U4rYMFw1RHG5H9j5HA3PFSGavjbgJqro';

  static Future<double> fetchExchangeRate(String baseCurrency, String targetCurrency) async {
    try {
      final response = await http.get(Uri.parse('$baseUrl&base=$baseCurrency&symbols=$targetCurrency'));

      if (response.statusCode == 200) {
        final data = json.decode(response.body);
        return data['rates'][targetCurrency];
      } else {
        throw Exception('Failed to load exchange rate: ${response.statusCode}');
      }
    } catch (e) {
      throw Exception('Failed to connect to the server: $e');
    }
  }
}
