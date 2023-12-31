class MachineOptions {
  const MachineOptions({
    this.guards = const {},
  });

  final Map<String, bool Function()> guards;
}
