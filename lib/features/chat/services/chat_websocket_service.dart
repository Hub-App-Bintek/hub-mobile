import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:stomp_dart_client/stomp_dart_client.dart';

typedef ChatMessageCallback = void Function(Map<String, dynamic> message);

class ChatWebSocketService {
  StompClient? _client;
  StompUnsubscribe? _roomSubscription;

  bool get isConnected => _client?.connected == true;

  void connect({
    required String url,
    required String token,
    required String topic,
    ChatMessageCallback? onMessage,
    VoidCallback? onConnected,
    VoidCallback? onDisconnected,
    Function(Object error)? onError,
  }) {
    disconnect();

    final targetUrl = _withToken(url, token);

    _client = StompClient(
      config: StompConfig.sockJS(
        url: targetUrl,
        onConnect: (frame) {
          debugPrint('[CHAT-WS] connected: ${frame.headers}');
          _roomSubscription = _client?.subscribe(
            destination: topic,
            callback: (StompFrame frame) {
              final body = frame.body;
              if (body == null || onMessage == null) return;
              try {
                final decoded = jsonDecode(body);
                if (decoded is Map<String, dynamic>) {
                  onMessage(decoded);
                } else {
                  onMessage({'raw': decoded});
                }
              } catch (_) {
                onMessage({'raw': body});
              }
            },
          );
          debugPrint('[CHAT-WS] subscribed to $topic');
          onConnected?.call();
        },
        onWebSocketError: (error) {
          debugPrint('[CHAT-WS] websocket error: $error');
          onError?.call(error);
        },
        onStompError: (frame) {
          final message = frame.body ?? 'STOMP error';
          debugPrint('[CHAT-WS] stomp error: $message');
          onError?.call(message);
        },
        onDisconnect: (_) {
          debugPrint('[CHAT-WS] disconnected');
          _roomSubscription?.call();
          _roomSubscription = null;
          onDisconnected?.call();
        },
        stompConnectHeaders: {'Authorization': 'Bearer $token'},
        webSocketConnectHeaders: {'Authorization': 'Bearer $token'},
      ),
    )..activate();
  }

  void send({required String destination, required Map<String, dynamic> body}) {
    if (!isConnected) return;
    debugPrint('[CHAT-WS] send to $destination: $body');
    _client?.send(
      destination: destination,
      body: jsonEncode(body),
      headers: const {'content-type': 'application/json'},
    );
  }

  void disconnect() {
    debugPrint('[CHAT-WS] disposing connection');
    _roomSubscription?.call();
    _roomSubscription = null;
    _client?.deactivate();
    _client = null;
  }

  String _withToken(String url, String token) {
    if (token.isEmpty) return url;
    final uri = Uri.tryParse(url);
    if (uri == null) {
      return '$url?token=${Uri.encodeComponent(token)}';
    }
    final params = Map<String, String>.from(uri.queryParameters);
    params['token'] = token;
    return uri.replace(queryParameters: params).toString();
  }
}
