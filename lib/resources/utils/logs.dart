import 'dart:convert';

import 'package:flutter/cupertino.dart';

class Logs {
  printJson({@required Map json}) {
    JsonEncoder encoder = new JsonEncoder.withIndent('  ');
    String prettyint = encoder.convert(json);
    print("LOGGING: " + prettyint);
  }

  printLog({@required string}) {
    print("LOGGING: " + string);
  }
}
