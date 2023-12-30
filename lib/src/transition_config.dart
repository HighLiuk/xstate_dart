class TransitionConfig {
  const TransitionConfig({
    this.target,
  });

  final String? target;

  TransitionConfig.fromMap(map)
      : target = map is String ? map : map['target'] as String?;
}
