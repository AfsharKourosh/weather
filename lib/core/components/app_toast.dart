import 'package:flutter/material.dart';

import 'toast_type.dart';

abstract final class AppToast {
 

  static final GlobalKey<ScaffoldMessengerState> _messengerKey =
      GlobalKey<ScaffoldMessengerState>();

  static GlobalKey<ScaffoldMessengerState> get messengerKey =>
      _messengerKey;

  static void show({
    required String message,
    ToastType type = ToastType.info,
    Color? textColor,
    Color? backgroundColor,
    Duration duration = const Duration(seconds: 3),
  }) {
    final messenger = _messengerKey.currentState;

    if (messenger == null) return;

    final bgColor = backgroundColor ?? _getBackgroundColor(type);
    final icon = _getIcon(type);

    messenger
      ..hideCurrentSnackBar()
      ..showSnackBar(
        SnackBar(
          behavior: SnackBarBehavior.floating,
          backgroundColor: bgColor,
          duration: duration,
          margin: const EdgeInsets.all(16),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
          content: Row(
            children: [
              Icon(
                icon,
                color: textColor ?? Colors.white,
              ),
              const SizedBox(width: 12),
              Expanded(
                child: Text(
                  message,
                  style: TextStyle(
                    color: textColor ?? Colors.white,
                    fontSize: 14,
                  ),
                ),
              ),
            ],
          ),
        ),
      );
  }

  static void success(
    String message, {
    Color? textColor,
  }) {
    show(
      message: message,
      type: ToastType.success,
      textColor: textColor,
    );
  }

  static void error(
    String message, {
    Color? textColor,
  }) {
    show(
      message: message,
      type: ToastType.error,
      textColor: textColor,
    );
  }

  static void warning(
    String message, {
    Color? textColor,
  }) {
    show(
      message: message,
      type: ToastType.warning,
      textColor: textColor,
    );
  }

  static void info(
    String message, {
    Color? textColor,
  }) {
    show(
      message: message,
      type: ToastType.info,
      textColor: textColor,
    );
  }

  static Color _getBackgroundColor(ToastType type) {
    switch (type) {
      case ToastType.success:
        return Colors.green.shade700;
      case ToastType.error:
        return Colors.red.shade700;
      case ToastType.warning:
        return Colors.orange.shade800;
      case ToastType.info:
        return Colors.blueGrey.shade800;
    }
  }

  static IconData _getIcon(ToastType type) {
    switch (type) {
      case ToastType.success:
        return Icons.check_circle_outline;
      case ToastType.error:
        return Icons.error_outline;
      case ToastType.warning:
        return Icons.warning_amber_rounded;
      case ToastType.info:
        return Icons.info_outline;
    }
  }
}