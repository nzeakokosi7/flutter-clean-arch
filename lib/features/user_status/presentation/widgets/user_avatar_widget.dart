import 'package:flutter/material.dart';
import 'package:wayve_test_app/core/enums/user_gender.dart';
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
        return names[0];
      } else  {
        return "${names[names.length-2]}${names[names.length-1]}";
      }
    }

    Color getAvatarBackgroundColor() {
      String text = getAvatarText();
      int colorInt = int.parse("$text$id");
      return Color(colorInt);
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
          bottom: 0,
          right: 0,
          child: Container(
            height: 10,
            width: 10,
            padding: const EdgeInsets.all(5),
            color: Colors.white,
              child: gender == UserGender.male
                  ? const Icon(Icons.male)
                  : const Icon(Icons.female)
          ),
        )
      ],
    );
  }

}