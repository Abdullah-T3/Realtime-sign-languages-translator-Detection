import 'package:flutter/material.dart';
import 'package:realtime_sign_languages_translator/core/Responsive/ui_component/info_widget.dart';
import 'package:realtime_sign_languages_translator/core/theming/styles.dart';
import 'package:realtime_sign_languages_translator/features/home/presentation/screens/widgets/chat_card_widget.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return InfoWidget(
      builder: (context, deviceInfo) {
        return Scaffold(
          appBar: AppBar(
            title: Text('Chats', style: TextStyles.robotoRegular20White),
            leading: Image.asset("assets/images/chats_Logo.png"),
            actions: [
              Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: deviceInfo.screenWidth * 0.02,
                ),
                child: IconButton(
                  icon: Icon(Icons.search, size: deviceInfo.screenWidth * 0.08),
                  onPressed: () {},
                ),
              ),
            ],
          ),
          body: Column(
            children: [
              Expanded(
                child: ListView.builder(
                  itemCount: 10,
                  itemBuilder: (context, index) {
                    return ChatCardWidget(
                      title: 'User $index',
                      subtitle: 'Last message',
                      data: '12:00 PM',
                      deviceInfo: deviceInfo,
                    );
                  },
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
