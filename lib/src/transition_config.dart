class TransitionConfig {
  const TransitionConfig({
    this.target,
    this.guards = const [],
    this.actions = const [],
  });

  final String? target;
  final List<String> guards;
  final List<String> actions;

  factory TransitionConfig.fromMap(map) => map is String
      ? TransitionConfig(target: map)
      : TransitionConfig(
          target: map['target'] as String?,
          guards: map['guards'] as List<String>? ?? [],
          actions: map['actions'] as List<String>? ?? [],
        );
}
