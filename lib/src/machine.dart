import 'machine_config.dart';

class Machine {
  Machine({required config}) : config = MachineConfig.fromMap(config);

  final MachineConfig config;
}
