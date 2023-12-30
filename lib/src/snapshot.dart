import 'consts.dart';

class Snapshot {
  const Snapshot({
    required this.state,
  });

  final String state;

  const Snapshot.empty() : state = notStarted;
}
