// Package imports:
import 'package:hive_flutter/hive_flutter.dart';

// Project imports:

class HiveService {
  // static late Box users;
  // static late Box profile;

  static Future<void> init() async {
    await Hive.initFlutter();

    // users = await Hive.openBox<User>('users');
  }
}
