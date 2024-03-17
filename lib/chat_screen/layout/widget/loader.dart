import 'package:chat_gpt_app/utils/app_cons.dart';
import 'package:flutter/material.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';

class Loader extends StatelessWidget {
  const Loader({super.key});

  @override
  Widget build(BuildContext context) {
    return LoadingAnimationWidget.staggeredDotsWave(
      color: AppColors.primaryColor,
      size: 36,
    );
  }
}
