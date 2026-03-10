import 'package:chat_app/utils/globals.dart';
import 'package:flutter/material.dart';
import 'package:chat_app/widgets/chats/attachment_bottom_sheet.dart';
import 'package:chat_app/widgets/chats/emoji_keyboard.dart';
import 'package:image_picker/image_picker.dart';

class ChatControls extends StatelessWidget {
  final TextEditingController controller;
  final FocusNode focusNode;
  final bool showEmoji;
  final VoidCallback onEmojiToggle;
  final bool showSendButton;
  final VoidCallback changeSendMicButton;
  final Function(String) sendButtonToggle;
  final Function(String, int?, int) sendMessage;
  final int targetId;
  final ScrollController scrollController;
  final ImagePicker picker;
  final XFile? file;
  final VoidCallback pickImage;

  ChatControls({
    super.key,
    required this.controller,
    required this.focusNode,
    required this.showEmoji,
    required this.onEmojiToggle,
    required this.showSendButton,
    required this.changeSendMicButton,
    required this.sendButtonToggle,
    required this.sendMessage,
    required this.targetId,
    required this.scrollController,
    required this.picker,
    required this.file,
    required this.pickImage,
  });

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.bottomCenter,
      child: SizedBox(
        height: 75,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            _buildInputRow(context),
            showEmoji ? EmojiKeyboard(controller: controller) : Container(),
          ],
        ),
      ),
    );
  }

  Widget _buildInputRow(BuildContext context) {
    return SafeArea(
      bottom: !showEmoji,
      child: Row(children: [_buildTextField(context), _buildMultiButton()]),
    );
  }

  Widget _buildTextField(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width - 55,
      child: Card(
        margin: const EdgeInsets.only(left: 2, right: 2, bottom: 0),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(25)),
        child: TextFormField(
          onChanged: sendButtonToggle,
          controller: controller,
          focusNode: focusNode,
          textAlignVertical: TextAlignVertical.center,
          keyboardType: TextInputType.multiline,
          minLines: 1,
          maxLines: 5,
          showCursor: true,
          decoration: InputDecoration(
            border: InputBorder.none,
            hintText: "Type a message",
            prefixIcon: IconButton(
              onPressed: onEmojiToggle,
              icon: const Icon(Icons.emoji_emotions_outlined),
            ),
            contentPadding: const EdgeInsets.all(5),
            suffixIcon: _buildSuffixIcons(context),
          ),
        ),
      ),
    );
  }

  Widget _buildSuffixIcons(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        IconButton(
          onPressed: () {
            showModalBottomSheet(
              backgroundColor: Colors.transparent,
              context: context,
              builder:
                  (builder) => AttachmentBottomSheet(
                    picker: picker,
                    file: file,
                    pickImage: pickImage,
                  ),
            );
          },
          icon: const Icon(Icons.attach_file),
        ),
        IconButton(onPressed: () {}, icon: const Icon(Icons.camera_alt)),
      ],
    );
  }

  Widget _buildMultiButton() {
    return CircleAvatar(
      backgroundColor: const Color(0xFF128C7E),
      radius: 25,
      child: IconButton(
        icon: Icon(showSendButton ? Icons.send : Icons.mic, color: Colors.white),
        onPressed: () {
          if (showSendButton) {
            sendMessage(controller.text, currentUser?.id, targetId);
            controller.clear();
            //Wait until the current frame (build phase) finishes
            if (scrollController.hasClients && scrollController.position.hasContentDimensions) {
              WidgetsBinding.instance.addPostFrameCallback((_) {
                scrollController.animateTo(
                  scrollController.position.maxScrollExtent,
                  duration: Duration(milliseconds: 300),
                  curve: Curves.easeOut,
                );
              });
            }
            changeSendMicButton();
          }
        },
      ),
    );
  }
}
