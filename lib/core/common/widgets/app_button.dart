import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

enum ButtonVariant { DEFAULT, FILLED, LIGHT, OUTLINED, SUBTLE, TRANSPARENT }

enum ButtonSize { XS, SM, MD, LG, XL }

class AppButton extends StatelessWidget {
  final String? buttonLabel;
  final TextStyle? textStyle;
  final Widget? leading;
  final Widget? trailing;
  final Color? labelColor;
  final Color? buttonColor;
  final Color? foregroundColor;
  final Color? backgroundColor;
  final Color? borderColor;
  final ButtonVariant variant;
  final ButtonSize size;
  final VisualDensity? visualDensity;
  final bool isFullWidth;
  final double spacing;
  final Size? fixedSize;
  final VoidCallback? onPressed;
  final bool isLoading;
  final bool isEnabled;
  final String? tooltip;
  final String? semanticLabel;
  final double? elevation;
  final EdgeInsetsGeometry? padding;

  const AppButton({
    super.key,
    this.buttonLabel,
    this.textStyle,
    this.leading,
    this.trailing,
    this.labelColor,
    this.buttonColor,
    this.foregroundColor,
    this.backgroundColor,
    this.borderColor,
    this.variant = ButtonVariant.DEFAULT,
    this.size = ButtonSize.XL,
    this.visualDensity,
    this.isFullWidth = false,
    this.spacing = 8.0,
    this.fixedSize,
    this.onPressed,
    this.isLoading = false,
    this.isEnabled = true,
    this.tooltip,
    this.semanticLabel,
    this.elevation,
    this.padding,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final style = _getStyle(theme);

    return AbsorbPointer(
      absorbing: isEnabled && !isLoading ? false : true,
      child: AnimatedOpacity(
        opacity: isEnabled && !isLoading ? 1.0 : 0.5,
        duration: const Duration(milliseconds: 300),
        child:
            SizedBox(
                  width: isFullWidth ? double.infinity : null,
                  child: TextButton(
                    onPressed: onPressed,
                    style: TextButton.styleFrom(
                      visualDensity: visualDensity,
                      backgroundColor: buttonColor ?? style.backgroundColor,
                      foregroundColor: buttonColor ?? style.foregroundColor,
                      side: style.border,
                      fixedSize: fixedSize,
                      shape: buttonLabel?.isNotEmpty ?? false
                          ? style.shape
                          : const CircleBorder(),
                      elevation: elevation ?? style.elevation,
                      padding: padding ?? style.padding,
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        if (isLoading)
                          Padding(
                            padding: EdgeInsets.only(right: 8.r),
                            child: SizedBox(
                              width: 20.r,
                              height: 20.r,
                              child: CircularProgressIndicator(
                                strokeWidth: 2,
                                strokeCap: StrokeCap.round,
                                valueColor: AlwaysStoppedAnimation<Color>(
                                  textStyle?.color ??
                                      style.foregroundColor ??
                                      Colors.white,
                                ),
                              ),
                            ),
                          ).animate().fade().scale(),
                        _buildContent(style: style),
                      ],
                    ),
                  ),
                )
                .animate(target: isLoading ? 0 : 1)
                .shimmer(
                  duration: 1200.ms,
                  color: Colors.white.withValues(alpha: 0.2),
                  angle: 45,
                ),
      ),
    );
  }

  Widget _buildContent({_ButtonStyle? style}) {
    if (leading == null && trailing == null) {
      return Text(
        buttonLabel ?? '',
        style:
            textStyle ??
            TextStyle(
              fontSize: _getFontSize(),
              color: labelColor ?? style?.textStyle?.color,
            ),
      );
    } else if (buttonLabel == null) {
      return (leading ?? trailing!);
    } else {
      return Row(
        mainAxisSize: isFullWidth ? MainAxisSize.max : MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          if (leading != null) leading!,
          if (leading != null) SizedBox(width: spacing.r),
          Text(
            buttonLabel!,
            style:
                textStyle ??
                TextStyle(fontSize: _getFontSize(), color: labelColor),
          ),
          if (trailing != null) SizedBox(width: spacing.r),
          if (trailing != null) trailing!,
        ],
      );
    }
  }

  _ButtonStyle _getStyle(ThemeData theme) {
    switch (variant) {
      case ButtonVariant.FILLED:
        return _ButtonStyle(
          backgroundColor: backgroundColor ?? theme.colorScheme.primary,
          foregroundColor: foregroundColor ?? theme.colorScheme.onPrimary,
          border: BorderSide.none,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8.r),
            side: BorderSide(
              color: borderColor ?? theme.colorScheme.primary,
              width: 1,
            ),
          ),
          elevation: 0,
          padding: _getPadding(),
          textStyle: TextStyle(fontSize: _getFontSize()),
        );
      case ButtonVariant.LIGHT:
        return _ButtonStyle(
          backgroundColor: backgroundColor ?? theme.colorScheme.secondary,
          foregroundColor: foregroundColor ?? theme.colorScheme.onSecondary,
          border: BorderSide.none,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8.r),
          ),
          elevation: 0,
          padding: _getPadding(),
          textStyle: TextStyle(
            fontSize: _getFontSize(),
            color: labelColor ?? theme.colorScheme.onSurface,
          ),
        );
      case ButtonVariant.OUTLINED:
        return _ButtonStyle(
          backgroundColor: backgroundColor ?? Colors.transparent,
          foregroundColor: foregroundColor ?? theme.colorScheme.primary,
          border: BorderSide(color: borderColor ?? theme.colorScheme.primary),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8.r),
          ),
          elevation: 0,
          padding: _getPadding(),
          textStyle: TextStyle(
            fontSize: _getFontSize(),
            color: labelColor ?? theme.colorScheme.onSurface,
          ),
        );
      case ButtonVariant.SUBTLE:
        return _ButtonStyle(
          backgroundColor:
              backgroundColor ??
              theme.colorScheme.primary.withValues(alpha: 0.1),
          foregroundColor: foregroundColor ?? theme.colorScheme.onSurface,
          border: BorderSide.none,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8.r),
          ),
          elevation: 0,
          padding: _getPadding(),
          textStyle: TextStyle(
            fontSize: _getFontSize(),
            color: labelColor ?? theme.colorScheme.onSurface,
          ),
        );
      case ButtonVariant.TRANSPARENT:
        return _ButtonStyle(
          backgroundColor: backgroundColor ?? Colors.transparent,
          foregroundColor: foregroundColor ?? theme.colorScheme.onSurface,
          border: BorderSide.none,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8.r),
          ),
          elevation: 0,
          padding: _getPadding(),
          textStyle: TextStyle(fontSize: _getFontSize()),
        );
      case ButtonVariant.DEFAULT:
        return _ButtonStyle(
          backgroundColor: backgroundColor ?? theme.colorScheme.primary,
          foregroundColor: foregroundColor ?? theme.colorScheme.onPrimary,
          border: BorderSide.none,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8.r),
          ),
          elevation: 0,
          padding: _getPadding(),
          textStyle: TextStyle(fontSize: _getFontSize()),
        );
    }
  }

  EdgeInsetsGeometry _getPadding() {
    switch (size) {
      case ButtonSize.XS:
        return EdgeInsets.symmetric(horizontal: 8.r, vertical: 4.r);
      case ButtonSize.SM:
        return EdgeInsets.symmetric(horizontal: 12.r, vertical: 6.r);
      case ButtonSize.LG:
        return EdgeInsets.symmetric(horizontal: 20.r, vertical: 10.r);
      case ButtonSize.XL:
        return EdgeInsets.symmetric(horizontal: 24.r, vertical: 16.r);
      case ButtonSize.MD:
        return EdgeInsets.symmetric(horizontal: 16.r, vertical: 8.r);
      default:
        return EdgeInsets.symmetric(horizontal: 16.r, vertical: 8.r);
    }
  }

  double _getFontSize() {
    switch (size) {
      case ButtonSize.XS:
        return 12.r;
      case ButtonSize.SM:
        return 14.r;
      case ButtonSize.LG:
        return 18.r;
      case ButtonSize.XL:
        return 20.r;
      case ButtonSize.MD:
      default:
        return 16.r;
    }
  }
}

class _ButtonStyle {
  final Color? backgroundColor;
  final Color? foregroundColor;
  final BorderSide? border;
  final OutlinedBorder? shape;
  final double? elevation;
  final EdgeInsetsGeometry? padding;
  final TextStyle? textStyle;

  _ButtonStyle({
    this.backgroundColor,
    this.foregroundColor,
    this.border,
    this.shape,
    this.elevation,
    this.padding,
    this.textStyle,
  });
}
