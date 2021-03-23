import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

import 'app/main_module.dart';

void main() async {
  await DotEnv().load('.env');
  runApp(
    ModularApp(module: AppModule()),
  );
}
