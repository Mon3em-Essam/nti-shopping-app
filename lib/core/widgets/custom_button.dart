import 'package:flutter/material.dart';
import 'package:nti_shopping_app/core/theme/app_colors.dart';
class CustomButton extends StatelessWidget {
  final String text;
  final VoidCallback onTap;
  final double height;
  final List<Color>? colors; 
  final Color? textColor;    

  const CustomButton({
    super.key,
    required this.text,
    required this.onTap,
    this.height = 48.0,
    this.colors,
    this.textColor,
  });

  @override
  Widget build(BuildContext context) {
    return Ink(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: colors ?? const [AppColors.primaryColor, AppColors.orangeLight],
          begin: Alignment.centerLeft,
          end: Alignment.centerRight,
        ),
        borderRadius: BorderRadius.circular(10),
      ),
      child: InkWell(
        borderRadius: BorderRadius.circular(10),
        onTap: onTap,
        child: Container(
          height: height,
          padding: const EdgeInsets.all(8),
          alignment: Alignment.center,
          child: Text(
            text,
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w600,
              color: textColor ?? const Color(0xffFFFFFF),
            ),
          ),
        ),
      ),
    );
  }
}