import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class MindfulnessBankRecord extends FirestoreRecord {
  MindfulnessBankRecord._(
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
      FirebaseFirestore.instance.collection('mindfulnessBank');

  static Stream<MindfulnessBankRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => MindfulnessBankRecord.fromSnapshot(s));

  static Future<MindfulnessBankRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => MindfulnessBankRecord.fromSnapshot(s));

  static MindfulnessBankRecord fromSnapshot(DocumentSnapshot snapshot) =>
      MindfulnessBankRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static MindfulnessBankRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      MindfulnessBankRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'MindfulnessBankRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is MindfulnessBankRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createMindfulnessBankRecordData({
  String? question,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'question': question,
    }.withoutNulls,
  );

  return firestoreData;
}

class MindfulnessBankRecordDocumentEquality
    implements Equality<MindfulnessBankRecord> {
  const MindfulnessBankRecordDocumentEquality();

  @override
  bool equals(MindfulnessBankRecord? e1, MindfulnessBankRecord? e2) {
    return e1?.question == e2?.question;
  }

  @override
  int hash(MindfulnessBankRecord? e) =>
      const ListEquality().hash([e?.question]);

  @override
  bool isValidKey(Object? o) => o is MindfulnessBankRecord;
}
