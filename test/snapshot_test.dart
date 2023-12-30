import 'package:test/test.dart';
import 'package:xstate_dart/src/snapshot.dart';
import 'package:xstate_dart/src/consts.dart';

void main() {
  group('Snapshot', () {
    test('should correctly initialize with state', () {
      const state = 'someState';
      const snapshot = Snapshot(state: state);

      expect(snapshot.state, equals(state));
    });

    test('should correctly initialize with empty constructor', () {
      const snapshot = Snapshot.empty();

      expect(snapshot.state, equals(notStarted));
    });
  });
}
