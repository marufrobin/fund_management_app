import 'dart:async';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

enum ToastType { success, error, info }

class ToastConfig {
  final Color backgroundColor;
  final Color textColor;
  final IconData icon;
  final Color iconColor;

  ToastConfig({
    required this.backgroundColor,
    required this.textColor,
    required this.icon,
    required this.iconColor,
  });
}

class AppToaster {
  /// Private constructor to prevent instantiation
  AppToaster._();

  /// Cached FToast instance
  static FToast? _fToast;

  /// Initialize once and reuse
  static void _ensureInitialized(BuildContext context) {
    _fToast ??= FToast();
    _fToast!.init(context);
  }

  // Main toast display method
  static void show({
    required String message,
    required BuildContext context,
    ToastType type = ToastType.info,
    Duration duration = const Duration(seconds: 3),
    ToastGravity gravity = ToastGravity.TOP,
    VoidCallback? onDismiss,
  }) {
    _ensureInitialized(context);

    final theme = Theme.of(context);
    final ToastConfig config = _getToastConfig(type, theme);

    _fToast?.showToast(
      gravity: gravity,
      toastDuration: duration,
      child: _buildToastWidget(message: message, config: config),
    );

    if (onDismiss != null) {
      Future.delayed(duration, onDismiss);
    }
  }

  // Convenience methods
  static void success({
    required String message,
    required BuildContext context,
    Duration duration = const Duration(seconds: 3),
  }) {
    show(
      message: message,
      context: context,
      type: ToastType.success,
      duration: duration,
    );
  }

  static void error({
    required String message,
    required BuildContext context,
    Duration duration = const Duration(seconds: 3),
  }) {
    show(
      message: message,
      context: context,
      type: ToastType.error,
      duration: duration,
    );
  }

  static void info({
    required String message,
    required BuildContext context,
    Duration duration = const Duration(seconds: 3),
  }) {
    show(
      message: message,
      context: context,
      type: ToastType.info,
      duration: duration,
    );
  }

  // Toast configuration based on type
  static ToastConfig _getToastConfig(ToastType type, ThemeData theme) {
    switch (type) {
      case ToastType.success:
        return ToastConfig(
          backgroundColor: Colors.green,
          textColor: Colors.white,
          icon: Icons.check_circle,
          iconColor: Colors.white,
        );
      case ToastType.error:
        return ToastConfig(
          backgroundColor: theme.colorScheme.error,
          textColor: theme.colorScheme.onError,
          icon: Icons.error,
          iconColor: theme.colorScheme.onError,
        );
      case ToastType.info:
        return ToastConfig(
          backgroundColor: theme.colorScheme.primary,
          textColor: theme.colorScheme.onPrimary,
          icon: Icons.info,
          iconColor: theme.colorScheme.onPrimary,
        );
    }
  }

  // Build the toast widget
  static Widget _buildToastWidget({
    required String message,
    required ToastConfig config,
  }) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20.0.r, vertical: 12.0.r),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12.0.r),
        color: config.backgroundColor,
        boxShadow: const [
          BoxShadow(
            color: Colors.black26,
            blurRadius: 8.0,
            offset: Offset(0.0, 3.0),
          ),
        ],
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(config.icon, color: config.iconColor),
          12.horizontalSpace,
          Flexible(
            child: Text(
              message,
              style: TextStyle(
                color: config.textColor,
                fontSize: 14.0,
                fontWeight: FontWeight.w500,
              ),
              overflow: TextOverflow.ellipsis,
              maxLines: 4,
            ),
          ),
        ],
      ),
    );
  }

  // Clear all toasts
  static void dismissAll() {
    _fToast?.removeQueuedCustomToasts();
  }
}
