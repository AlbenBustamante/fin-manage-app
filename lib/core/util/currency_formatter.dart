import 'package:intl/intl.dart';

class CurrencyFormatter {
  static final _formatter = NumberFormat.currency(symbol: '\$');

  static String format(int number) {
    return _formatter.format(number);
  }
}
