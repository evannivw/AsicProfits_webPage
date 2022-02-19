import 'dart:math';

import 'package:asic_miner_website/Models/MinerModel.dart';

class MinerServiceHelper {
  num getMinerHashrate(MinerModel miner) {
    num hash = num.tryParse(miner.hashrate) ?? 0;
    //print(miner.hashrateUnits);
    switch (miner.hashrateUnits.toLowerCase()) {
      case "h/s":
        hash = hash * 1;
        break;
      case "kh/s":
        hash = hash * 1000;
        break;
      case "mh/s":
        hash = hash * 1000000;
        break;
      case "gh/s":
        hash = hash * 1000000000;
        break;
      case "th/s":
        hash = hash * 1000000000000;
        break;
    }
    return hash;
  }

  List<num> calculateProfitability(MinerModel miner, dynamic data) {
    num profit = -1000;
    num electricityCost = 0;
    try {
      num net_hash = data["network_hashrate"];
      num reward_block = data["reward_block"];
      num net_difficulty = data["difficulty"];
      num miner_hash = getMinerHashrate(miner);

      num diff = net_difficulty * pow(2, 32);
      //print("diff: " + diff.toString());
      num calculatedProfit_coins = (reward_block * miner_hash * 86400) / diff;
      num calculatedProfit = data["price"] * calculatedProfit_coins;
      num cost = ((num.tryParse(miner.power) ?? 0) / 1000) * 24;
      electricityCost = cost * miner.costPerKW;
      num currentProfit = calculatedProfit - electricityCost;
      //print("calculatedProfit_coins: " + calculatedProfit_coins.toString());
      //print("calculatedProfit: " + calculatedProfit.toString());
      //print("currentProfit: " + currentProfit.toString());
      if (net_hash > 0) {
        profit = currentProfit;
        /*print(cost_dollars);
        print(calculatedProfit);
        print(miner_hash);*/
        print("Coin: " + data["coin"]);
        print("Power cost: \$" + electricityCost.toString());
        print("Income: \$" + calculatedProfit.toString());
        print("Profit: \$" + profit.toString());
      }
    } catch (e) {
      print(data);
      print("calculo error: " + e.toString());
    }
    return [profit, electricityCost];
  }
}
