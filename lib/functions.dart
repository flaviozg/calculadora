class Functions {
  static const operations = const ['/', '+', '-', 'x', '='];
  String _operation;
  bool _isOperation = false;
  final _values = [0.0, 0.0];
  int _valuesIndex = 0;

  String result = '0';

  Functions() {
    _clear();
  }

  void _clear() {
    result = '0';
    _values.setAll(0, [0.0, 0.0]);
    _valuesIndex = 0;
    _operation = null;
    _isOperation = false;
  }

  void _calcPercent() {
    if (_valuesIndex == 0) {
      result = (_values[0] / 100).toString();
    } else {
      _values[1] = _values[0] * (_values[1] / 100);
      result = (_values[1]).toString();
    }
  }

  void _invertValue() {
    _values[0] = _values[0] * (-1);
    result = (_values[0]).toString();

    // if (_valuesIndex == 0) {
    //   _values[0] = _values[0] * (-1);
    //   result = (_values[0]).toString();
    // } else {
    //   _values[1] = _values[1] * (-1);
    //   result = (_values[1]).toString();
    // }
  }

  void execButton(String value) {
    if (value == ',') {
      value = '.';
    }

    if (value == 'AC') {
      _clear();
    } else if (value == '%') {
      _calcPercent();
    } else if (value == '±') {
      _invertValue();
    } else if (operations.contains(value)) {
      _doOperation(value);
    } else {
      _addCharacter(value);
    }
  }

  void _addCharacter(String digit) {
    if (_isOperation) result = '0';

    if (result.contains(',') && digit == ',') digit = '';
    if (result == '0' && digit != ',') result = '';

    result += digit;
    _values[_valuesIndex] = double.tryParse(result);
    _isOperation = false;
  }

  void _doOperation(String operation) {
    if (_isOperation && operation == _operation) return;

    if (_valuesIndex == 0) {
      _valuesIndex = 1;
    } else {
      _values[0] = _calculate();
    }

    if (operation != '=') _operation = operation;

    result = _values[0].toString();
    result = result.endsWith('.0') ? result.split('.')[0] : result;

    _isOperation = true;
  }

  double _calculate() {
    switch (_operation) {
      case '%':
        return _values[0] * (_values[1] / 100);
      case '÷':
        return _values[0] / _values[1];
      case 'x':
        return _values[0] * _values[1];
      case '+':
        return _values[0] + _values[1];
      case '-':
        return _values[0] - _values[1];
      default:
        return 0.0;
    }
  }
}
