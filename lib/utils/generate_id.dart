import 'package:uuid/uuid.dart';

String newUuidV4() {
  const uuid = Uuid();
  return uuid.v4();
}
