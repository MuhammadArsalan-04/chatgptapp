import 'package:chat_gpt_app/model/chat_model.dart';
import 'package:chat_gpt_app/utils/api_cons.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

class ChatProvider with ChangeNotifier {
  final List<Message> _chatMessagesList = [];

  Future<void> addMessage(String message, String role) async {
    //creating a message
    Message newMsg = Message(role: role, content: message);

    //storing in list of messages
    _chatMessagesList.add(newMsg);

    ChatModel chatModel = ChatModel(messages: _chatMessagesList);

    //calling the Chat GPT API
    final Dio dio = Dio();

    try {
      final response = await dio.post(
        API.kChatGptEndpoint,
        data: chatModel.toJson(),
        options: Options(
          headers: {
            'Content-Type': 'application/json',
            'Authorization': API.kGptApiKey,
          },
        ),
      );

      if (response.statusCode == 200) {
        //storing response data
        final responseData = response.data;

        print(response.data);

        //creating responseMsg
        Message gptResponseMessage =
            Message.fromJson(responseData["choices"][0]["message"]);

        _chatMessagesList.add(gptResponseMessage);
      } else {
        throw response.data;
      }
    } catch (err) {
      debugPrint(err.toString());
    }

    notifyListeners();
  }

  List<Message> get getChatMessages {
    return _chatMessagesList;
  }
}
