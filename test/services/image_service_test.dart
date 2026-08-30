import 'package:flutter_test/flutter_test.dart';
import 'package:walpy/services/image_service.dart';

void main() {
  group('ImageAPI configuration', () {
    test('reports a missing Pixabay API key before sending a request', () {
      expect(
        ImageAPI.getEditorChoiceImages(),
        throwsA(
          isA<StateError>().having(
            (error) => error.message,
            'message',
            contains('PIXABAY_API_KEY'),
          ),
        ),
      );
    });
  });
}
