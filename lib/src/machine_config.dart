import 'state_config.dart';

class MachineConfig {
  const MachineConfig({
    required this.initial,
    required this.states,
  });

  final String initial;
  final Map<String, StateConfig> states;

  MachineConfig.fromMap(map)
      : initial = map['initial'] as String,
        states = (map['states'] as Map).map(
          (key, value) => MapEntry(key, StateConfig.fromMap(value)),
        );
}
