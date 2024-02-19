import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class GratitudeBankRecord extends FirestoreRecord {
  GratitudeBankRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "question" field.
  String? _question;
  String get question => _question ?? '';
  bool hasQuestion() => _question != null;

  void _initializeFields() {
    _question = snapshotData['question'] as String?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('gratitudeBank');

  static Stream<GratitudeBankRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => GratitudeBankRecord.fromSnapshot(s));

  static Future<GratitudeBankRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => GratitudeBankRecord.fromSnapshot(s));

  static GratitudeBankRecord fromSnapshot(DocumentSnapshot snapshot) =>
      GratitudeBankRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static GratitudeBankRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      GratitudeBankRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'GratitudeBankRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is GratitudeBankRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createGratitudeBankRecordData({
  String? question,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'question': question,
    }.withoutNulls,
  );

  return firestoreData;
}

class GratitudeBankRecordDocumentEquality
    implements Equality<GratitudeBankRecord> {
  const GratitudeBankRecordDocumentEquality();

  @override
  bool equals(GratitudeBankRecord? e1, GratitudeBankRecord? e2) {
    return e1?.question == e2?.question;
  }

  @override
  int hash(GratitudeBankRecord? e) => const ListEquality().hash([e?.question]);

  @override
  bool isValidKey(Object? o) => o is GratitudeBankRecord;
}
