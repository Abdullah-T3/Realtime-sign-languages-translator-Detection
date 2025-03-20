import 'package:flutter/material.dart';
import 'package:realtime_sign_languages_translator/core/Responsive/Models/device_info.dart';
import 'package:realtime_sign_languages_translator/core/theming/colors.dart';
import 'package:realtime_sign_languages_translator/core/theming/styles.dart';

class ChatCardWidget extends StatelessWidget {
  const ChatCardWidget({
    super.key,
    required this.title,
    required this.subtitle,
    required this.data,
    required this.deviceInfo,
  });
  final String title;
  final String subtitle;
  final String data;
  final DeviceInfo deviceInfo;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.fromLTRB(
        deviceInfo.screenWidth * 0.04,
        deviceInfo.screenHeight * 0.02,
        deviceInfo.screenWidth * 0.02,
        deviceInfo.screenHeight * 0.01,
      ),
      child: InkWell(
        onTap: () {},
        highlightColor: Colors.transparent,
        splashColor: Colors.transparent,
        child: Container(
          width: deviceInfo.screenWidth * 0.9,
          height: deviceInfo.screenHeight * 0.08,
          decoration: BoxDecoration(
            color: ColorsManager.backgroundColor,
            borderRadius: BorderRadius.circular(deviceInfo.screenWidth * 0.05),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.1),
                spreadRadius: 1,
                blurRadius: 5,
                offset: Offset(0, 3),
              ),
            ],
          ),
          child: Padding(
            padding: EdgeInsets.only(top: deviceInfo.screenHeight * 0.01),
            child: ListTile(
              leading: CircleAvatar(
                radius: deviceInfo.screenWidth * 0.08,
                backgroundImage: AssetImage('assets/images/user.png'),
              ),
              title: Text(
                title,
                style: TextStyles.robotoBold16.copyWith(
                  color: Colors.white,
                  fontSize: deviceInfo.screenWidth * 0.04,
                ),
              ),
              subtitle: Text(
                subtitle,
                style: TextStyles.robotoRegular16White.copyWith(
                  fontSize: deviceInfo.screenWidth * 0.032,
                ),
              ),
              trailing: Text(
                data,
                style: TextStyles.robotoRegular16White.copyWith(
                  fontSize: deviceInfo.screenWidth * 0.04,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
