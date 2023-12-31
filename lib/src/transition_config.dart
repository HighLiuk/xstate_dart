class TransitionConfig {
  const TransitionConfig({
    this.target,
    this.guards = const [],
  });

  final String? target;
  final List<String> guards;

  factory TransitionConfig.fromMap(map) => map is String
      ? TransitionConfig(target: map)
      : TransitionConfig(
          target: map['target'] as String?,
          guards: map['guards'] as List<String>? ?? [],
        );
}
