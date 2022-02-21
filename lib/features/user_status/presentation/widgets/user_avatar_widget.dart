import 'package:flutter/material.dart';
import 'package:wayve_test_app/core/enums/user_gender.dart';
import 'package:wayve_test_app/core/ui/styles/colors.dart';
import 'package:wayve_test_app/core/ui/styles/text_styles.dart';
import 'package:wayve_test_app/core/utils/app_logger.dart';

class UserAvatar extends StatelessWidget {
  final String name;
  final UserGender gender;
  final int id;
  final int scale;

  const UserAvatar({
    Key? key,
    required this.id,
    required this.name,
    required this.gender,
    this.scale = 1
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {

    String getAvatarText() {
      if (name.isEmpty) return name;
      String _name = name;
      if(name.contains(".")){
        _name = name.substring(name.indexOf(".")+2);
        AppLogger.log(_name);
      }
      var names = _name.split(" ");
      if(names.length > 1) {
       return "${names[0][0]}${names[1][0]}";
      }
      return names[0][0];
    }

    Color getAvatarBackgroundColor() {
      String sum =  id.toString().split('').map(int.parse).reduce((t, e) => t + e).toString();
      int colorInt = int.parse("0x99$id$sum");
      return Color(colorInt);
    }

    return Stack(
      children: [
        Container(
          height: (45 * scale).toDouble(),
          width: (45 * scale).toDouble(),
          padding: const EdgeInsets.all(10),
          alignment: Alignment.center,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: getAvatarBackgroundColor(),
          ),
          child: Text(
            getAvatarText(),
            textAlign: TextAlign.center,
            style: scale == 1 ? AppTextStyles.titleTextStyle : AppTextStyles.bigTextStyle
          ),
        ),
         Positioned(
          bottom: 1,
          right: 5,
          child: Container(
            height: (12*scale).toDouble(),
            width: (12*scale).toDouble(),
            // padding: const EdgeInsets.all(5),
            decoration:  BoxDecoration(
              border: Border.all(color: AppColors.appGrey, width: 0.4),
              shape: BoxShape.circle,
              color: AppColors.appWhite,
            ),
              child: gender == UserGender.male
                  ?  Center(child: Icon(Icons.male, size: (10 * scale).toDouble(), color: AppColors.appBlack))
                  :  Center(child: Icon(Icons.female, size: (10 * scale).toDouble(), color: AppColors.appBlack))
          ),
        )
      ],
    );
  }

}