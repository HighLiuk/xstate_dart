import 'package:test/test.dart';
import 'package:xstate_dart/src/consts.dart';
import 'package:xstate_dart/src/interpreter.dart';
import 'package:xstate_dart/src/machine.dart';

void main() {
  group('Machine and Interpreter E2E', () {
    final machine = Machine(
      config: {
        'initial': 'off',
        'states': {
          'off': {
            'on': {
              'TOGGLE': 'on',
            },
          },
          'on': {
            'on': {
              'TOGGLE': 'off',
            },
          },
        },
      },
    );

    test('should correctly transition between states on send', () {
      final interpreter = Interpreter(machine: machine);

      expect(interpreter.state, equals(notStarted));
      interpreter.start();
      expect(interpreter.state, equals('off'));
      interpreter.send('TOGGLE');
      expect(interpreter.state, equals('on'));
      interpreter.send('TOGGLE');
      expect(interpreter.state, equals('off'));
      interpreter.send('TOGGLE');
      expect(interpreter.state, equals('on'));
      interpreter.send('NOT_EXISTING_EVENT');
      expect(interpreter.state, equals('on'));
      interpreter.send('TOGGLE');
      expect(interpreter.state, equals('off'));
    });
  });
}
