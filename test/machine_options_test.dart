import 'package:test/test.dart';
import 'package:xstate_dart/src/machine_options.dart';

void main() {
  group('MachineOptions', () {
    test('should correctly initialize with guards', () {
      final guards = {'someGuard': () => true};
      final options = MachineOptions(guards: guards);

      expect(options.guards, equals(guards));
    });

    test('should correctly initialize with empty constructor', () {
      const options = MachineOptions();

      expect(options.guards, equals({}));
    });

    test('should correctly evaluate guard function', () {
      final guards = {'someGuard': () => true};
      final options = MachineOptions(guards: guards);

      expect(options.guards['someGuard']!(), isTrue);
    });
  });
}
