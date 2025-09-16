import 'package:flutter/material.dart';

import '../core/constants/app_colors.dart';

Color categoryColor(String category) {
  switch (category) {
    case 'Ingen funn':
      return AppColors.none;
    case 'Mildt':
      return AppColors.mild;
    case 'Moderat':
      return AppColors.moderate;
    case 'Moderat–alvorlig':
      return AppColors.moderateSevere;
    case 'Alvorlig':
      return AppColors.severe;
    default:
      return const Color(0xFF37474F);
  }
}

