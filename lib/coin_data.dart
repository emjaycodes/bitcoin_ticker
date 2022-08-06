import 'package:http/http.dart' as http;
import 'dart:convert';
import 'price_screen.dart';



const List<String> currenciesList = [
  'AUD',
  'BRL',
  'CAD',
  'CNY',
  'EUR',
  'GBP',
  'HKD',
  'IDR',
  'ILS',
  'INR',
  'JPY',
  'MXN',
  'NOK',
  'NZD',
  'PLN',
  'RON',
  'RUB',
  'SEK',
  'SGD',
  'USD',
  'ZAR'
];

const List<String> cryptoList = [
  'BTC',
  'ETH',
  'LTC',
];



const apiKey = 'B079250B-E4AB-4E11-8DFE-629D110F3D8F';
const coinAPIURL = 'https://rest.coinapi.io/v1/exchangerate';




class CoinData {

Future<dynamic> getRate () async {
  String requestURL = '$coinAPIURL/BTC/USD?apikey=$apiKey';

  http.Response response = await http.get(Uri.parse(requestURL)); 
print (response.body);

if (response.statusCode == 200){
  String data = response.body;

  var decodedData = jsonDecode(response.body);
  var rate = decodedData['rate'];
  print(rate);

  return rate;

}else{
  print(response.statusCode);
        throw 'Problem with the get request';

}
}

}