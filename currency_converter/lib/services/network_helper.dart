import 'package:http/http.dart' as http;
import 'dart:convert';

class NetworkHelper {
  String base = '';
  String address = '';
  String url = 'https://cdn.jsdelivr.net/gh/fawazahmed0/currency-api@1/latest/currencies/eur/jpy.json';
  var decodedData;
  var rate ;
  String date = '';


  Future<dynamic> getLatestConvertRate(String base, String address) async {
    this.base = base;
    this.address = address;
    var response = await http.get(Uri.parse(
        'https://cdn.jsdelivr.net/gh/fawazahmed0/currency-api@1/latest/currencies/$base/$address.json'));
    if (response.statusCode == 200) {
      decodedData = jsonDecode(response.body);
      rate = decodedData['$address'];
      date = decodedData['date'];
      print(date);
    } else {
      print(response.statusCode);
    }
  }


  void getRateAddress(){
    return rate;
  }



}
void main() async {
  NetworkHelper networkHelper = NetworkHelper();
  var n = await networkHelper.getLatestConvertRate('usd', 'idr');
  print(networkHelper.decodedData['date']);//get rate,amount*rate = results
}