class AdminCalculatorController
{
  double _electricity = 0;
  double _hashrate = 0;
  double _consumption = 0;
  double _electrityCost = 0;

  void calculateElectricityCost({int multiplier = 1})
  {
    _electrityCost = _electricity * _consumption * multiplier;
  }

  void calculate()
  {
    
  }

}