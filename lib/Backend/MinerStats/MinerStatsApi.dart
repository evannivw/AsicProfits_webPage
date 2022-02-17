import 'dart:convert';

import 'package:http/http.dart' as http;

class MinerStatsApi {
  Future getProfitability({String params = "algo=all"}) async {
    var url = Uri.parse(BASE_URL + "?" + params);
    print("miner stats url: " + url.toString());
    try {
      var response = await http.get(url);
      if (response.statusCode == 200) {
        var jsonResponse = jsonDecode(response.body);
        if (jsonResponse != null) {
          //print(jsonResponse);
          return jsonResponse;
        }
      } else {
        print('Request failed with status: ${response.statusCode}.');
      }
    } catch (e) {
      print(e);
    }
    return null;
  }
}

const BASE_URL = "https://api.minerstat.com/v2/coins";
