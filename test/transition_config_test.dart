import 'package:test/test.dart';
import 'package:xstate_dart/src/transition_config.dart';

void main() {
  group('TransitionConfig', () {
    test('should correctly initialize with target', () {
      const target = 'someTarget';
      const config = TransitionConfig(target: target);

      expect(config.target, equals(target));
    });

    test('should correctly initialize from map with target', () {
      const target = 'someTarget';
      final config = TransitionConfig.fromMap({'target': target});

      expect(config.target, equals(target));
    });

    test('should correctly initialize from map with string', () {
      const target = 'someTarget';
      final config = TransitionConfig.fromMap(target);

      expect(config.target, equals(target));
    });

    test('should return null target when initialized from map without target',
        () {
      final config = TransitionConfig.fromMap({});

      expect(config.target, isNull);
    });
  });
}
