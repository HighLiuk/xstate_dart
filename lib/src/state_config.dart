import 'transition_config.dart';

class StateConfig {
  const StateConfig({
    this.on,
  });

  final Map<String, TransitionConfig>? on;

  StateConfig.fromMap(map)
      : on = (map['on'] as Map?)?.map(
          (key, value) => MapEntry(key, TransitionConfig.fromMap(value)),
        );
}
