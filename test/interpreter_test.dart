import 'package:test/test.dart';
import 'package:xstate_dart/src/interpreter.dart';
import 'package:xstate_dart/src/machine.dart';
import 'package:xstate_dart/src/consts.dart';

void main() {
  group('Interpreter', () {
    test('should correctly initialize with machine', () {
      final machine = Machine(config: {
        'initial': 'someState',
        'states': {
          'someState': {
            'on': {
              'event': {'target': 'someTarget'}
            }
          }
        }
      });
      final interpreter = Interpreter(machine: machine);

      expect(interpreter.machine, equals(machine));
      expect(interpreter.state, equals(notStarted));
    });

    test('should correctly transition to initial state on start', () {
      final machine = Machine(config: {
        'initial': 'someState',
        'states': {
          'someState': {
            'on': {
              'event': {'target': 'someTarget'}
            }
          }
        }
      });
      final interpreter = Interpreter(machine: machine);

      interpreter.start();

      expect(interpreter.state, equals('someState'));
    });

    test('should correctly transition to target state on send', () {
      final machine = Machine(config: {
        'initial': 'someState',
        'states': {
          'someState': {
            'on': {
              'event': {'target': 'someTarget'}
            }
          },
          'someTarget': {}
        }
      });
      final interpreter = Interpreter(machine: machine);

      interpreter.start();
      interpreter.send('event');

      expect(interpreter.state, equals('someTarget'));
    });

    test('should not transition on send with nonexistent event', () {
      final machine = Machine(config: {
        'initial': 'someState',
        'states': {
          'someState': {
            'on': {
              'event': {'target': 'someTarget'}
            }
          },
          'someTarget': {}
        }
      });
      final interpreter = Interpreter(machine: machine);

      interpreter.start();
      interpreter.send('nonexistentEvent');

      expect(interpreter.state, equals('someState'));
    });
  });

  test('should correctly determine if an event can be sent', () {
    final machine = Machine(config: {
      'initial': 'someState',
      'states': {
        'someState': {
          'on': {
            'event': {'target': 'someTarget'}
          }
        },
        'someTarget': {}
      }
    });
    final interpreter = Interpreter(machine: machine);

    expect(interpreter.can('event'), isFalse);
    expect(interpreter.can('nonexistentEvent'), isFalse);
    expect(interpreter.can(init), isTrue);

    interpreter.start();

    expect(interpreter.can('event'), isTrue);
    expect(interpreter.can('nonexistentEvent'), isFalse);
    expect(interpreter.can(init), isFalse);
  });
}
