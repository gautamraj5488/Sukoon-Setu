import 'dart:convert';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:sukoon_setu/l10n/app_localizations.dart';
import 'package:sukoon_setu/models/user_info_model.dart';
import 'package:sukoon_setu/screens/quiz_screen.dart';

class ChatScreen extends StatefulWidget {
final Function(Locale) onLocaleChange;
  const ChatScreen({super.key, required this.onLocaleChange});

  @override
  State<ChatScreen> createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  final List<Map<String, String>> messages = [];
  final TextEditingController _controller = TextEditingController();
  bool _isLoading = false;

  Future<void> sendMessage(String content) async {
    if (content.trim().isEmpty) return;

    setState(() {
      messages.add({'role': 'user', 'content': content});
      _controller.clear();
      _isLoading = true;
    });

    try {
      final response = await http.post(
        Uri.parse("https://openrouter.ai/api/v1/chat/completions"),
        headers: {
          "Authorization": "Bearer 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",
          "Content-Type": "application/json",
        },
        body: jsonEncode({
          "model": "deepseek/deepseek-chat",
          "messages": [
            for (var msg in messages)
              {"role": msg['role'], "content": msg['content']},
          ],
        }),
      );

      final data = jsonDecode(response.body);
      final botReply = data["choices"][0]["message"]["content"];

      setState(() {
        messages.add({'role': 'assistant', 'content': botReply});
        _isLoading = false;
      });
    } catch (e) {
      setState(() {
        _isLoading = false;
        messages.add({
          'role': 'assistant',
          'content': '❌ Failed to fetch response. Check your API key or network.'
        });
      });
    }
  }

  void resetChat() {
    setState(() {
      messages.clear();
    });
  }

  final userInfo = UserInfo(name: '', age: 0, gender: '', profession: '', area: '');

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;
    final textTheme = theme.textTheme;
    final localizations = AppLocalizations.of(context)!;

    return Scaffold(
      backgroundColor: colorScheme.background,
      appBar: AppBar(
        title: const Text(
          "Sukoon Sathi",
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.refresh),
            onPressed: resetChat,
            tooltip: "Reset Chat",
          ),
        ],
      ),
      body: Column(
        children: [
          Expanded(
            child: messages.isEmpty
                ? Center(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: Container(
                  height: 80,
                  decoration: BoxDecoration(
                    color: colorScheme.surface,
                    borderRadius: BorderRadius.circular(24),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.04),
                        blurRadius: 6,
                        offset: const Offset(0, 2),
                      ),
                    ],
                  ),
                  padding: const EdgeInsets.all(16),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      CircleAvatar(
                        radius: 20,
                        backgroundColor: colorScheme.secondary.withOpacity(0.2),
                        child: Icon(
                          Icons.android,
                          color: colorScheme.secondary,
                        ),
                      ),
                      const SizedBox(width: 12),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Namaste, how can I help you today?',
                              style: textTheme.bodyLarge?.copyWith(
                                color: colorScheme.onSurface,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                            const SizedBox(height: 4),
                            RichText(
                              text: TextSpan(
                                text: 'Not sure what to ask? ',
                                style: textTheme.bodyMedium?.copyWith(
                                  color: colorScheme.onSurface.withOpacity(0.6),
                                ),
                                children: [
                                  TextSpan(
                                    text: 'Take the quiz',
                                    style: textTheme.bodyMedium?.copyWith(
                                      color: colorScheme.primary,
                                      fontWeight: FontWeight.w600,
                                    ),
                                    recognizer: TapGestureRecognizer()
                                      ..onTap = () {
                                        Navigator.of(context).push(
                                          MaterialPageRoute(
                                            builder: (_) => QuizScreen(
                                              userInfo: userInfo,
                                              onLocaleChange: widget.onLocaleChange,
                                            ),
                                          ),
                                        );
                                      },
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            )
                : ListView.builder(
                    padding: const EdgeInsets.all(16),
                    itemCount: messages.length,
                    itemBuilder: (context, index) {
                      final message = messages[index];
                      final isUser = message['role'] == 'user';

                      return Align(
                        alignment: isUser
                            ? Alignment.centerRight
                            : Alignment.centerLeft,
                        child: Container(
                          margin: const EdgeInsets.symmetric(vertical: 6),
                          padding: const EdgeInsets.all(12),
                          decoration: BoxDecoration(
                            color: isUser
                                ? colorScheme.primary.withOpacity(0.1)
                                : colorScheme.surfaceVariant,
                            borderRadius: BorderRadius.circular(12),
                          ),
                          child: Text(
                            message['content'] ?? '',
                            style: TextStyle(
                              color: colorScheme.onSurface,
                            ),
                          ),
                        ),
                      );
                    },
                  ),
          ),

          // Input Bar
          Padding(
            padding: const EdgeInsets.fromLTRB(16, 8, 16, 24),
            child: Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: _controller,
                    onSubmitted: sendMessage,
                    decoration: InputDecoration(
                      hintText: 'Message SukoonSathi...',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(24),
                      ),
                      contentPadding: const EdgeInsets.symmetric(
                        vertical: 10,
                        horizontal: 16,
                      ),
                    ),
                  ),
                ),
                const SizedBox(width: 8),
                _isLoading
                    ? const CircularProgressIndicator()
                    : IconButton(
                        icon: Icon(Icons.send_rounded,
                            color: colorScheme.primary),
                        onPressed: () {
                          sendMessage(_controller.text);
                        },
                      ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
