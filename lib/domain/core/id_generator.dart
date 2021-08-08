import 'package:uuid/uuid.dart';

final _uuid = Uuid();
String generateId() => _uuid.v4();