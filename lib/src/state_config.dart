import 'transition_config.dart';

class StateConfig {
  const StateConfig({
    this.on = const {},
  });

  final Map<String, TransitionConfig> on;

  factory StateConfig.fromMap(map) {
    assert(map is Map);
    assert(map is Map<String, dynamic> || (map as Map).isEmpty);
    assert(map['on'] is Map<String, dynamic>?);

    final Map<String, dynamic>? on = map['on'];

    if (on == null) {
      return const StateConfig();
    }

    return StateConfig(
      on: on.map((key, value) => MapEntry(
            key,
            TransitionConfig.fromMap(value),
          )),
    );
  }
}
