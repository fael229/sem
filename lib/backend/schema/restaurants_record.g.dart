// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'restaurants_record.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<RestaurantsRecord> _$restaurantsRecordSerializer =
    new _$RestaurantsRecordSerializer();

class _$RestaurantsRecordSerializer
    implements StructuredSerializer<RestaurantsRecord> {
  @override
  final Iterable<Type> types = const [RestaurantsRecord, _$RestaurantsRecord];
  @override
  final String wireName = 'RestaurantsRecord';

  @override
  Iterable<Object?> serialize(Serializers serializers, RestaurantsRecord object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[];
    Object? value;
    value = object.nom;
    if (value != null) {
      result
        ..add('nom')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.slogan;
    if (value != null) {
      result
        ..add('slogan')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.plats;
    if (value != null) {
      result
        ..add('plats')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(BuiltList, const [
              const FullType(
                  DocumentReference, const [const FullType.nullable(Object)])
            ])));
    }
    value = object.platslist;
    if (value != null) {
      result
        ..add('platslist')
        ..add(serializers.serialize(value,
            specifiedType:
                const FullType(BuiltList, const [const FullType(String)])));
    }
    value = object.img;
    if (value != null) {
      result
        ..add('img')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.cover;
    if (value != null) {
      result
        ..add('cover')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.ouvClo;
    if (value != null) {
      result
        ..add('ouvClo')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.note;
    if (value != null) {
      result
        ..add('note')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(double)));
    }
    value = object.ouv;
    if (value != null) {
      result
        ..add('ouv')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(DateTime)));
    }
    value = object.clo;
    if (value != null) {
      result
        ..add('clo')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(DateTime)));
    }
    value = object.zone;
    if (value != null) {
      result
        ..add('zone')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.prio;
    if (value != null) {
      result
        ..add('prio')
        ..add(serializers.serialize(value, specifiedType: const FullType(int)));
    }
    value = object.catego;
    if (value != null) {
      result
        ..add('catego')
        ..add(serializers.serialize(value,
            specifiedType:
                const FullType(BuiltList, const [const FullType(String)])));
    }
    value = object.adresse;
    if (value != null) {
      result
        ..add('adresse')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.ratelist;
    if (value != null) {
      result
        ..add('ratelist')
        ..add(serializers.serialize(value,
            specifiedType:
                const FullType(BuiltList, const [const FullType(double)])));
    }
    value = object.tel;
    if (value != null) {
      result
        ..add('tel')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.ffRef;
    if (value != null) {
      result
        ..add('Document__Reference__Field')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(
                DocumentReference, const [const FullType.nullable(Object)])));
    }
    return result;
  }

  @override
  RestaurantsRecord deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new RestaurantsRecordBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'nom':
          result.nom = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'slogan':
          result.slogan = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'plats':
          result.plats.replace(serializers.deserialize(value,
              specifiedType: const FullType(BuiltList, const [
                const FullType(
                    DocumentReference, const [const FullType.nullable(Object)])
              ]))! as BuiltList<Object?>);
          break;
        case 'platslist':
          result.platslist.replace(serializers.deserialize(value,
                  specifiedType: const FullType(
                      BuiltList, const [const FullType(String)]))!
              as BuiltList<Object?>);
          break;
        case 'img':
          result.img = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'cover':
          result.cover = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'ouvClo':
          result.ouvClo = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'note':
          result.note = serializers.deserialize(value,
              specifiedType: const FullType(double)) as double?;
          break;
        case 'ouv':
          result.ouv = serializers.deserialize(value,
              specifiedType: const FullType(DateTime)) as DateTime?;
          break;
        case 'clo':
          result.clo = serializers.deserialize(value,
              specifiedType: const FullType(DateTime)) as DateTime?;
          break;
        case 'zone':
          result.zone = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'prio':
          result.prio = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int?;
          break;
        case 'catego':
          result.catego.replace(serializers.deserialize(value,
                  specifiedType: const FullType(
                      BuiltList, const [const FullType(String)]))!
              as BuiltList<Object?>);
          break;
        case 'adresse':
          result.adresse = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'ratelist':
          result.ratelist.replace(serializers.deserialize(value,
                  specifiedType: const FullType(
                      BuiltList, const [const FullType(double)]))!
              as BuiltList<Object?>);
          break;
        case 'tel':
          result.tel = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'Document__Reference__Field':
          result.ffRef = serializers.deserialize(value,
              specifiedType: const FullType(DocumentReference, const [
                const FullType.nullable(Object)
              ])) as DocumentReference<Object?>?;
          break;
      }
    }

    return result.build();
  }
}

class _$RestaurantsRecord extends RestaurantsRecord {
  @override
  final String? nom;
  @override
  final String? slogan;
  @override
  final BuiltList<DocumentReference<Object?>>? plats;
  @override
  final BuiltList<String>? platslist;
  @override
  final String? img;
  @override
  final String? cover;
  @override
  final String? ouvClo;
  @override
  final double? note;
  @override
  final DateTime? ouv;
  @override
  final DateTime? clo;
  @override
  final String? zone;
  @override
  final int? prio;
  @override
  final BuiltList<String>? catego;
  @override
  final String? adresse;
  @override
  final BuiltList<double>? ratelist;
  @override
  final String? tel;
  @override
  final DocumentReference<Object?>? ffRef;

  factory _$RestaurantsRecord(
          [void Function(RestaurantsRecordBuilder)? updates]) =>
      (new RestaurantsRecordBuilder()..update(updates))._build();

  _$RestaurantsRecord._(
      {this.nom,
      this.slogan,
      this.plats,
      this.platslist,
      this.img,
      this.cover,
      this.ouvClo,
      this.note,
      this.ouv,
      this.clo,
      this.zone,
      this.prio,
      this.catego,
      this.adresse,
      this.ratelist,
      this.tel,
      this.ffRef})
      : super._();

  @override
  RestaurantsRecord rebuild(void Function(RestaurantsRecordBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  RestaurantsRecordBuilder toBuilder() =>
      new RestaurantsRecordBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is RestaurantsRecord &&
        nom == other.nom &&
        slogan == other.slogan &&
        plats == other.plats &&
        platslist == other.platslist &&
        img == other.img &&
        cover == other.cover &&
        ouvClo == other.ouvClo &&
        note == other.note &&
        ouv == other.ouv &&
        clo == other.clo &&
        zone == other.zone &&
        prio == other.prio &&
        catego == other.catego &&
        adresse == other.adresse &&
        ratelist == other.ratelist &&
        tel == other.tel &&
        ffRef == other.ffRef;
  }

  @override
  int get hashCode {
    return $jf($jc(
        $jc(
            $jc(
                $jc(
                    $jc(
                        $jc(
                            $jc(
                                $jc(
                                    $jc(
                                        $jc(
                                            $jc(
                                                $jc(
                                                    $jc(
                                                        $jc(
                                                            $jc(
                                                                $jc(
                                                                    $jc(
                                                                        0,
                                                                        nom
                                                                            .hashCode),
                                                                    slogan
                                                                        .hashCode),
                                                                plats.hashCode),
                                                            platslist.hashCode),
                                                        img.hashCode),
                                                    cover.hashCode),
                                                ouvClo.hashCode),
                                            note.hashCode),
                                        ouv.hashCode),
                                    clo.hashCode),
                                zone.hashCode),
                            prio.hashCode),
                        catego.hashCode),
                    adresse.hashCode),
                ratelist.hashCode),
            tel.hashCode),
        ffRef.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'RestaurantsRecord')
          ..add('nom', nom)
          ..add('slogan', slogan)
          ..add('plats', plats)
          ..add('platslist', platslist)
          ..add('img', img)
          ..add('cover', cover)
          ..add('ouvClo', ouvClo)
          ..add('note', note)
          ..add('ouv', ouv)
          ..add('clo', clo)
          ..add('zone', zone)
          ..add('prio', prio)
          ..add('catego', catego)
          ..add('adresse', adresse)
          ..add('ratelist', ratelist)
          ..add('tel', tel)
          ..add('ffRef', ffRef))
        .toString();
  }
}

class RestaurantsRecordBuilder
    implements Builder<RestaurantsRecord, RestaurantsRecordBuilder> {
  _$RestaurantsRecord? _$v;

  String? _nom;
  String? get nom => _$this._nom;
  set nom(String? nom) => _$this._nom = nom;

  String? _slogan;
  String? get slogan => _$this._slogan;
  set slogan(String? slogan) => _$this._slogan = slogan;

  ListBuilder<DocumentReference<Object?>>? _plats;
  ListBuilder<DocumentReference<Object?>> get plats =>
      _$this._plats ??= new ListBuilder<DocumentReference<Object?>>();
  set plats(ListBuilder<DocumentReference<Object?>>? plats) =>
      _$this._plats = plats;

  ListBuilder<String>? _platslist;
  ListBuilder<String> get platslist =>
      _$this._platslist ??= new ListBuilder<String>();
  set platslist(ListBuilder<String>? platslist) =>
      _$this._platslist = platslist;

  String? _img;
  String? get img => _$this._img;
  set img(String? img) => _$this._img = img;

  String? _cover;
  String? get cover => _$this._cover;
  set cover(String? cover) => _$this._cover = cover;

  String? _ouvClo;
  String? get ouvClo => _$this._ouvClo;
  set ouvClo(String? ouvClo) => _$this._ouvClo = ouvClo;

  double? _note;
  double? get note => _$this._note;
  set note(double? note) => _$this._note = note;

  DateTime? _ouv;
  DateTime? get ouv => _$this._ouv;
  set ouv(DateTime? ouv) => _$this._ouv = ouv;

  DateTime? _clo;
  DateTime? get clo => _$this._clo;
  set clo(DateTime? clo) => _$this._clo = clo;

  String? _zone;
  String? get zone => _$this._zone;
  set zone(String? zone) => _$this._zone = zone;

  int? _prio;
  int? get prio => _$this._prio;
  set prio(int? prio) => _$this._prio = prio;

  ListBuilder<String>? _catego;
  ListBuilder<String> get catego =>
      _$this._catego ??= new ListBuilder<String>();
  set catego(ListBuilder<String>? catego) => _$this._catego = catego;

  String? _adresse;
  String? get adresse => _$this._adresse;
  set adresse(String? adresse) => _$this._adresse = adresse;

  ListBuilder<double>? _ratelist;
  ListBuilder<double> get ratelist =>
      _$this._ratelist ??= new ListBuilder<double>();
  set ratelist(ListBuilder<double>? ratelist) => _$this._ratelist = ratelist;

  String? _tel;
  String? get tel => _$this._tel;
  set tel(String? tel) => _$this._tel = tel;

  DocumentReference<Object?>? _ffRef;
  DocumentReference<Object?>? get ffRef => _$this._ffRef;
  set ffRef(DocumentReference<Object?>? ffRef) => _$this._ffRef = ffRef;

  RestaurantsRecordBuilder() {
    RestaurantsRecord._initializeBuilder(this);
  }

  RestaurantsRecordBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _nom = $v.nom;
      _slogan = $v.slogan;
      _plats = $v.plats?.toBuilder();
      _platslist = $v.platslist?.toBuilder();
      _img = $v.img;
      _cover = $v.cover;
      _ouvClo = $v.ouvClo;
      _note = $v.note;
      _ouv = $v.ouv;
      _clo = $v.clo;
      _zone = $v.zone;
      _prio = $v.prio;
      _catego = $v.catego?.toBuilder();
      _adresse = $v.adresse;
      _ratelist = $v.ratelist?.toBuilder();
      _tel = $v.tel;
      _ffRef = $v.ffRef;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(RestaurantsRecord other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$RestaurantsRecord;
  }

  @override
  void update(void Function(RestaurantsRecordBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  RestaurantsRecord build() => _build();

  _$RestaurantsRecord _build() {
    _$RestaurantsRecord _$result;
    try {
      _$result = _$v ??
          new _$RestaurantsRecord._(
              nom: nom,
              slogan: slogan,
              plats: _plats?.build(),
              platslist: _platslist?.build(),
              img: img,
              cover: cover,
              ouvClo: ouvClo,
              note: note,
              ouv: ouv,
              clo: clo,
              zone: zone,
              prio: prio,
              catego: _catego?.build(),
              adresse: adresse,
              ratelist: _ratelist?.build(),
              tel: tel,
              ffRef: ffRef);
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'plats';
        _plats?.build();
        _$failedField = 'platslist';
        _platslist?.build();

        _$failedField = 'catego';
        _catego?.build();

        _$failedField = 'ratelist';
        _ratelist?.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            r'RestaurantsRecord', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,deprecated_member_use_from_same_package,lines_longer_than_80_chars,no_leading_underscores_for_local_identifiers,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new,unnecessary_lambdas
