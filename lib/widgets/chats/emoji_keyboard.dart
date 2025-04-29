import 'package:emoji_picker_flutter/emoji_picker_flutter.dart';
import 'package:flutter/material.dart';

class EmojiKeyboard extends StatelessWidget {
  final TextEditingController controller;

  const EmojiKeyboard({super.key, required this.controller});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height * 0.35,
      child: EmojiPicker(
        onEmojiSelected: (category, emoji) {
          print(emoji);
          controller.text = controller.text + emoji.emoji;
        },
        config: const Config(emojiViewConfig: EmojiViewConfig(columns: 7)),
      ),
    );
  }
}
