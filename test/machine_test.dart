import 'package:test/test.dart';
import 'package:xstate_dart/src/machine.dart';

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
      expect(machine.config.states['someState']!.on!['event']!.target,
          equals('someTarget'));
    });

    test('should throw when initialized with config without initial', () {
      expect(() => Machine(config: {'states': {}}), throwsA(isA<TypeError>()));
    });

    test('should throw when initialized with config without states', () {
      expect(() => Machine(config: {'initial': 'someState'}),
          throwsA(isA<TypeError>()));
    });
  });
}
