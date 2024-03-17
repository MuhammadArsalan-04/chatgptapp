import 'package:chat_gpt_app/chat_screen/chat.dart';
import 'package:chat_gpt_app/proivder/chat_provider.dart';
import 'package:chat_gpt_app/utils/custom_theme.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider.value(
      value: ChatProvider(),
      builder: (context, child) {
        return MaterialApp(
          title: 'Flutter Demo',
          debugShowCheckedModeBanner: false,
          theme: customAppTheme(),
          home: const ChatView(),
        );
      },
    );
  }
}
