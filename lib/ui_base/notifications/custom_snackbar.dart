import 'package:doit/core/design_system/text_styles.dart';
import 'package:doit/core/types/types.dart';
import 'package:doit/core/utils/mappers/color_mapper.dart';
import 'package:flutter/material.dart';

/// A utility class to display `SnackBar` notifications.
///
/// Provides a single static method `show` to trigger a consistent-looking
/// snackbar across the app, with colors based on the `StatusType` helper func.
class CustomSnackbar {
  /// Shows a custom `SnackBar` at the bottom of the screen.
  ///
  /// [context] The `BuildContext` used to find the `ScaffoldMessenger`.
  /// [message] The text message to be displayed in the snackbar.
  /// [type] The type of status, which determines the background color. Defaults to `StatusType.info`.
  ///
  /// ### Example
  ///
  /// ```dart
  /// CustomSnackbar.show(
  ///   context: context,
  ///   message: 'Task successfully created!',
  ///   type: StatusType.success,
  /// );
  /// ```
  static void show({required BuildContext context, required String message, StatusType type = StatusType.info}) {
    ScaffoldMessenger.of(context).hideCurrentSnackBar();

    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Container(
          alignment: Alignment.center,
          padding: const EdgeInsets.only(left: 16, right:16, top: 8),
          child: Text(message, style: DesignSystem.textStyles.body.semibold()),
        ),
        behavior: SnackBarBehavior.fixed,
        backgroundColor: getColorForStatus(type),
      ),
    );
  }
}
