import 'package:test/test.dart';
import 'package:xstate_dart/src/state_config.dart';
import 'package:xstate_dart/src/transition_config.dart';

void main() {
  group('StateConfig', () {
    test('should correctly initialize with on', () {
      const on = {'event': TransitionConfig(target: 'someTarget')};
      const config = StateConfig(on: on);

      expect(config.on, equals(on));
    });

    test('should correctly initialize from map with on', () {
      const onMap = {
        'event': {'target': 'someTarget'}
      };
      final config = StateConfig.fromMap({'on': onMap});

      expect(config.on['event']!.target, equals('someTarget'));
    });

    test('should return empty map on when initialized from map without on', () {
      final config = StateConfig.fromMap({});

      expect(config.on, equals(const {}));
    });

    test('should throw when initialized from non-map', () {
      const notAMap = 'notAMap';

      expect(
          () => StateConfig.fromMap(notAMap), throwsA(isA<AssertionError>()));
    });

    test(
        'should throw when initialized from non-empty map that is not a Map<String, dynamic>',
        () {
      const notAMapOfStringToDynamic = {123: 'notAString'};

      expect(() => StateConfig.fromMap(notAMapOfStringToDynamic),
          throwsA(isA<AssertionError>()));
    });

    test(
        'should throw when initialized from map with non-Map<String, dynamic> on',
        () {
      const mapWithNonMapOn = {'on': 'notAMap'};

      expect(() => StateConfig.fromMap(mapWithNonMapOn),
          throwsA(isA<AssertionError>()));
    });
  });
}
