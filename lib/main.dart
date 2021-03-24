import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'app/main_module.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart' as DotEnv;

void main() async {
  await DotEnv.load();
  runApp(
    ModularApp(module: AppModule()),
  );
}
