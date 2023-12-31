import 'package:test/test.dart';
import 'package:xstate_dart/src/utils/parse.dart';

void main() {
  group('toStrings', () {
    test('should correctly convert a string to a list of strings', () {
      const value = 'someString';
      final result = toStrings(value);

      expect(result, equals([value]));
    });

    test(
        'should correctly return the same list if the value is a list of strings',
        () {
      const value = ['someString', 'anotherString'];
      final result = toStrings(value);

      expect(result, equals(value));
    });

    test(
        'should correctly return an empty list if the value is not a string or a list of strings',
        () {
      const value = 123;
      final result = toStrings(value);

      expect(result, equals([]));
    });
  });
}
