import 'package:doit/core/design_system/text_styles.dart';
import 'package:doit/core/types/types.dart';
import 'package:flutter/material.dart';

/// Custom `AlertDialog` to handle confirmation actions..
///
/// It's designed to be flexible, changing its icon and color scheme based on the
/// provided `StatusType` (e.g., a warning icon for a delete action).
///
/// [title] text of the dialog.\
/// [content] message shown below the title.\
/// [onConfirm] callback function that gets executed when the user presses the confirm button.\
/// [confirmText] text for the confirmation button. Defaults to 'Confirmar'.\
/// [type] typeStatus of alert, which determines the icon and color scheme.
///
/// ### Example
///
/// ```dart
/// showDialog(
///   context: context,
///   builder: (_) => ConfirmationAlert(
///     title: 'Confirm',
///     content: 'Are you sure you want to proceed?',
///     type: StatusType.warning,
///     onConfirm: () {
///       // Your logic here...
///     },
///   ),
/// );
/// ```
class ConfirmationAlert extends StatelessWidget {
  final String title;
  final String content;
  final VoidCallback onConfirm;
  final String confirmText;
  final StatusType type;

  const ConfirmationAlert({
    super.key,
    required this.title,
    required this.content,
    required this.onConfirm,
    this.confirmText = 'Confirmar',
    this.type = StatusType.info,
  });

  IconData _getIcon() {
    switch (type) {
      case StatusType.warning:
        return Icons.warning_amber_rounded;
      case StatusType.error:
        return Icons.error_outline;
      case StatusType.success:
        return Icons.check_circle_outline;
      case StatusType.info:
      default:
        return Icons.info_outline;
    }
  }

  Color _getColor() {
    switch (type) {
      case StatusType.warning:
        return Colors.amber.shade600;
      case StatusType.error:
        return Colors.red;
      case StatusType.success:
        return Colors.green;
      case StatusType.info:
      default:
        return Colors.blue;
    }
  }

  @override
  Widget build(BuildContext context) {
    final color = _getColor();
    return AlertDialog(
      title: Row(
        children: [
          Icon(_getIcon(), color: color),
          const SizedBox(width: 8),
          Text(title, style: DesignSystem.textStyles.headings.h2()),
        ],
      ),
      content: Text(content, style: DesignSystem.textStyles.body.regular()),
      actions: <Widget>[
        TextButton(
          onPressed: () => Navigator.of(context).pop(),
          child: Text('Cancelar', style: DesignSystem.textStyles.body.semibold()),
        ),
        FilledButton(
          style: FilledButton.styleFrom(backgroundColor: color),
          onPressed: () {
            onConfirm();
            Navigator.of(context).pop();
          },
          child: Text(confirmText, style: DesignSystem.textStyles.body.semibold()),
        ),
      ],
    );
  }
}