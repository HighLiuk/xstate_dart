import 'utils/parse.dart';

class TransitionConfig {
  const TransitionConfig({
    this.target,
    this.guards = const [],
    this.actions = const [],
  });

  final String? target;
  final List<String> guards;
  final List<String> actions;

  factory TransitionConfig.fromMap(map) {
    if (map is String?) {
      return TransitionConfig(target: map);
    }

    assert(map is Map);
    assert(map is Map<String, dynamic> || (map as Map).isEmpty);
    assert(map['target'] is String?);
    assert(map['guards'] is List<String> || map['guards'] is String?);
    assert(map['actions'] is List<String> || map['actions'] is String?);

    return TransitionConfig(
      target: map['target'],
      guards: toStrings(map['guards']),
      actions: toStrings(map['actions']),
    );
  }
}
