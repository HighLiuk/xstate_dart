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

      expect(config.on!['event']!.target, equals('someTarget'));
    });

    test('should return null on when initialized from map without on', () {
      final config = StateConfig.fromMap({});

      expect(config.on, isNull);
    });
  });
}
