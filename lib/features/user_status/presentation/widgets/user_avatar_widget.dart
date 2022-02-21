import 'package:flutter/material.dart';
import 'package:wayve_test_app/core/enums/user_gender.dart';
import 'package:wayve_test_app/core/ui/styles/colors.dart';
import 'package:wayve_test_app/core/ui/styles/text_styles.dart';

class UserAvatar extends StatelessWidget {
  final String title;
  final UserGender gender;
  final int id;

  const UserAvatar({
    Key? key,
    required this.id,
    required this.title,
    required this.gender
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {

    String getAvatarText() {
      if (title.isEmpty) return title;
      var names = title.split(" ");
      if(names.length == 1) {
        return names[0][0];
      } else  {
        return "${names[names.length-2][0]}${names[names.length-1][0]}";
      }
    }

    Color getAvatarBackgroundColor() {
      String text = getAvatarText();
      int colorInt = int.parse("0xFF$id");
      return Colors.red;
    }

    return Stack(
      children: [
        Container(
          height: 40,
          width: 40,
          padding: const EdgeInsets.all(10),
          alignment: Alignment.center,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: getAvatarBackgroundColor(),
          ),
          child: Text(
            getAvatarText(),
            textAlign: TextAlign.center,
            style: AppTextStyles.titleTextStyle
          ),
        ),
         Positioned(
          bottom: 1,
          right: 5,
          child: Container(
            height: 12,
            width: 12,
            // padding: const EdgeInsets.all(5),
            decoration:  BoxDecoration(
              border: Border.all(color: AppColors.appGrey, width: 0.4),
              shape: BoxShape.circle,
              color: AppColors.appWhite,
            ),
              child: gender == UserGender.male
                  ? const Center(child: Icon(Icons.male, size: 10, color: AppColors.appBlack))
                  : const Center(child: Icon(Icons.female, size: 10, color: AppColors.appBlack))
          ),
        )
      ],
    );
  }

}