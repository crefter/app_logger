import 'package:proxima_logger/proxima_logger.dart';

final class CRLoggerWrapper extends ProximaLogger {
  CRLoggerWrapper._();

  static final CRLoggerWrapper instance = CRLoggerWrapper._();
}
