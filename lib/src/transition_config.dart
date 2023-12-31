class TransitionConfig {
  const TransitionConfig({
    this.target,
  });

  final String? target;

  factory TransitionConfig.fromMap(map) => map is String
      ? TransitionConfig(target: map)
      : TransitionConfig(
          target: map['target'] as String?,
        );
}
