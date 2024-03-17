import 'package:chat_gpt_app/chat_screen/layout/widget/loader.dart';
import 'package:chat_gpt_app/proivder/chat_provider.dart';
import 'package:chat_gpt_app/utils/app_cons.dart';
import 'package:chat_gpt_app/chat_screen/layout/widget/message_bubble.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ChatViewBody extends StatefulWidget {
  const ChatViewBody({super.key});

  @override
  State<ChatViewBody> createState() => _ChatViewBodyState();
}

class _ChatViewBodyState extends State<ChatViewBody> {
  final TextEditingController _messageController = TextEditingController();
  bool isFetching = false;
  @override
  Widget build(BuildContext context) {
    final providerRef = Provider.of<ChatProvider>(context);
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 16),
      child: Column(
        children: [
          Expanded(
            child: SingleChildScrollView(
              reverse: true,
              child: Column(
                children: [
                  ...(providerRef.getChatMessages)
                      .map((e) => Column(
                            children: [
                              MessageBubble(
                                isMe: e.role == "user" ? true : false,
                                text: e.content,
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                            ],
                          ))
                      .toList(),
                  if (isFetching) const Center(child: Loader())
                ],
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 10),
            child: TextFormField(
              controller: _messageController,
              onChanged: (value) {
                setState(() {});
              },
              cursorColor: AppColors.primaryColor,
              decoration: InputDecoration(
                  suffixIcon: IconButton(
                      onPressed: _messageController.text.isEmpty
                          ? null
                          : () async {
                              String typedMessage =
                                  _messageController.text.trim();
                              setState(() {
                                isFetching = !isFetching;
                                _messageController.clear();
                              });

                              await providerRef
                                  .addMessage(typedMessage, "user")
                                  .then((_) {
                                setState(() {
                                  isFetching = !isFetching;
                                });
                              });
                            },
                      icon: Icon(
                        Icons.send,
                        color: _messageController.text.isEmpty
                            ? null
                            : AppColors.primaryColor,
                      )),
                  focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                      borderSide:
                          const BorderSide(color: AppColors.primaryColor)),
                  enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                      borderSide:
                          const BorderSide(color: AppColors.primaryColor)),
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                      borderSide:
                          const BorderSide(color: AppColors.primaryColor)),
                  hintText: "Type your message",
                  hintStyle: Theme.of(context).textTheme.labelSmall,
                  contentPadding:
                      const EdgeInsets.symmetric(horizontal: 12, vertical: 8)),
            ),
          ),
        ],
      ),
    );
  }
}
