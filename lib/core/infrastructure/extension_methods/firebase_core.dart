import 'package:cloud_firestore/cloud_firestore.dart';

extension FirebaseExceptionX on FirebaseException {
  bool get isPermissionDeniedException => code.contains('permission-denied');
}
