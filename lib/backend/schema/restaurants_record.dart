import 'dart:async';

import 'package:from_css_color/from_css_color.dart';

import 'index.dart';
import 'serializers.dart';
import 'package:built_value/built_value.dart';

part 'restaurants_record.g.dart';

abstract class RestaurantsRecord
    implements Built<RestaurantsRecord, RestaurantsRecordBuilder> {
  static Serializer<RestaurantsRecord> get serializer =>
      _$restaurantsRecordSerializer;

  String? get nom;

  String? get slogan;

  BuiltList<DocumentReference>? get plats;

  BuiltList<String>? get platslist;

  String? get img;

  String? get cover;

  String? get ouvClo;

  double? get note;

  DateTime? get ouv;

  DateTime? get clo;

  String? get zone;

  int? get prio;

  BuiltList<String>? get catego;

  String? get adresse;

  BuiltList<double>? get ratelist;

  String? get tel;

  @BuiltValueField(wireName: kDocumentReferenceField)
  DocumentReference? get ffRef;
  DocumentReference get reference => ffRef!;

  static void _initializeBuilder(RestaurantsRecordBuilder builder) => builder
    ..nom = ''
    ..slogan = ''
    ..plats = ListBuilder()
    ..platslist = ListBuilder()
    ..img = ''
    ..cover = ''
    ..ouvClo = ''
    ..note = 0.0
    ..zone = ''
    ..prio = 0
    ..catego = ListBuilder()
    ..adresse = ''
    ..ratelist = ListBuilder()
    ..tel = '';

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('restaurants');

  static Stream<RestaurantsRecord> getDocument(DocumentReference ref) => ref
      .snapshots()
      .map((s) => serializers.deserializeWith(serializer, serializedData(s))!);

  static Future<RestaurantsRecord> getDocumentOnce(DocumentReference ref) => ref
      .get()
      .then((s) => serializers.deserializeWith(serializer, serializedData(s))!);

  static RestaurantsRecord fromAlgolia(AlgoliaObjectSnapshot snapshot) =>
      RestaurantsRecord(
        (c) => c
          ..nom = snapshot.data['nom']
          ..slogan = snapshot.data['slogan']
          ..plats = safeGet(
              () => ListBuilder(snapshot.data['plats'].map((s) => toRef(s))))
          ..platslist = safeGet(() => ListBuilder(snapshot.data['platslist']))
          ..img = snapshot.data['img']
          ..cover = snapshot.data['cover']
          ..ouvClo = snapshot.data['ouvClo']
          ..note = snapshot.data['note']?.toDouble()
          ..ouv = safeGet(
              () => DateTime.fromMillisecondsSinceEpoch(snapshot.data['ouv']))
          ..clo = safeGet(
              () => DateTime.fromMillisecondsSinceEpoch(snapshot.data['clo']))
          ..zone = snapshot.data['zone']
          ..prio = snapshot.data['prio']?.round()
          ..catego = safeGet(() => ListBuilder(snapshot.data['catego']))
          ..adresse = snapshot.data['adresse']
          ..ratelist = safeGet(() => ListBuilder(
              snapshot.data['ratelist'].map((d) => (d as num).toDouble())))
          ..tel = snapshot.data['tel']
          ..ffRef = RestaurantsRecord.collection.doc(snapshot.objectID),
      );

  static Future<List<RestaurantsRecord>> search(
          {String? term,
          FutureOr<LatLng>? location,
          int? maxResults,
          double? searchRadiusMeters}) =>
      FFAlgoliaManager.instance
          .algoliaQuery(
            index: 'restaurants',
            term: term,
            maxResults: maxResults,
            location: location,
            searchRadiusMeters: searchRadiusMeters,
          )
          .then((r) => r.map(fromAlgolia).toList());

  RestaurantsRecord._();
  factory RestaurantsRecord([void Function(RestaurantsRecordBuilder) updates]) =
      _$RestaurantsRecord;

  static RestaurantsRecord getDocumentFromData(
          Map<String, dynamic> data, DocumentReference reference) =>
      serializers.deserializeWith(serializer,
          {...mapFromFirestore(data), kDocumentReferenceField: reference})!;
}

Map<String, dynamic> createRestaurantsRecordData({
  String? nom,
  String? slogan,
  String? img,
  String? cover,
  String? ouvClo,
  double? note,
  DateTime? ouv,
  DateTime? clo,
  String? zone,
  int? prio,
  String? adresse,
  String? tel,
}) {
  final firestoreData = serializers.toFirestore(
    RestaurantsRecord.serializer,
    RestaurantsRecord(
      (r) => r
        ..nom = nom
        ..slogan = slogan
        ..plats = null
        ..platslist = null
        ..img = img
        ..cover = cover
        ..ouvClo = ouvClo
        ..note = note
        ..ouv = ouv
        ..clo = clo
        ..zone = zone
        ..prio = prio
        ..catego = null
        ..adresse = adresse
        ..ratelist = null
        ..tel = tel,
    ),
  );

  return firestoreData;
}
