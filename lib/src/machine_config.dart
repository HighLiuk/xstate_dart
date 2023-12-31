import 'consts.dart';
import 'state_config.dart';

class MachineConfig {
  MachineConfig({
    required this.initial,
    required Map<String, StateConfig> states,
  }) : states = {
          notStarted: StateConfig.fromMap({
            'on': {
              init: initial,
            },
          }),
          ...states,
        } {
    assert(states.containsKey(initial));
  }

  final String initial;
  final Map<String, StateConfig> states;

  factory MachineConfig.fromMap(map) {
    assert(map is Map<String, dynamic>);
    assert(map['initial'] is String);
    assert(map['states'] is Map<String, dynamic>?);

    final Map<String, dynamic> states = map['states'] ?? {};

    return MachineConfig(
      initial: map['initial'],
      states: states.map((key, value) => MapEntry(
            key,
            StateConfig.fromMap(value),
          )),
    );
  }
}
