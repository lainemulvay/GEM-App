import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class UserParametersRecord extends FirestoreRecord {
  UserParametersRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "notifs" field.
  bool? _notifs;
  bool get notifs => _notifs ?? false;
  bool hasNotifs() => _notifs != null;

  DocumentReference get parentReference => reference.parent.parent!;

  void _initializeFields() {
    _notifs = snapshotData['notifs'] as bool?;
  }

  static Query<Map<String, dynamic>> collection([DocumentReference? parent]) =>
      parent != null
          ? parent.collection('userParameters')
          : FirebaseFirestore.instance.collectionGroup('userParameters');

  static DocumentReference createDoc(DocumentReference parent, {String? id}) =>
      parent.collection('userParameters').doc(id);

  static Stream<UserParametersRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => UserParametersRecord.fromSnapshot(s));

  static Future<UserParametersRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => UserParametersRecord.fromSnapshot(s));

  static UserParametersRecord fromSnapshot(DocumentSnapshot snapshot) =>
      UserParametersRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static UserParametersRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      UserParametersRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'UserParametersRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is UserParametersRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createUserParametersRecordData({
  bool? notifs,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'notifs': notifs,
    }.withoutNulls,
  );

  return firestoreData;
}

class UserParametersRecordDocumentEquality
    implements Equality<UserParametersRecord> {
  const UserParametersRecordDocumentEquality();

  @override
  bool equals(UserParametersRecord? e1, UserParametersRecord? e2) {
    return e1?.notifs == e2?.notifs;
  }

  @override
  int hash(UserParametersRecord? e) => const ListEquality().hash([e?.notifs]);

  @override
  bool isValidKey(Object? o) => o is UserParametersRecord;
}
