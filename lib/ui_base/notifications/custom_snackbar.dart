import 'package:doit/core/design_system/text_styles.dart';
import 'package:doit/core/types/types.dart';
import 'package:doit/core/utils/mappers/color_mapper.dart';
import 'package:flutter/material.dart';

class CustomSnackbar {
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
