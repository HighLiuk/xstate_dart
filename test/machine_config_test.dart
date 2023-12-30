import 'package:test/test.dart';
import 'package:xstate_dart/src/machine_config.dart';
import 'package:xstate_dart/src/state_config.dart';

void main() {
  group('MachineConfig', () {
    test('should correctly initialize with initial and states', () {
      const initial = 'someState';
      const states = {'someState': StateConfig()};
      const config = MachineConfig(initial: initial, states: states);

      expect(config.initial, equals(initial));
      expect(config.states, equals(states));
    });

    test('should correctly initialize from map with initial and states', () {
      const initial = 'someState';
      const statesMap = {
        'someState': {
          'on': {
            'event': {'target': 'someTarget'}
          }
        }
      };
      final config =
          MachineConfig.fromMap({'initial': initial, 'states': statesMap});

      expect(config.initial, equals(initial));
      expect(config.states['someState']!.on!['event']!.target,
          equals('someTarget'));
    });

    test('should throw when initialized from map without initial', () {
      expect(() => MachineConfig.fromMap({'states': {}}),
          throwsA(isA<TypeError>()));
    });

    test('should throw when initialized from map without states', () {
      expect(() => MachineConfig.fromMap({'initial': 'someState'}),
          throwsA(isA<TypeError>()));
    });
  });
}
