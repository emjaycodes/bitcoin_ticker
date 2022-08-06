import 'package:flutter/material.dart';
import 'coin_data.dart';
import 'package:flutter/cupertino.dart';
import 'dart:io' show Platform;
import 'package:http/http.dart';

class PriceScreen extends StatefulWidget {
  const PriceScreen({Key? key}) : super(key: key);

  @override
  _PriceScreenState createState() => _PriceScreenState();
}

class _PriceScreenState extends State<PriceScreen> {

  String selectedCurrency = 'AUD';

  DropdownButton<String> androidDropdown(){
    
    List<DropdownMenuItem<String>> dropdownItems = [];

  for (String currency in currenciesList){
    
    var newItem = DropdownMenuItem(
      value: currency,
      child: Text(currency),
      );

      dropdownItems.add(newItem);
      
  }
  
    return DropdownButton<String>(
              value: selectedCurrency,
              items: dropdownItems,
               onChanged: (value){
              setState(() {
                selectedCurrency = value!; // check later for null
              });
            }
            );

  } // this is a function that creates a list for currencies for android

  CupertinoPicker iOSPicker(){
    List<DropdownMenuItem<String>> pickerItems = [];
  for (String currency in currenciesList){
    var newItem = DropdownMenuItem(
      value: currency,
      child: Text(currency),
    );

    pickerItems.add(newItem);
  } 

    return CupertinoPicker(
              backgroundColor: Colors.lightBlue,
              itemExtent: 32.0, onSelectedItemChanged: (selectedIndex){
              print(selectedIndex);
              setState(() {
                selectedCurrency = currenciesList[selectedIndex];
              });
              
              },
               children: pickerItems,
            );
  } 


  String bitcoinValueInUSD = '?';

  void getData() async {
    try {
      double data = await CoinData().getRate();
      //13. We can't await in a setState(). So you have to separate it out into two steps.
      setState(() {
        bitcoinValueInUSD = data.toStringAsFixed(0);
      });
    } catch (e) {
      print("here is the 3 problem");
    }
  }


   @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getData();
  }  

  @override
  Widget build(BuildContext context) {
    // getDropdownItems();
    return Scaffold(
      appBar: AppBar(
        title: const Text('🤑 Coin Ticker'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.fromLTRB(18.0, 18.0, 18.0, 0),
            child: Card(
              color: Colors.lightBlueAccent,
              elevation: 5.0,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10.0),
              ),
              child:  Padding(
                padding: const EdgeInsets.symmetric(vertical: 15.0, horizontal: 28.0),
                child: Text(
                   '1 BTC = $bitcoinValueInUSD $selectedCurrency',
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                    fontSize: 20.0,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ),
          Container(
            height: 150.0,
            alignment: Alignment.center,
            padding: const EdgeInsets.only(bottom: 30.0),
            color: Colors.lightBlue,
            child: Platform.isIOS ? iOSPicker() : androidDropdown(), // tenary operation that checks if the device is an iphone or an android device
          ),
        ],
      ),
    );
  }
}



