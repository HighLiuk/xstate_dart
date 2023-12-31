class MachineOptions {
  const MachineOptions({
    this.guards = const {},
    this.actions = const {},
  });

  final Map<String, bool Function()> guards;
  final Map<String, void Function()> actions;
}
