import 'dart:ui';

import 'package:flutter/material.dart';

import '../shared.dart';

class LoadingOverlay extends StatefulWidget {
  LoadingOverlay({
    Key? key,
    required this.child,
    String? label,
    this.delay = const Duration(milliseconds: 500),
  }) : super(key: key);

  final Widget child;
  final Duration delay;

  static _LoadingOverlayState of(BuildContext context) {
    return context.findAncestorStateOfType<_LoadingOverlayState>()!;
  }

  @override
  State<LoadingOverlay> createState() => _LoadingOverlayState();
}

class _LoadingOverlayState extends State<LoadingOverlay> {
  bool _isLoading = false;
  bool _isMessage = false;
  //TODO implement change the style according to message type
  bool _isMessageType = false;
  MessageType? _messageType;
  String? _message;
  void show() {
    setState(() {
      _isLoading = true;
    });
  }

  void hide() {
    setState(() {
      _isLoading = false;
      _isMessage = false;
      _isMessageType = false;
    });
  }

  void setMessage(String message, {MessageType? messageType}) {
    setState(() {
      _isMessage = true;
      _message = message;
      if (messageType != null) {
        _isMessageType = true;
        _messageType = messageType;
      }
      _isLoading = true;
    });
  }

  @override
  Widget build(BuildContext context) {
    final colors = context.theme.colorScheme;
    var height = MediaQuery.of(context).size.height;
    return Stack(
      children: [
        widget.child,
        if (_isLoading)
          BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 4.0, sigmaY: 4.0),
            child: const Opacity(
              opacity: 0.8,
              child: ModalBarrier(dismissible: false, color: Colors.black),
            ),
          ),
        if (_isLoading)
          Center(
            child: FutureBuilder(
              future: Future.delayed(widget.delay),
              builder: (context, snapshot) {
                return snapshot.connectionState == ConnectionState.done
                    ? _isMessage == false
                        ? const CircularProgressIndicator()
                        : Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              const CircularProgressIndicator(),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Text(
                                  _message!,
                                  style: TextStyle(
                                      fontSize: 15,
                                      color: colors.primary,
                                      decoration: TextDecoration.none),
                                ),
                              ),
                            ],
                          )
                    : const SizedBox();
              },
            ),
          ),
      ],
    );
  }
}
