import 'package:cr_logger/cr_logger.dart';
import 'package:cr_logger/src/managers/log_manager.dart';
import 'package:proxima_logger/proxima_logger.dart';

final class CRLoggerWrapper extends ProximaLogger {
  CRLoggerWrapper._();

  static final CRLoggerWrapper instance = CRLoggerWrapper._();

  @override
  void log(ILogType type, {String? title, error, StackTrace? stack, message}) {
    super.log(type, title: title, error:  error, stack:  stack, message:  message);
    _addToLogWidget(type, message, stack.toString());
  }

  void _addToLogWidget(
      ILogType type,
      dynamic message,
      String? stacktrace,
      ) {
    final logModel = LogBean(
      message: message ?? '',
      time: DateTime.now(),
      stackTrace: stacktrace ?? '',
      type: type,
    );
    switch (logModel.type) {
      case LogType.request:
        break;
      case LogType.debug:
        LogManager.instance.addDebug(logModel);
        break;
      case LogType.info:
        LogManager.instance.addInfo(logModel);
        break;
      case LogType.error:
        LogManager.instance.addError(logModel);
        break;
      default:
        break;
    }
  }
}