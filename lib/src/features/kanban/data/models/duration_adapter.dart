import 'package:hive/hive.dart';
import 'package:kanban_time_board/src/core/constants/hive_type_id_keys.dart';

class DurationAdapter extends TypeAdapter<Duration> {
  @override
  final int typeId = HiveTypeIdKeys.durationIdKey;

  @override
  Duration read(BinaryReader reader) {
    return Duration(microseconds: reader.readInt());
  }

  @override
  void write(BinaryWriter writer, Duration obj) {
    writer.writeInt(obj.inMicroseconds);
  }
}
