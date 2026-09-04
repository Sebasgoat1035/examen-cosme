// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility in the flutter_test package. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:flutter_application_2/main.dart';

void main() {
  testWidgets('permite entrar al catálogo y abrir un producto', (
    WidgetTester tester,
  ) async {
    await tester.pumpWidget(const LuxeBeautyApp());

    expect(find.text('Welcome Back'), findsOneWidget);

    await tester.tap(find.text('Sign In'));
    await tester.pumpAndSettle();

    expect(find.text('Colección LUXE'), findsOneWidget);
    expect(find.text('Serum Glow'), findsOneWidget);

    await tester.tap(find.text('Serum Glow'));
    await tester.pumpAndSettle();

    expect(find.text('Detalle del producto'), findsOneWidget);
    expect(find.text('\$24.99'), findsOneWidget);

    await tester.tap(find.text('AGREGAR AL CARRITO'));
    await tester.pump();

    expect(find.text('Serum Glow se agregó al carrito'), findsOneWidget);
  });
}
