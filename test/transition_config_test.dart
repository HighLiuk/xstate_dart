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

    test('should correctly initialize with guards', () {
      const guards = ['someGuard'];
      final config = TransitionConfig(target: 'someTarget', guards: guards);

      expect(config.guards, equals(guards));
    });

    test('should correctly initialize from map with guards', () {
      const guards = ['someGuard'];
      final config =
          TransitionConfig.fromMap({'target': 'someTarget', 'guards': guards});

      expect(config.guards, equals(guards));
    });

    test('should correctly initialize from map without guards', () {
      final config = TransitionConfig.fromMap({'target': 'someTarget'});

      expect(config.guards, equals([]));
    });

    test('should correctly initialize from string without guards', () {
      final config = TransitionConfig.fromMap('someTarget');

      expect(config.guards, equals([]));
    });

    test('should correctly initialize with actions', () {
      const actions = ['someAction'];
      const config = TransitionConfig(target: 'someTarget', actions: actions);

      expect(config.actions, equals(actions));
    });

    test('should correctly initialize from map with actions', () {
      const actions = ['someAction'];
      final config = TransitionConfig.fromMap({
        'target': 'someTarget',
        'actions': actions,
      });

      expect(config.actions, equals(actions));
    });

    test('should correctly initialize from map without actions', () {
      final config = TransitionConfig.fromMap({'target': 'someTarget'});

      expect(config.actions, equals([]));
    });

    test('should correctly initialize from string without actions', () {
      final config = TransitionConfig.fromMap('someTarget');

      expect(config.actions, equals([]));
    });

    test('should throw when initialized from non-map and non-string', () {
      const notAMapOrString = 123;

      expect(() => TransitionConfig.fromMap(notAMapOrString),
          throwsA(isA<AssertionError>()));
    });

    test('should throw when initialized from map with non-string target', () {
      const mapWithNonStringTarget = {
        'target': 123,
      };

      expect(() => TransitionConfig.fromMap(mapWithNonStringTarget),
          throwsA(isA<AssertionError>()));
    });

    test(
        'should throw when initialized from map with non-list and non-string guards',
        () {
      const mapWithNonListNonStringGuards = {
        'target': 'someTarget',
        'guards': 123,
      };

      expect(() => TransitionConfig.fromMap(mapWithNonListNonStringGuards),
          throwsA(isA<AssertionError>()));
    });

    test(
        'should throw when initialized from map with non-list and non-string actions',
        () {
      const mapWithNonListNonStringActions = {
        'target': 'someTarget',
        'actions': 123,
      };

      expect(() => TransitionConfig.fromMap(mapWithNonListNonStringActions),
          throwsA(isA<AssertionError>()));
    });

    test('should correctly initialize from map with string guards', () {
      const guards = 'someGuard';
      final config = TransitionConfig.fromMap({
        'target': 'someTarget',
        'guards': guards,
      });

      expect(config.guards, equals([guards]));
    });

    test('should correctly initialize from map with string actions', () {
      const actions = 'someAction';
      final config = TransitionConfig.fromMap({
        'target': 'someTarget',
        'actions': actions,
      });

      expect(config.actions, equals([actions]));
    });

    test(
        'should correctly initialize from string with string guards and actions',
        () {
      const target = 'someTarget';
      const guards = 'someGuard';
      const actions = 'someAction';
      final config = TransitionConfig.fromMap({
        'target': target,
        'guards': guards,
        'actions': actions,
      });

      expect(config.target, equals(target));
      expect(config.guards, equals([guards]));
      expect(config.actions, equals([actions]));
    });
  });
}
