import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class ChatsRecord extends FirestoreRecord {
  ChatsRecord._(
    super.reference,
    super.data,
  ) {
    _initializeFields();
  }

  // "userids" field.
  List<DocumentReference>? _userids;
  List<DocumentReference> get userids => _userids ?? const [];
  bool hasUserids() => _userids != null;

  // "lastMessage" field.
  String? _lastMessage;
  String get lastMessage => _lastMessage ?? '';
  bool hasLastMessage() => _lastMessage != null;

  // "userNames" field.
  List<String>? _userNames;
  List<String> get userNames => _userNames ?? const [];
  bool hasUserNames() => _userNames != null;

  // "timeStamp" field.
  DateTime? _timeStamp;
  DateTime? get timeStamp => _timeStamp;
  bool hasTimeStamp() => _timeStamp != null;

  // "lastMessageSeenBy" field.
  List<DocumentReference>? _lastMessageSeenBy;
  List<DocumentReference> get lastMessageSeenBy =>
      _lastMessageSeenBy ?? const [];
  bool hasLastMessageSeenBy() => _lastMessageSeenBy != null;

  // "orderId" field.
  String? _orderId;
  String get orderId => _orderId ?? '';
  bool hasOrderId() => _orderId != null;

  void _initializeFields() {
    _userids = getDataList(snapshotData['userids']);
    _lastMessage = snapshotData['lastMessage'] as String?;
    _userNames = getDataList(snapshotData['userNames']);
    _timeStamp = snapshotData['timeStamp'] as DateTime?;
    _lastMessageSeenBy = getDataList(snapshotData['lastMessageSeenBy']);
    _orderId = snapshotData['orderId'] as String?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('chats');

  static Stream<ChatsRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => ChatsRecord.fromSnapshot(s));

  static Future<ChatsRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => ChatsRecord.fromSnapshot(s));

  static ChatsRecord fromSnapshot(DocumentSnapshot snapshot) => ChatsRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static ChatsRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      ChatsRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'ChatsRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is ChatsRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createChatsRecordData({
  String? lastMessage,
  DateTime? timeStamp,
  String? orderId,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'lastMessage': lastMessage,
      'timeStamp': timeStamp,
      'orderId': orderId,
    }.withoutNulls,
  );

  return firestoreData;
}

class ChatsRecordDocumentEquality implements Equality<ChatsRecord> {
  const ChatsRecordDocumentEquality();

  @override
  bool equals(ChatsRecord? e1, ChatsRecord? e2) {
    const listEquality = ListEquality();
    return listEquality.equals(e1?.userids, e2?.userids) &&
        e1?.lastMessage == e2?.lastMessage &&
        listEquality.equals(e1?.userNames, e2?.userNames) &&
        e1?.timeStamp == e2?.timeStamp &&
        listEquality.equals(e1?.lastMessageSeenBy, e2?.lastMessageSeenBy) &&
        e1?.orderId == e2?.orderId;
  }

  @override
  int hash(ChatsRecord? e) => const ListEquality().hash([
        e?.userids,
        e?.lastMessage,
        e?.userNames,
        e?.timeStamp,
        e?.lastMessageSeenBy,
        e?.orderId
      ]);

  @override
  bool isValidKey(Object? o) => o is ChatsRecord;
}
