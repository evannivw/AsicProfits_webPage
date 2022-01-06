class FontSizes
{
  const FontSizes(this._value);
  final double _value;

  ///el valor de la fuente en double
  double getValue()
  {
    return _value;
  }
  static const xxxs = FontSizes(9);
  static const xxs = FontSizes(11);
  static const xs = FontSizes(12);
  static const s = FontSizes(14);
  static const m = FontSizes(16);
  static const l = FontSizes(20);
  static const xl = FontSizes(22);
  static const xxl = FontSizes(24);

}