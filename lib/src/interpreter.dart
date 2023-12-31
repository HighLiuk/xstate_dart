import 'consts.dart';
import 'machine.dart';
import 'snapshot.dart';
import 'transition_config.dart';

class Interpreter {
  Interpreter({
    required this.machine,
  });

  final Machine machine;
  final List<Snapshot> history = [Snapshot.empty()];

  Snapshot get snapshot => history.last;
  String get state => snapshot.state;

  void start() => send(init);

  bool can(String event) {
    final transition = getTransition(event);

    if (transition == null) {
      return false;
    }

    return true;
  }

  void _transition(TransitionConfig transition) {
    final target = transition.target;
    if (target == null) {
      return;
    }

    history.add(Snapshot(
      state: target,
    ));
  }

  void send(String event) {
    if (can(event)) {
      _transition(getTransition(event)!);
    }
  }

  TransitionConfig? getTransition(String event) =>
      machine.config.states[state]?.on[event];
}
