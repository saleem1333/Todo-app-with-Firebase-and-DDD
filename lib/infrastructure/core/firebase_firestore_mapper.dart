import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:my_project/domain/auth/i_auth_facade.dart';

import '../../injections.dart';

extension FirebaseFirestoreMapperX on FirebaseFirestore {
  DocumentReference<Map<String, dynamic>> userDocument() {
    final currentSignedInUser = getIt<IAuthFacade>().currentUser!;
    return collection("users").doc(currentSignedInUser.uid);
  }
}




