import 'package:doit/core/types/types.dart';
import 'package:flutter/material.dart';

Color getColorForStatus(StatusType statusType) {
  switch (statusType) {
    case StatusType.warning:
      return Colors.amber.shade600;
    case StatusType.error:
      return Colors.red;
    case StatusType.success:
      return Colors.green;
    case StatusType.info:
      return Colors.blue.shade400;
    case StatusType.none:
  }
  return Colors.green;
}