import 'package:flutter/material.dart';
import 'package:linear_progress_bar/linear_progress_bar.dart';

import '../../theme/app_colors.dart';

class ProgressBar extends StatelessWidget {
  const ProgressBar({
    super.key,
    required int maxSteps,
    required int currentStepIndex,
  }) : _maxSteps = maxSteps, _currentStepIndex = currentStepIndex;

  final int _maxSteps;
  final int _currentStepIndex;

  @override
  Widget build(BuildContext context) {
    return LinearProgressBar(
      maxSteps: _maxSteps,
      progressType: LinearProgressBar.progressTypeLinear,
      currentStep: _currentStepIndex + 1,
      progressColor: AppColors.primary,
      backgroundColor: Colors.grey,
      minHeight: 5.0,
    );
  }
}