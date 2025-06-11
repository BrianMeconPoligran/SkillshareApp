import 'package:flutter_test/flutter_test.dart';
import 'package:skillshare_app/main.dart';
import 'package:skillshare_app/screens/welcome_screen.dart';

void main() {
  testWidgets('Pantalla de bienvenida se muestra correctamente', (WidgetTester tester) async {
    await tester.pumpWidget(const SkillShareApp());

    expect(find.byType(WelcomeScreen), findsOneWidget);
    expect(find.text('SkillShare'), findsOneWidget); // Texto que sí existe
  });
}
