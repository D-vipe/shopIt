import 'dart:io';

import 'package:flutter_test/flutter_test.dart';
import 'package:shop_it/resources/resources.dart';

void main() {
  test('app_icons assets test', () {
    expect(File(AppIcons.appIcon).existsSync(), true);
  });
}
