import 'coin_data.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';




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
const url = 'https://rest.coinapi.io/v1/exchangerate/BTC/USD?apikey$apiKey';




class CoinData {}