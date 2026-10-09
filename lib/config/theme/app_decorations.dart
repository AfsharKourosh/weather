/*
import 'package:flutter/material.dart';

class AppDecorations extends ThemeExtension<AppDecorations> {
  final BoxDecoration cardDecoration;

  const AppDecorations({required this.cardDecoration});

  @override
  AppDecorations copyWith({BoxDecoration? cardDecoration}) {
    return AppDecorations(
      cardDecoration: cardDecoration ?? this.cardDecoration,
    );
  }

  @override
  AppDecorations lerp(ThemeExtension<AppDecorations>? other, double t) {
    if (other is! AppDecorations) return this;
    return this;
    // AppDecorations(
    //   cardDecoration: BoxDecoration.lerp(
    //     cardDecoration,
    //     other.cardDecoration,
    //     t,
    //   )!,
    // );
  }
}



abstract final class AppDecorations2 {

  static final BoxDecoration  card = BoxDecoration(
    color: Colors.white,
    borderRadius: BorderRadius.circular(12),
    boxShadow: const [BoxShadow(color: Colors.black12, blurRadius: 4)],
  );

  static final BoxDecoration chatBubbleSent = BoxDecoration(
    color: Colors.blue.shade100,
    borderRadius: BorderRadius.circular(16),
  );

  static final BoxDecoration chatBubbleReceived = BoxDecoration(
    color: Colors.grey.shade200,
    borderRadius: BorderRadius.circular(16),
  );

  static final BoxDecoration inputField = BoxDecoration(
    color: Colors.grey.shade100,
    borderRadius: BorderRadius.circular(24),
  );
}
*/