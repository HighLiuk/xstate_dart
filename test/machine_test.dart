import 'package:test/test.dart';
import 'package:xstate_dart/src/machine.dart';
import 'package:xstate_dart/src/machine_options.dart';

void main() {
  group('Machine', () {
    test('should correctly initialize with config', () {
      const initial = 'someState';
      const statesMap = {
        'someState': {
          'on': {
            'event': {'target': 'someTarget'}
          }
        }
      };
      const configMap = {'initial': initial, 'states': statesMap};
      final machine = Machine(config: configMap);

      expect(machine.config.initial, equals(initial));
      expect(machine.config.states['someState']!.on['event']!.target,
          equals('someTarget'));
      expect(machine.options.guards, equals({}));
    });

    test('should correctly initialize with config and options', () {
      const initial = 'someState';
      const statesMap = {
        'someState': {
          'on': {
            'event': {'target': 'someTarget'}
          }
        }
      };
      const configMap = {'initial': initial, 'states': statesMap};
      final options = MachineOptions(guards: {'someGuard': () => true});
      final machine = Machine(config: configMap, options: options);

      expect(machine.config.initial, equals(initial));
      expect(machine.config.states['someState']!.on['event']!.target,
          equals('someTarget'));
      expect(machine.options.guards['someGuard']!(), isTrue);
    });

    test('should throw when initialized with config without initial', () {
      expect(() => Machine(config: {'states': {}}),
          throwsA(isA<AssertionError>()));
    });

    test('should throw when initialized with config without states', () {
      expect(() => Machine(config: {'initial': 'someState'}),
          throwsA(isA<AssertionError>()));
    });
  });
}
