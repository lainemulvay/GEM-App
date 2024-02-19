import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class SubmitsRecord extends FirestoreRecord {
  SubmitsRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "date_time" field.
  DateTime? _dateTime;
  DateTime? get dateTime => _dateTime;
  bool hasDateTime() => _dateTime != null;

  DocumentReference get parentReference => reference.parent.parent!;

  void _initializeFields() {
    _dateTime = snapshotData['date_time'] as DateTime?;
  }

  static Query<Map<String, dynamic>> collection([DocumentReference? parent]) =>
      parent != null
          ? parent.collection('Submits')
          : FirebaseFirestore.instance.collectionGroup('Submits');

  static DocumentReference createDoc(DocumentReference parent, {String? id}) =>
      parent.collection('Submits').doc(id);

  static Stream<SubmitsRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => SubmitsRecord.fromSnapshot(s));

  static Future<SubmitsRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => SubmitsRecord.fromSnapshot(s));

  static SubmitsRecord fromSnapshot(DocumentSnapshot snapshot) =>
      SubmitsRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static SubmitsRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      SubmitsRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'SubmitsRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is SubmitsRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createSubmitsRecordData({
  DateTime? dateTime,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'date_time': dateTime,
    }.withoutNulls,
  );

  return firestoreData;
}

class SubmitsRecordDocumentEquality implements Equality<SubmitsRecord> {
  const SubmitsRecordDocumentEquality();

  @override
  bool equals(SubmitsRecord? e1, SubmitsRecord? e2) {
    return e1?.dateTime == e2?.dateTime;
  }

  @override
  int hash(SubmitsRecord? e) => const ListEquality().hash([e?.dateTime]);

  @override
  bool isValidKey(Object? o) => o is SubmitsRecord;
}
