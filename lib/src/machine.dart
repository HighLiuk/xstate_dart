import 'machine_config.dart';
import 'machine_options.dart';

class Machine {
  Machine({
    required config,
    this.options = const MachineOptions(),
  }) : config = MachineConfig.fromMap(config);

  final MachineConfig config;
  final MachineOptions options;
}
