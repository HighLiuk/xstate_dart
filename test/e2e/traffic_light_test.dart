import 'package:test/test.dart';
import 'package:xstate_dart/src/consts.dart';
import 'package:xstate_dart/src/interpreter.dart';
import 'package:xstate_dart/src/machine.dart';

void main() {
  group('Traffic Light Machine and Interpreter E2E', () {
    final machine = Machine(
      config: {
        'initial': 'red',
        'states': {
          'red': {
            'on': {
              'CHANGE': 'green',
            },
          },
          'green': {
            'on': {
              'CHANGE': 'yellow',
            },
          },
          'yellow': {
            'on': {
              'CHANGE': 'red',
            },
          },
        },
      },
    );

    test('should correctly transition between states on send', () {
      final interpreter = Interpreter(machine: machine);

      expect(interpreter.state, equals(notStarted));
      interpreter.start();
      expect(interpreter.state, equals('red'));
      interpreter.send('CHANGE');
      expect(interpreter.state, equals('green'));
      interpreter.send('CHANGE');
      expect(interpreter.state, equals('yellow'));
      interpreter.send('CHANGE');
      expect(interpreter.state, equals('red'));
      interpreter.send('BEEP');
      expect(interpreter.state, equals('red'));
    });
  });
}
