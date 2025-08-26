import 'dart:io';

import 'package:flutter_test/flutter_test.dart';
import 'package:tea_delivery/resources/resources.dart';

void main() {
  test('images assets test', () {
    expect(File(Images.teaExample).existsSync(), isTrue);
  });
}
