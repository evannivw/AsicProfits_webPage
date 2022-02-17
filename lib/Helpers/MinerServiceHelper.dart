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
    num profit = 0;
    num electricityCost = 0;
    try {
      num net_hash = data["network_hashrate"] ?? 0;
      num reward_block = data["reward_block"] ?? 0;
      num net_difficulty = data["difficulty"];
      num miner_hash = getMinerHashrate(miner);
      num diff = net_difficulty * pow(2, 32);
      //print("diff: " + diff.toString());
      num calculatedProfit_coins = (reward_block * miner_hash * 86400) / diff;
      num calculatedProfit = data["price"] * calculatedProfit_coins;
      num cost = ((num.tryParse(miner.power) ?? 0) / 1000) * 24;
      electricityCost = cost * miner.costPerKW;
      num currentProfit = calculatedProfit - electricityCost;
      if (profit < currentProfit && net_hash > 0) {
        profit = currentProfit;
        /*print(cost_dollars);
        print(calculatedProfit);
        print(miner_hash);*/
        print("coin: " + data["coin"]);
        print("power cost: \$" + electricityCost.toString());
        print("current profit: \$" + calculatedProfit.toString());
        print("new profit: \$" + profit.toString());
      }
    } catch (e) {
      print(e);
    }
    return [profit, electricityCost];
  }
}
