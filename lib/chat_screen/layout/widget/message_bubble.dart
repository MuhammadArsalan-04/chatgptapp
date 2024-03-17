import 'package:chat_gpt_app/utils/app_cons.dart';
import 'package:flutter/material.dart';
import 'package:flutter_markdown/flutter_markdown.dart';

class MessageBubble extends StatefulWidget {
  MessageBubble({super.key, required this.isMe, required this.text});

  final bool isMe;
  final String text;

  @override
  State<MessageBubble> createState() => _MessageBubbleState();
}

class _MessageBubbleState extends State<MessageBubble>
    with SingleTickerProviderStateMixin {
  late final AnimationController _animationController;
  late final Animation<Offset> _offsetAnimation;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    //animation controller
    _animationController = AnimationController(
      duration: const Duration(microseconds: 6000),
      vsync: this,
    );

    _offsetAnimation = Tween<Offset>(
      begin: Offset(0.0, 1.0),
      end: Offset.zero,
    ).animate(
      CurvedAnimation(
        parent: _animationController,
        curve: Curves.linear,
      ),
    );

    _animationController.forward();
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment:
          widget.isMe ? MainAxisAlignment.end : MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        if (!widget.isMe) ...[
          Container(
            height: 36,
            width: 36,
            decoration: BoxDecoration(
                color: AppColors.primaryColor,
                borderRadius: BorderRadius.circular(100)),
            child: Center(
              child: Text(
                "GPT",
                style: Theme.of(context)
                    .textTheme
                    .labelSmall!
                    .copyWith(color: Colors.white, fontSize: 12),
              ),
            ),
          ),
          const SizedBox(width: 8),
        ],
        Center(
          child: SlideTransition(
            position: _offsetAnimation,
            child: Container(
              padding: const EdgeInsets.all(11),

              // height: 100,
              decoration: BoxDecoration(
                color:
                    widget.isMe ? Colors.grey.shade300 : AppColors.primaryColor,
                borderRadius: BorderRadius.circular(12),
              ),
              constraints: BoxConstraints(
                maxWidth: MediaQuery.of(context).size.width * 0.6,
                // minWidth: MediaQuery.of(context).size.width * 0.4,
              ),
              child: MarkdownBody(
                data: widget.text,
                selectable: true,
                styleSheet: MarkdownStyleSheet(
                  pPadding: const EdgeInsets.all(4),

                  p: TextStyle(
                      color: widget.isMe ? Colors.black : Colors.white),
                  codeblockDecoration: const BoxDecoration(
                    color: Colors.white,
                  ),

                  // Text color
                  code: const TextStyle(
                      fontFamily: 'monospace', // Code block background color
                      // color: Color.fromARGB(255, 102, 93, 93),
                      backgroundColor: Colors.transparent // Code text color
                      ),
                ),
              ),
            ),
          ),
        ),
        if (widget.isMe) ...[
          const SizedBox(width: 8),
          Container(
            height: 36,
            width: 36,
            decoration: BoxDecoration(
                color: Colors.grey.shade300,
                borderRadius: BorderRadius.circular(100)),
            child: Center(
              child: Text(
                "Me",
                style: Theme.of(context)
                    .textTheme
                    .labelSmall!
                    .copyWith(color: AppColors.primaryColor, fontSize: 12),
              ),
            ),
          ),
        ]
      ],
    );
  }
}
/**
 
 */