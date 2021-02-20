import 'package:firebase_core/firebase_core.dart';

extension FirebaseExceptionX on FirebaseException {
  bool get isPermissionDeniedException => code.contains('permission-denied');
}
