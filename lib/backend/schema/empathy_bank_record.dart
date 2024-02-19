import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class EmpathyBankRecord extends FirestoreRecord {
  EmpathyBankRecord._(
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
      FirebaseFirestore.instance.collection('empathyBank');

  static Stream<EmpathyBankRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => EmpathyBankRecord.fromSnapshot(s));

  static Future<EmpathyBankRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => EmpathyBankRecord.fromSnapshot(s));

  static EmpathyBankRecord fromSnapshot(DocumentSnapshot snapshot) =>
      EmpathyBankRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static EmpathyBankRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      EmpathyBankRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'EmpathyBankRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is EmpathyBankRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createEmpathyBankRecordData({
  String? question,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'question': question,
    }.withoutNulls,
  );

  return firestoreData;
}

class EmpathyBankRecordDocumentEquality implements Equality<EmpathyBankRecord> {
  const EmpathyBankRecordDocumentEquality();

  @override
  bool equals(EmpathyBankRecord? e1, EmpathyBankRecord? e2) {
    return e1?.question == e2?.question;
  }

  @override
  int hash(EmpathyBankRecord? e) => const ListEquality().hash([e?.question]);

  @override
  bool isValidKey(Object? o) => o is EmpathyBankRecord;
}
