import 'state_config.dart';

class MachineConfig {
  MachineConfig({
    required this.initial,
    required this.states,
  }) {
    assert(states.containsKey(initial));
  }

  final String initial;
  final Map<String, StateConfig> states;

  factory MachineConfig.fromMap(map) => MachineConfig(
        initial: map['initial'] as String,
        states: (map['states'] as Map).map(
          (key, value) => MapEntry(key, StateConfig.fromMap(value)),
        ),
      );
}
