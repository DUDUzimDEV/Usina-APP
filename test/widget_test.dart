// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility in the flutter_test package. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'package:usina_app/main.dart';

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  setUp(() {
    SharedPreferences.setMockInitialValues({});
  });

  testWidgets('deve abrir a tela de login quando não há sessão salva',
      (WidgetTester tester) async {
    SharedPreferences.setMockInitialValues({'loginRealizado': false});

    await tester.pumpWidget(const UsinaApp());
    await tester.pumpAndSettle();

    expect(find.text('Login'), findsOneWidget);
    expect(find.text('E-mail'), findsOneWidget);
    expect(find.text('Senha'), findsOneWidget);
  });

  testWidgets('abre e fecha o submenu Cadastro na tela principal',
      (WidgetTester tester) async {
    SharedPreferences.setMockInitialValues({'loginRealizado': true});

    await tester.pumpWidget(const UsinaApp());
    await tester.pumpAndSettle();

    expect(find.text('Usina App'), findsOneWidget);
    await tester.tap(find.byTooltip('Open navigation menu'));
    await tester.pumpAndSettle();

    expect(find.text('Menu Principal'), findsOneWidget);
    expect(find.text('Início'), findsOneWidget);
    expect(find.text('Unidade'), findsNothing);
    expect(find.byIcon(Icons.expand_more), findsOneWidget);

    await tester.tap(find.text('Início'));
    await tester.pump();

    await tester.tap(find.text('Cadastro'));
    await tester.pumpAndSettle();

    expect(find.byIcon(Icons.expand_less), findsOneWidget);
    expect(find.text('Unidade'), findsOneWidget);
    expect(find.text('Setor'), findsOneWidget);
    expect(find.text('Equipamento'), findsOneWidget);
    expect(find.text('Indicador'), findsOneWidget);
    expect(find.text('Funcionário'), findsOneWidget);
    expect(find.text('Tipo de Medição'), findsOneWidget);
    await tester.scrollUntilVisible(
      find.text('Parâmetro'),
      200,
      scrollable: find.byType(Scrollable).last,
    );
    expect(find.text('Parâmetro'), findsOneWidget);

    await tester.tap(find.text('Cadastro'));
    await tester.pumpAndSettle();

    expect(find.byIcon(Icons.expand_more), findsOneWidget);
    expect(find.text('Unidade'), findsNothing);
  });
}
