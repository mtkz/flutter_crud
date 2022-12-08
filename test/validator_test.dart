// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility in the flutter_test package. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'package:flutter_crud/data/validator/form_validator.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('check of validatio - ', () {
    test('testing of inputValidator', () {
      const String inputText = '';

      final value = Validator.inputValidator(inputText);

      expect(value, "Required Input");
    });

    test('testing of phoneNumberInputValidator', () {
      const String inputText = '09123456789';

      final value = Validator.phoneNumberInputValidator(inputText);

      expect(value, "Phone Number Must be 10 Character");
    });

    test('testing of emailInputValidator', () {
      const String inputText = 'testtesttest';

      final value = Validator.emailInputValidator(inputText);

      expect(value, "Email Not Valid");
    });

    test('testing of birthInputValidator', () {
      const String inputText = '55664499';
      const int length = 4;

      final value = Validator.birthInputValidator(inputText, length);

      expect(value, "Must be $length Character");
    });
  });
}
