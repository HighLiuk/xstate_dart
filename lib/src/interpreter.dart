import 'consts.dart';
import 'machine.dart';
import 'snapshot.dart';

class Interpreter {
  Interpreter({
    required this.machine,
  });

  final Machine machine;
  final List<Snapshot> history = [Snapshot.empty()];

  Snapshot get snapshot => history.last;
  String get state => snapshot.state;

  void start() => send(init);

  void send(String event) {
    final transition = machine.config.states[state]?.on[event];

    if (transition == null) {
      return;
    }

    final target = transition.target;
    if (target == null) {
      return;
    }

    history.add(Snapshot(
      state: target,
    ));
  }
}
