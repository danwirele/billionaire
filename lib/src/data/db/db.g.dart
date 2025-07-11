// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'db.dart';

// ignore_for_file: type=lint
class $CategoryTableTable extends CategoryTable
    with TableInfo<$CategoryTableTable, CategoryDbModel> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $CategoryTableTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
    'id',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
    defaultConstraints: GeneratedColumn.constraintIsAlways('UNIQUE'),
  );
  static const VerificationMeta _nameMeta = const VerificationMeta('name');
  @override
  late final GeneratedColumn<String> name = GeneratedColumn<String>(
    'name',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _emojiMeta = const VerificationMeta('emoji');
  @override
  late final GeneratedColumn<String> emoji = GeneratedColumn<String>(
    'emoji',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _isIncomeMeta = const VerificationMeta(
    'isIncome',
  );
  @override
  late final GeneratedColumn<bool> isIncome = GeneratedColumn<bool>(
    'is_income',
    aliasedName,
    false,
    type: DriftSqlType.bool,
    requiredDuringInsert: true,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'CHECK ("is_income" IN (0, 1))',
    ),
  );
  @override
  List<GeneratedColumn> get $columns => [id, name, emoji, isIncome];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'category_table';
  @override
  VerificationContext validateIntegrity(
    Insertable<CategoryDbModel> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    } else if (isInserting) {
      context.missing(_idMeta);
    }
    if (data.containsKey('name')) {
      context.handle(
        _nameMeta,
        name.isAcceptableOrUnknown(data['name']!, _nameMeta),
      );
    } else if (isInserting) {
      context.missing(_nameMeta);
    }
    if (data.containsKey('emoji')) {
      context.handle(
        _emojiMeta,
        emoji.isAcceptableOrUnknown(data['emoji']!, _emojiMeta),
      );
    } else if (isInserting) {
      context.missing(_emojiMeta);
    }
    if (data.containsKey('is_income')) {
      context.handle(
        _isIncomeMeta,
        isIncome.isAcceptableOrUnknown(data['is_income']!, _isIncomeMeta),
      );
    } else if (isInserting) {
      context.missing(_isIncomeMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => const {};
  @override
  CategoryDbModel map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return CategoryDbModel(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}id'],
      )!,
      name: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}name'],
      )!,
      emoji: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}emoji'],
      )!,
      isIncome: attachedDatabase.typeMapping.read(
        DriftSqlType.bool,
        data['${effectivePrefix}is_income'],
      )!,
    );
  }

  @override
  $CategoryTableTable createAlias(String alias) {
    return $CategoryTableTable(attachedDatabase, alias);
  }
}

class CategoryDbModel extends DataClass implements Insertable<CategoryDbModel> {
  final int id;
  final String name;
  final String emoji;
  final bool isIncome;
  const CategoryDbModel({
    required this.id,
    required this.name,
    required this.emoji,
    required this.isIncome,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['name'] = Variable<String>(name);
    map['emoji'] = Variable<String>(emoji);
    map['is_income'] = Variable<bool>(isIncome);
    return map;
  }

  CategoryTableCompanion toCompanion(bool nullToAbsent) {
    return CategoryTableCompanion(
      id: Value(id),
      name: Value(name),
      emoji: Value(emoji),
      isIncome: Value(isIncome),
    );
  }

  factory CategoryDbModel.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return CategoryDbModel(
      id: serializer.fromJson<int>(json['id']),
      name: serializer.fromJson<String>(json['name']),
      emoji: serializer.fromJson<String>(json['emoji']),
      isIncome: serializer.fromJson<bool>(json['isIncome']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'name': serializer.toJson<String>(name),
      'emoji': serializer.toJson<String>(emoji),
      'isIncome': serializer.toJson<bool>(isIncome),
    };
  }

  CategoryDbModel copyWith({
    int? id,
    String? name,
    String? emoji,
    bool? isIncome,
  }) => CategoryDbModel(
    id: id ?? this.id,
    name: name ?? this.name,
    emoji: emoji ?? this.emoji,
    isIncome: isIncome ?? this.isIncome,
  );
  CategoryDbModel copyWithCompanion(CategoryTableCompanion data) {
    return CategoryDbModel(
      id: data.id.present ? data.id.value : this.id,
      name: data.name.present ? data.name.value : this.name,
      emoji: data.emoji.present ? data.emoji.value : this.emoji,
      isIncome: data.isIncome.present ? data.isIncome.value : this.isIncome,
    );
  }

  @override
  String toString() {
    return (StringBuffer('CategoryDbModel(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('emoji: $emoji, ')
          ..write('isIncome: $isIncome')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, name, emoji, isIncome);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is CategoryDbModel &&
          other.id == this.id &&
          other.name == this.name &&
          other.emoji == this.emoji &&
          other.isIncome == this.isIncome);
}

class CategoryTableCompanion extends UpdateCompanion<CategoryDbModel> {
  final Value<int> id;
  final Value<String> name;
  final Value<String> emoji;
  final Value<bool> isIncome;
  final Value<int> rowid;
  const CategoryTableCompanion({
    this.id = const Value.absent(),
    this.name = const Value.absent(),
    this.emoji = const Value.absent(),
    this.isIncome = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  CategoryTableCompanion.insert({
    required int id,
    required String name,
    required String emoji,
    required bool isIncome,
    this.rowid = const Value.absent(),
  }) : id = Value(id),
       name = Value(name),
       emoji = Value(emoji),
       isIncome = Value(isIncome);
  static Insertable<CategoryDbModel> custom({
    Expression<int>? id,
    Expression<String>? name,
    Expression<String>? emoji,
    Expression<bool>? isIncome,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (name != null) 'name': name,
      if (emoji != null) 'emoji': emoji,
      if (isIncome != null) 'is_income': isIncome,
      if (rowid != null) 'rowid': rowid,
    });
  }

  CategoryTableCompanion copyWith({
    Value<int>? id,
    Value<String>? name,
    Value<String>? emoji,
    Value<bool>? isIncome,
    Value<int>? rowid,
  }) {
    return CategoryTableCompanion(
      id: id ?? this.id,
      name: name ?? this.name,
      emoji: emoji ?? this.emoji,
      isIncome: isIncome ?? this.isIncome,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (name.present) {
      map['name'] = Variable<String>(name.value);
    }
    if (emoji.present) {
      map['emoji'] = Variable<String>(emoji.value);
    }
    if (isIncome.present) {
      map['is_income'] = Variable<bool>(isIncome.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('CategoryTableCompanion(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('emoji: $emoji, ')
          ..write('isIncome: $isIncome, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $TransactionTableTable extends TransactionTable
    with TableInfo<$TransactionTableTable, TransactionDbModel> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $TransactionTableTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
    'id',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
    defaultConstraints: GeneratedColumn.constraintIsAlways('UNIQUE'),
  );
  static const VerificationMeta _accountIdMeta = const VerificationMeta(
    'accountId',
  );
  @override
  late final GeneratedColumn<int> accountId = GeneratedColumn<int>(
    'account_id',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _categoryIdMeta = const VerificationMeta(
    'categoryId',
  );
  @override
  late final GeneratedColumn<int> categoryId = GeneratedColumn<int>(
    'category_id',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _amountMeta = const VerificationMeta('amount');
  @override
  late final GeneratedColumn<String> amount = GeneratedColumn<String>(
    'amount',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _transactionDateMeta = const VerificationMeta(
    'transactionDate',
  );
  @override
  late final GeneratedColumn<DateTime> transactionDate =
      GeneratedColumn<DateTime>(
        'transaction_date',
        aliasedName,
        false,
        type: DriftSqlType.dateTime,
        requiredDuringInsert: true,
      );
  static const VerificationMeta _updatedAtMeta = const VerificationMeta(
    'updatedAt',
  );
  @override
  late final GeneratedColumn<DateTime> updatedAt = GeneratedColumn<DateTime>(
    'updated_at',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _createdAtMeta = const VerificationMeta(
    'createdAt',
  );
  @override
  late final GeneratedColumn<DateTime> createdAt = GeneratedColumn<DateTime>(
    'created_at',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _commentMeta = const VerificationMeta(
    'comment',
  );
  @override
  late final GeneratedColumn<String> comment = GeneratedColumn<String>(
    'comment',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  @override
  List<GeneratedColumn> get $columns => [
    id,
    accountId,
    categoryId,
    amount,
    transactionDate,
    updatedAt,
    createdAt,
    comment,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'transaction_table';
  @override
  VerificationContext validateIntegrity(
    Insertable<TransactionDbModel> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    } else if (isInserting) {
      context.missing(_idMeta);
    }
    if (data.containsKey('account_id')) {
      context.handle(
        _accountIdMeta,
        accountId.isAcceptableOrUnknown(data['account_id']!, _accountIdMeta),
      );
    } else if (isInserting) {
      context.missing(_accountIdMeta);
    }
    if (data.containsKey('category_id')) {
      context.handle(
        _categoryIdMeta,
        categoryId.isAcceptableOrUnknown(data['category_id']!, _categoryIdMeta),
      );
    } else if (isInserting) {
      context.missing(_categoryIdMeta);
    }
    if (data.containsKey('amount')) {
      context.handle(
        _amountMeta,
        amount.isAcceptableOrUnknown(data['amount']!, _amountMeta),
      );
    } else if (isInserting) {
      context.missing(_amountMeta);
    }
    if (data.containsKey('transaction_date')) {
      context.handle(
        _transactionDateMeta,
        transactionDate.isAcceptableOrUnknown(
          data['transaction_date']!,
          _transactionDateMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_transactionDateMeta);
    }
    if (data.containsKey('updated_at')) {
      context.handle(
        _updatedAtMeta,
        updatedAt.isAcceptableOrUnknown(data['updated_at']!, _updatedAtMeta),
      );
    } else if (isInserting) {
      context.missing(_updatedAtMeta);
    }
    if (data.containsKey('created_at')) {
      context.handle(
        _createdAtMeta,
        createdAt.isAcceptableOrUnknown(data['created_at']!, _createdAtMeta),
      );
    } else if (isInserting) {
      context.missing(_createdAtMeta);
    }
    if (data.containsKey('comment')) {
      context.handle(
        _commentMeta,
        comment.isAcceptableOrUnknown(data['comment']!, _commentMeta),
      );
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => const {};
  @override
  TransactionDbModel map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return TransactionDbModel(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}id'],
      )!,
      accountId: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}account_id'],
      )!,
      categoryId: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}category_id'],
      )!,
      amount: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}amount'],
      )!,
      transactionDate: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}transaction_date'],
      )!,
      updatedAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}updated_at'],
      )!,
      createdAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}created_at'],
      )!,
      comment: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}comment'],
      ),
    );
  }

  @override
  $TransactionTableTable createAlias(String alias) {
    return $TransactionTableTable(attachedDatabase, alias);
  }
}

class TransactionDbModel extends DataClass
    implements Insertable<TransactionDbModel> {
  final int id;
  final int accountId;
  final int categoryId;
  final String amount;
  final DateTime transactionDate;
  final DateTime updatedAt;
  final DateTime createdAt;
  final String? comment;
  const TransactionDbModel({
    required this.id,
    required this.accountId,
    required this.categoryId,
    required this.amount,
    required this.transactionDate,
    required this.updatedAt,
    required this.createdAt,
    this.comment,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['account_id'] = Variable<int>(accountId);
    map['category_id'] = Variable<int>(categoryId);
    map['amount'] = Variable<String>(amount);
    map['transaction_date'] = Variable<DateTime>(transactionDate);
    map['updated_at'] = Variable<DateTime>(updatedAt);
    map['created_at'] = Variable<DateTime>(createdAt);
    if (!nullToAbsent || comment != null) {
      map['comment'] = Variable<String>(comment);
    }
    return map;
  }

  TransactionTableCompanion toCompanion(bool nullToAbsent) {
    return TransactionTableCompanion(
      id: Value(id),
      accountId: Value(accountId),
      categoryId: Value(categoryId),
      amount: Value(amount),
      transactionDate: Value(transactionDate),
      updatedAt: Value(updatedAt),
      createdAt: Value(createdAt),
      comment: comment == null && nullToAbsent
          ? const Value.absent()
          : Value(comment),
    );
  }

  factory TransactionDbModel.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return TransactionDbModel(
      id: serializer.fromJson<int>(json['id']),
      accountId: serializer.fromJson<int>(json['accountId']),
      categoryId: serializer.fromJson<int>(json['categoryId']),
      amount: serializer.fromJson<String>(json['amount']),
      transactionDate: serializer.fromJson<DateTime>(json['transactionDate']),
      updatedAt: serializer.fromJson<DateTime>(json['updatedAt']),
      createdAt: serializer.fromJson<DateTime>(json['createdAt']),
      comment: serializer.fromJson<String?>(json['comment']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'accountId': serializer.toJson<int>(accountId),
      'categoryId': serializer.toJson<int>(categoryId),
      'amount': serializer.toJson<String>(amount),
      'transactionDate': serializer.toJson<DateTime>(transactionDate),
      'updatedAt': serializer.toJson<DateTime>(updatedAt),
      'createdAt': serializer.toJson<DateTime>(createdAt),
      'comment': serializer.toJson<String?>(comment),
    };
  }

  TransactionDbModel copyWith({
    int? id,
    int? accountId,
    int? categoryId,
    String? amount,
    DateTime? transactionDate,
    DateTime? updatedAt,
    DateTime? createdAt,
    Value<String?> comment = const Value.absent(),
  }) => TransactionDbModel(
    id: id ?? this.id,
    accountId: accountId ?? this.accountId,
    categoryId: categoryId ?? this.categoryId,
    amount: amount ?? this.amount,
    transactionDate: transactionDate ?? this.transactionDate,
    updatedAt: updatedAt ?? this.updatedAt,
    createdAt: createdAt ?? this.createdAt,
    comment: comment.present ? comment.value : this.comment,
  );
  TransactionDbModel copyWithCompanion(TransactionTableCompanion data) {
    return TransactionDbModel(
      id: data.id.present ? data.id.value : this.id,
      accountId: data.accountId.present ? data.accountId.value : this.accountId,
      categoryId: data.categoryId.present
          ? data.categoryId.value
          : this.categoryId,
      amount: data.amount.present ? data.amount.value : this.amount,
      transactionDate: data.transactionDate.present
          ? data.transactionDate.value
          : this.transactionDate,
      updatedAt: data.updatedAt.present ? data.updatedAt.value : this.updatedAt,
      createdAt: data.createdAt.present ? data.createdAt.value : this.createdAt,
      comment: data.comment.present ? data.comment.value : this.comment,
    );
  }

  @override
  String toString() {
    return (StringBuffer('TransactionDbModel(')
          ..write('id: $id, ')
          ..write('accountId: $accountId, ')
          ..write('categoryId: $categoryId, ')
          ..write('amount: $amount, ')
          ..write('transactionDate: $transactionDate, ')
          ..write('updatedAt: $updatedAt, ')
          ..write('createdAt: $createdAt, ')
          ..write('comment: $comment')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
    id,
    accountId,
    categoryId,
    amount,
    transactionDate,
    updatedAt,
    createdAt,
    comment,
  );
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is TransactionDbModel &&
          other.id == this.id &&
          other.accountId == this.accountId &&
          other.categoryId == this.categoryId &&
          other.amount == this.amount &&
          other.transactionDate == this.transactionDate &&
          other.updatedAt == this.updatedAt &&
          other.createdAt == this.createdAt &&
          other.comment == this.comment);
}

class TransactionTableCompanion extends UpdateCompanion<TransactionDbModel> {
  final Value<int> id;
  final Value<int> accountId;
  final Value<int> categoryId;
  final Value<String> amount;
  final Value<DateTime> transactionDate;
  final Value<DateTime> updatedAt;
  final Value<DateTime> createdAt;
  final Value<String?> comment;
  final Value<int> rowid;
  const TransactionTableCompanion({
    this.id = const Value.absent(),
    this.accountId = const Value.absent(),
    this.categoryId = const Value.absent(),
    this.amount = const Value.absent(),
    this.transactionDate = const Value.absent(),
    this.updatedAt = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.comment = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  TransactionTableCompanion.insert({
    required int id,
    required int accountId,
    required int categoryId,
    required String amount,
    required DateTime transactionDate,
    required DateTime updatedAt,
    required DateTime createdAt,
    this.comment = const Value.absent(),
    this.rowid = const Value.absent(),
  }) : id = Value(id),
       accountId = Value(accountId),
       categoryId = Value(categoryId),
       amount = Value(amount),
       transactionDate = Value(transactionDate),
       updatedAt = Value(updatedAt),
       createdAt = Value(createdAt);
  static Insertable<TransactionDbModel> custom({
    Expression<int>? id,
    Expression<int>? accountId,
    Expression<int>? categoryId,
    Expression<String>? amount,
    Expression<DateTime>? transactionDate,
    Expression<DateTime>? updatedAt,
    Expression<DateTime>? createdAt,
    Expression<String>? comment,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (accountId != null) 'account_id': accountId,
      if (categoryId != null) 'category_id': categoryId,
      if (amount != null) 'amount': amount,
      if (transactionDate != null) 'transaction_date': transactionDate,
      if (updatedAt != null) 'updated_at': updatedAt,
      if (createdAt != null) 'created_at': createdAt,
      if (comment != null) 'comment': comment,
      if (rowid != null) 'rowid': rowid,
    });
  }

  TransactionTableCompanion copyWith({
    Value<int>? id,
    Value<int>? accountId,
    Value<int>? categoryId,
    Value<String>? amount,
    Value<DateTime>? transactionDate,
    Value<DateTime>? updatedAt,
    Value<DateTime>? createdAt,
    Value<String?>? comment,
    Value<int>? rowid,
  }) {
    return TransactionTableCompanion(
      id: id ?? this.id,
      accountId: accountId ?? this.accountId,
      categoryId: categoryId ?? this.categoryId,
      amount: amount ?? this.amount,
      transactionDate: transactionDate ?? this.transactionDate,
      updatedAt: updatedAt ?? this.updatedAt,
      createdAt: createdAt ?? this.createdAt,
      comment: comment ?? this.comment,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (accountId.present) {
      map['account_id'] = Variable<int>(accountId.value);
    }
    if (categoryId.present) {
      map['category_id'] = Variable<int>(categoryId.value);
    }
    if (amount.present) {
      map['amount'] = Variable<String>(amount.value);
    }
    if (transactionDate.present) {
      map['transaction_date'] = Variable<DateTime>(transactionDate.value);
    }
    if (updatedAt.present) {
      map['updated_at'] = Variable<DateTime>(updatedAt.value);
    }
    if (createdAt.present) {
      map['created_at'] = Variable<DateTime>(createdAt.value);
    }
    if (comment.present) {
      map['comment'] = Variable<String>(comment.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('TransactionTableCompanion(')
          ..write('id: $id, ')
          ..write('accountId: $accountId, ')
          ..write('categoryId: $categoryId, ')
          ..write('amount: $amount, ')
          ..write('transactionDate: $transactionDate, ')
          ..write('updatedAt: $updatedAt, ')
          ..write('createdAt: $createdAt, ')
          ..write('comment: $comment, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $AccountTableTable extends AccountTable
    with TableInfo<$AccountTableTable, AccountDbModel> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $AccountTableTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
    'id',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
    defaultConstraints: GeneratedColumn.constraintIsAlways('UNIQUE'),
  );
  static const VerificationMeta _userIdMeta = const VerificationMeta('userId');
  @override
  late final GeneratedColumn<int> userId = GeneratedColumn<int>(
    'user_id',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _nameMeta = const VerificationMeta('name');
  @override
  late final GeneratedColumn<String> name = GeneratedColumn<String>(
    'name',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _balanceMeta = const VerificationMeta(
    'balance',
  );
  @override
  late final GeneratedColumn<String> balance = GeneratedColumn<String>(
    'balance',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _currencyMeta = const VerificationMeta(
    'currency',
  );
  @override
  late final GeneratedColumn<String> currency = GeneratedColumn<String>(
    'currency',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _updatedAtMeta = const VerificationMeta(
    'updatedAt',
  );
  @override
  late final GeneratedColumn<DateTime> updatedAt = GeneratedColumn<DateTime>(
    'updated_at',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _createdAtMeta = const VerificationMeta(
    'createdAt',
  );
  @override
  late final GeneratedColumn<DateTime> createdAt = GeneratedColumn<DateTime>(
    'created_at',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: true,
  );
  @override
  List<GeneratedColumn> get $columns => [
    id,
    userId,
    name,
    balance,
    currency,
    updatedAt,
    createdAt,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'account_table';
  @override
  VerificationContext validateIntegrity(
    Insertable<AccountDbModel> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    } else if (isInserting) {
      context.missing(_idMeta);
    }
    if (data.containsKey('user_id')) {
      context.handle(
        _userIdMeta,
        userId.isAcceptableOrUnknown(data['user_id']!, _userIdMeta),
      );
    } else if (isInserting) {
      context.missing(_userIdMeta);
    }
    if (data.containsKey('name')) {
      context.handle(
        _nameMeta,
        name.isAcceptableOrUnknown(data['name']!, _nameMeta),
      );
    } else if (isInserting) {
      context.missing(_nameMeta);
    }
    if (data.containsKey('balance')) {
      context.handle(
        _balanceMeta,
        balance.isAcceptableOrUnknown(data['balance']!, _balanceMeta),
      );
    } else if (isInserting) {
      context.missing(_balanceMeta);
    }
    if (data.containsKey('currency')) {
      context.handle(
        _currencyMeta,
        currency.isAcceptableOrUnknown(data['currency']!, _currencyMeta),
      );
    } else if (isInserting) {
      context.missing(_currencyMeta);
    }
    if (data.containsKey('updated_at')) {
      context.handle(
        _updatedAtMeta,
        updatedAt.isAcceptableOrUnknown(data['updated_at']!, _updatedAtMeta),
      );
    } else if (isInserting) {
      context.missing(_updatedAtMeta);
    }
    if (data.containsKey('created_at')) {
      context.handle(
        _createdAtMeta,
        createdAt.isAcceptableOrUnknown(data['created_at']!, _createdAtMeta),
      );
    } else if (isInserting) {
      context.missing(_createdAtMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => const {};
  @override
  AccountDbModel map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return AccountDbModel(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}id'],
      )!,
      userId: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}user_id'],
      )!,
      name: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}name'],
      )!,
      balance: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}balance'],
      )!,
      currency: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}currency'],
      )!,
      updatedAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}updated_at'],
      )!,
      createdAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}created_at'],
      )!,
    );
  }

  @override
  $AccountTableTable createAlias(String alias) {
    return $AccountTableTable(attachedDatabase, alias);
  }
}

class AccountDbModel extends DataClass implements Insertable<AccountDbModel> {
  final int id;
  final int userId;
  final String name;
  final String balance;
  final String currency;
  final DateTime updatedAt;
  final DateTime createdAt;
  const AccountDbModel({
    required this.id,
    required this.userId,
    required this.name,
    required this.balance,
    required this.currency,
    required this.updatedAt,
    required this.createdAt,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['user_id'] = Variable<int>(userId);
    map['name'] = Variable<String>(name);
    map['balance'] = Variable<String>(balance);
    map['currency'] = Variable<String>(currency);
    map['updated_at'] = Variable<DateTime>(updatedAt);
    map['created_at'] = Variable<DateTime>(createdAt);
    return map;
  }

  AccountTableCompanion toCompanion(bool nullToAbsent) {
    return AccountTableCompanion(
      id: Value(id),
      userId: Value(userId),
      name: Value(name),
      balance: Value(balance),
      currency: Value(currency),
      updatedAt: Value(updatedAt),
      createdAt: Value(createdAt),
    );
  }

  factory AccountDbModel.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return AccountDbModel(
      id: serializer.fromJson<int>(json['id']),
      userId: serializer.fromJson<int>(json['userId']),
      name: serializer.fromJson<String>(json['name']),
      balance: serializer.fromJson<String>(json['balance']),
      currency: serializer.fromJson<String>(json['currency']),
      updatedAt: serializer.fromJson<DateTime>(json['updatedAt']),
      createdAt: serializer.fromJson<DateTime>(json['createdAt']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'userId': serializer.toJson<int>(userId),
      'name': serializer.toJson<String>(name),
      'balance': serializer.toJson<String>(balance),
      'currency': serializer.toJson<String>(currency),
      'updatedAt': serializer.toJson<DateTime>(updatedAt),
      'createdAt': serializer.toJson<DateTime>(createdAt),
    };
  }

  AccountDbModel copyWith({
    int? id,
    int? userId,
    String? name,
    String? balance,
    String? currency,
    DateTime? updatedAt,
    DateTime? createdAt,
  }) => AccountDbModel(
    id: id ?? this.id,
    userId: userId ?? this.userId,
    name: name ?? this.name,
    balance: balance ?? this.balance,
    currency: currency ?? this.currency,
    updatedAt: updatedAt ?? this.updatedAt,
    createdAt: createdAt ?? this.createdAt,
  );
  AccountDbModel copyWithCompanion(AccountTableCompanion data) {
    return AccountDbModel(
      id: data.id.present ? data.id.value : this.id,
      userId: data.userId.present ? data.userId.value : this.userId,
      name: data.name.present ? data.name.value : this.name,
      balance: data.balance.present ? data.balance.value : this.balance,
      currency: data.currency.present ? data.currency.value : this.currency,
      updatedAt: data.updatedAt.present ? data.updatedAt.value : this.updatedAt,
      createdAt: data.createdAt.present ? data.createdAt.value : this.createdAt,
    );
  }

  @override
  String toString() {
    return (StringBuffer('AccountDbModel(')
          ..write('id: $id, ')
          ..write('userId: $userId, ')
          ..write('name: $name, ')
          ..write('balance: $balance, ')
          ..write('currency: $currency, ')
          ..write('updatedAt: $updatedAt, ')
          ..write('createdAt: $createdAt')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode =>
      Object.hash(id, userId, name, balance, currency, updatedAt, createdAt);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is AccountDbModel &&
          other.id == this.id &&
          other.userId == this.userId &&
          other.name == this.name &&
          other.balance == this.balance &&
          other.currency == this.currency &&
          other.updatedAt == this.updatedAt &&
          other.createdAt == this.createdAt);
}

class AccountTableCompanion extends UpdateCompanion<AccountDbModel> {
  final Value<int> id;
  final Value<int> userId;
  final Value<String> name;
  final Value<String> balance;
  final Value<String> currency;
  final Value<DateTime> updatedAt;
  final Value<DateTime> createdAt;
  final Value<int> rowid;
  const AccountTableCompanion({
    this.id = const Value.absent(),
    this.userId = const Value.absent(),
    this.name = const Value.absent(),
    this.balance = const Value.absent(),
    this.currency = const Value.absent(),
    this.updatedAt = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  AccountTableCompanion.insert({
    required int id,
    required int userId,
    required String name,
    required String balance,
    required String currency,
    required DateTime updatedAt,
    required DateTime createdAt,
    this.rowid = const Value.absent(),
  }) : id = Value(id),
       userId = Value(userId),
       name = Value(name),
       balance = Value(balance),
       currency = Value(currency),
       updatedAt = Value(updatedAt),
       createdAt = Value(createdAt);
  static Insertable<AccountDbModel> custom({
    Expression<int>? id,
    Expression<int>? userId,
    Expression<String>? name,
    Expression<String>? balance,
    Expression<String>? currency,
    Expression<DateTime>? updatedAt,
    Expression<DateTime>? createdAt,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (userId != null) 'user_id': userId,
      if (name != null) 'name': name,
      if (balance != null) 'balance': balance,
      if (currency != null) 'currency': currency,
      if (updatedAt != null) 'updated_at': updatedAt,
      if (createdAt != null) 'created_at': createdAt,
      if (rowid != null) 'rowid': rowid,
    });
  }

  AccountTableCompanion copyWith({
    Value<int>? id,
    Value<int>? userId,
    Value<String>? name,
    Value<String>? balance,
    Value<String>? currency,
    Value<DateTime>? updatedAt,
    Value<DateTime>? createdAt,
    Value<int>? rowid,
  }) {
    return AccountTableCompanion(
      id: id ?? this.id,
      userId: userId ?? this.userId,
      name: name ?? this.name,
      balance: balance ?? this.balance,
      currency: currency ?? this.currency,
      updatedAt: updatedAt ?? this.updatedAt,
      createdAt: createdAt ?? this.createdAt,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (userId.present) {
      map['user_id'] = Variable<int>(userId.value);
    }
    if (name.present) {
      map['name'] = Variable<String>(name.value);
    }
    if (balance.present) {
      map['balance'] = Variable<String>(balance.value);
    }
    if (currency.present) {
      map['currency'] = Variable<String>(currency.value);
    }
    if (updatedAt.present) {
      map['updated_at'] = Variable<DateTime>(updatedAt.value);
    }
    if (createdAt.present) {
      map['created_at'] = Variable<DateTime>(createdAt.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('AccountTableCompanion(')
          ..write('id: $id, ')
          ..write('userId: $userId, ')
          ..write('name: $name, ')
          ..write('balance: $balance, ')
          ..write('currency: $currency, ')
          ..write('updatedAt: $updatedAt, ')
          ..write('createdAt: $createdAt, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $CreateTransactionEventTableTable extends CreateTransactionEventTable
    with
        TableInfo<
          $CreateTransactionEventTableTable,
          CreateTransactionEventDbModel
        > {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $CreateTransactionEventTableTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
    'id',
    aliasedName,
    false,
    hasAutoIncrement: true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'PRIMARY KEY AUTOINCREMENT',
    ),
  );
  static const VerificationMeta _accountIdMeta = const VerificationMeta(
    'accountId',
  );
  @override
  late final GeneratedColumn<int> accountId = GeneratedColumn<int>(
    'account_id',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _categoryIdMeta = const VerificationMeta(
    'categoryId',
  );
  @override
  late final GeneratedColumn<int> categoryId = GeneratedColumn<int>(
    'category_id',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _amountMeta = const VerificationMeta('amount');
  @override
  late final GeneratedColumn<String> amount = GeneratedColumn<String>(
    'amount',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _transactionDateMeta = const VerificationMeta(
    'transactionDate',
  );
  @override
  late final GeneratedColumn<DateTime> transactionDate =
      GeneratedColumn<DateTime>(
        'transaction_date',
        aliasedName,
        false,
        type: DriftSqlType.dateTime,
        requiredDuringInsert: true,
      );
  static const VerificationMeta _createdAtMeta = const VerificationMeta(
    'createdAt',
  );
  @override
  late final GeneratedColumn<DateTime> createdAt = GeneratedColumn<DateTime>(
    'created_at',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _updatedAtMeta = const VerificationMeta(
    'updatedAt',
  );
  @override
  late final GeneratedColumn<DateTime> updatedAt = GeneratedColumn<DateTime>(
    'updated_at',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _commentMeta = const VerificationMeta(
    'comment',
  );
  @override
  late final GeneratedColumn<String> comment = GeneratedColumn<String>(
    'comment',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  @override
  List<GeneratedColumn> get $columns => [
    id,
    accountId,
    categoryId,
    amount,
    transactionDate,
    createdAt,
    updatedAt,
    comment,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'create_transaction_event_table';
  @override
  VerificationContext validateIntegrity(
    Insertable<CreateTransactionEventDbModel> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('account_id')) {
      context.handle(
        _accountIdMeta,
        accountId.isAcceptableOrUnknown(data['account_id']!, _accountIdMeta),
      );
    } else if (isInserting) {
      context.missing(_accountIdMeta);
    }
    if (data.containsKey('category_id')) {
      context.handle(
        _categoryIdMeta,
        categoryId.isAcceptableOrUnknown(data['category_id']!, _categoryIdMeta),
      );
    } else if (isInserting) {
      context.missing(_categoryIdMeta);
    }
    if (data.containsKey('amount')) {
      context.handle(
        _amountMeta,
        amount.isAcceptableOrUnknown(data['amount']!, _amountMeta),
      );
    } else if (isInserting) {
      context.missing(_amountMeta);
    }
    if (data.containsKey('transaction_date')) {
      context.handle(
        _transactionDateMeta,
        transactionDate.isAcceptableOrUnknown(
          data['transaction_date']!,
          _transactionDateMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_transactionDateMeta);
    }
    if (data.containsKey('created_at')) {
      context.handle(
        _createdAtMeta,
        createdAt.isAcceptableOrUnknown(data['created_at']!, _createdAtMeta),
      );
    } else if (isInserting) {
      context.missing(_createdAtMeta);
    }
    if (data.containsKey('updated_at')) {
      context.handle(
        _updatedAtMeta,
        updatedAt.isAcceptableOrUnknown(data['updated_at']!, _updatedAtMeta),
      );
    } else if (isInserting) {
      context.missing(_updatedAtMeta);
    }
    if (data.containsKey('comment')) {
      context.handle(
        _commentMeta,
        comment.isAcceptableOrUnknown(data['comment']!, _commentMeta),
      );
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  CreateTransactionEventDbModel map(
    Map<String, dynamic> data, {
    String? tablePrefix,
  }) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return CreateTransactionEventDbModel(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}id'],
      )!,
      accountId: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}account_id'],
      )!,
      categoryId: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}category_id'],
      )!,
      amount: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}amount'],
      )!,
      transactionDate: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}transaction_date'],
      )!,
      createdAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}created_at'],
      )!,
      updatedAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}updated_at'],
      )!,
      comment: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}comment'],
      ),
    );
  }

  @override
  $CreateTransactionEventTableTable createAlias(String alias) {
    return $CreateTransactionEventTableTable(attachedDatabase, alias);
  }
}

class CreateTransactionEventDbModel extends DataClass
    implements Insertable<CreateTransactionEventDbModel> {
  final int id;
  final int accountId;
  final int categoryId;
  final String amount;
  final DateTime transactionDate;
  final DateTime createdAt;
  final DateTime updatedAt;
  final String? comment;
  const CreateTransactionEventDbModel({
    required this.id,
    required this.accountId,
    required this.categoryId,
    required this.amount,
    required this.transactionDate,
    required this.createdAt,
    required this.updatedAt,
    this.comment,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['account_id'] = Variable<int>(accountId);
    map['category_id'] = Variable<int>(categoryId);
    map['amount'] = Variable<String>(amount);
    map['transaction_date'] = Variable<DateTime>(transactionDate);
    map['created_at'] = Variable<DateTime>(createdAt);
    map['updated_at'] = Variable<DateTime>(updatedAt);
    if (!nullToAbsent || comment != null) {
      map['comment'] = Variable<String>(comment);
    }
    return map;
  }

  CreateTransactionEventTableCompanion toCompanion(bool nullToAbsent) {
    return CreateTransactionEventTableCompanion(
      id: Value(id),
      accountId: Value(accountId),
      categoryId: Value(categoryId),
      amount: Value(amount),
      transactionDate: Value(transactionDate),
      createdAt: Value(createdAt),
      updatedAt: Value(updatedAt),
      comment: comment == null && nullToAbsent
          ? const Value.absent()
          : Value(comment),
    );
  }

  factory CreateTransactionEventDbModel.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return CreateTransactionEventDbModel(
      id: serializer.fromJson<int>(json['id']),
      accountId: serializer.fromJson<int>(json['accountId']),
      categoryId: serializer.fromJson<int>(json['categoryId']),
      amount: serializer.fromJson<String>(json['amount']),
      transactionDate: serializer.fromJson<DateTime>(json['transactionDate']),
      createdAt: serializer.fromJson<DateTime>(json['createdAt']),
      updatedAt: serializer.fromJson<DateTime>(json['updatedAt']),
      comment: serializer.fromJson<String?>(json['comment']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'accountId': serializer.toJson<int>(accountId),
      'categoryId': serializer.toJson<int>(categoryId),
      'amount': serializer.toJson<String>(amount),
      'transactionDate': serializer.toJson<DateTime>(transactionDate),
      'createdAt': serializer.toJson<DateTime>(createdAt),
      'updatedAt': serializer.toJson<DateTime>(updatedAt),
      'comment': serializer.toJson<String?>(comment),
    };
  }

  CreateTransactionEventDbModel copyWith({
    int? id,
    int? accountId,
    int? categoryId,
    String? amount,
    DateTime? transactionDate,
    DateTime? createdAt,
    DateTime? updatedAt,
    Value<String?> comment = const Value.absent(),
  }) => CreateTransactionEventDbModel(
    id: id ?? this.id,
    accountId: accountId ?? this.accountId,
    categoryId: categoryId ?? this.categoryId,
    amount: amount ?? this.amount,
    transactionDate: transactionDate ?? this.transactionDate,
    createdAt: createdAt ?? this.createdAt,
    updatedAt: updatedAt ?? this.updatedAt,
    comment: comment.present ? comment.value : this.comment,
  );
  CreateTransactionEventDbModel copyWithCompanion(
    CreateTransactionEventTableCompanion data,
  ) {
    return CreateTransactionEventDbModel(
      id: data.id.present ? data.id.value : this.id,
      accountId: data.accountId.present ? data.accountId.value : this.accountId,
      categoryId: data.categoryId.present
          ? data.categoryId.value
          : this.categoryId,
      amount: data.amount.present ? data.amount.value : this.amount,
      transactionDate: data.transactionDate.present
          ? data.transactionDate.value
          : this.transactionDate,
      createdAt: data.createdAt.present ? data.createdAt.value : this.createdAt,
      updatedAt: data.updatedAt.present ? data.updatedAt.value : this.updatedAt,
      comment: data.comment.present ? data.comment.value : this.comment,
    );
  }

  @override
  String toString() {
    return (StringBuffer('CreateTransactionEventDbModel(')
          ..write('id: $id, ')
          ..write('accountId: $accountId, ')
          ..write('categoryId: $categoryId, ')
          ..write('amount: $amount, ')
          ..write('transactionDate: $transactionDate, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt, ')
          ..write('comment: $comment')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
    id,
    accountId,
    categoryId,
    amount,
    transactionDate,
    createdAt,
    updatedAt,
    comment,
  );
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is CreateTransactionEventDbModel &&
          other.id == this.id &&
          other.accountId == this.accountId &&
          other.categoryId == this.categoryId &&
          other.amount == this.amount &&
          other.transactionDate == this.transactionDate &&
          other.createdAt == this.createdAt &&
          other.updatedAt == this.updatedAt &&
          other.comment == this.comment);
}

class CreateTransactionEventTableCompanion
    extends UpdateCompanion<CreateTransactionEventDbModel> {
  final Value<int> id;
  final Value<int> accountId;
  final Value<int> categoryId;
  final Value<String> amount;
  final Value<DateTime> transactionDate;
  final Value<DateTime> createdAt;
  final Value<DateTime> updatedAt;
  final Value<String?> comment;
  const CreateTransactionEventTableCompanion({
    this.id = const Value.absent(),
    this.accountId = const Value.absent(),
    this.categoryId = const Value.absent(),
    this.amount = const Value.absent(),
    this.transactionDate = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.updatedAt = const Value.absent(),
    this.comment = const Value.absent(),
  });
  CreateTransactionEventTableCompanion.insert({
    this.id = const Value.absent(),
    required int accountId,
    required int categoryId,
    required String amount,
    required DateTime transactionDate,
    required DateTime createdAt,
    required DateTime updatedAt,
    this.comment = const Value.absent(),
  }) : accountId = Value(accountId),
       categoryId = Value(categoryId),
       amount = Value(amount),
       transactionDate = Value(transactionDate),
       createdAt = Value(createdAt),
       updatedAt = Value(updatedAt);
  static Insertable<CreateTransactionEventDbModel> custom({
    Expression<int>? id,
    Expression<int>? accountId,
    Expression<int>? categoryId,
    Expression<String>? amount,
    Expression<DateTime>? transactionDate,
    Expression<DateTime>? createdAt,
    Expression<DateTime>? updatedAt,
    Expression<String>? comment,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (accountId != null) 'account_id': accountId,
      if (categoryId != null) 'category_id': categoryId,
      if (amount != null) 'amount': amount,
      if (transactionDate != null) 'transaction_date': transactionDate,
      if (createdAt != null) 'created_at': createdAt,
      if (updatedAt != null) 'updated_at': updatedAt,
      if (comment != null) 'comment': comment,
    });
  }

  CreateTransactionEventTableCompanion copyWith({
    Value<int>? id,
    Value<int>? accountId,
    Value<int>? categoryId,
    Value<String>? amount,
    Value<DateTime>? transactionDate,
    Value<DateTime>? createdAt,
    Value<DateTime>? updatedAt,
    Value<String?>? comment,
  }) {
    return CreateTransactionEventTableCompanion(
      id: id ?? this.id,
      accountId: accountId ?? this.accountId,
      categoryId: categoryId ?? this.categoryId,
      amount: amount ?? this.amount,
      transactionDate: transactionDate ?? this.transactionDate,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
      comment: comment ?? this.comment,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (accountId.present) {
      map['account_id'] = Variable<int>(accountId.value);
    }
    if (categoryId.present) {
      map['category_id'] = Variable<int>(categoryId.value);
    }
    if (amount.present) {
      map['amount'] = Variable<String>(amount.value);
    }
    if (transactionDate.present) {
      map['transaction_date'] = Variable<DateTime>(transactionDate.value);
    }
    if (createdAt.present) {
      map['created_at'] = Variable<DateTime>(createdAt.value);
    }
    if (updatedAt.present) {
      map['updated_at'] = Variable<DateTime>(updatedAt.value);
    }
    if (comment.present) {
      map['comment'] = Variable<String>(comment.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('CreateTransactionEventTableCompanion(')
          ..write('id: $id, ')
          ..write('accountId: $accountId, ')
          ..write('categoryId: $categoryId, ')
          ..write('amount: $amount, ')
          ..write('transactionDate: $transactionDate, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt, ')
          ..write('comment: $comment')
          ..write(')'))
        .toString();
  }
}

class $UpdateTransactionEventTableTable extends UpdateTransactionEventTable
    with
        TableInfo<
          $UpdateTransactionEventTableTable,
          UpdateTransactionEventDbModel
        > {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $UpdateTransactionEventTableTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
    'id',
    aliasedName,
    false,
    hasAutoIncrement: true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'PRIMARY KEY AUTOINCREMENT',
    ),
  );
  static const VerificationMeta _accountIdMeta = const VerificationMeta(
    'accountId',
  );
  @override
  late final GeneratedColumn<int> accountId = GeneratedColumn<int>(
    'account_id',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _categoryIdMeta = const VerificationMeta(
    'categoryId',
  );
  @override
  late final GeneratedColumn<int> categoryId = GeneratedColumn<int>(
    'category_id',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _amountMeta = const VerificationMeta('amount');
  @override
  late final GeneratedColumn<String> amount = GeneratedColumn<String>(
    'amount',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _transactionDateMeta = const VerificationMeta(
    'transactionDate',
  );
  @override
  late final GeneratedColumn<DateTime> transactionDate =
      GeneratedColumn<DateTime>(
        'transaction_date',
        aliasedName,
        false,
        type: DriftSqlType.dateTime,
        requiredDuringInsert: true,
      );
  static const VerificationMeta _commentMeta = const VerificationMeta(
    'comment',
  );
  @override
  late final GeneratedColumn<String> comment = GeneratedColumn<String>(
    'comment',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  @override
  List<GeneratedColumn> get $columns => [
    id,
    accountId,
    categoryId,
    amount,
    transactionDate,
    comment,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'update_transaction_event_table';
  @override
  VerificationContext validateIntegrity(
    Insertable<UpdateTransactionEventDbModel> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('account_id')) {
      context.handle(
        _accountIdMeta,
        accountId.isAcceptableOrUnknown(data['account_id']!, _accountIdMeta),
      );
    } else if (isInserting) {
      context.missing(_accountIdMeta);
    }
    if (data.containsKey('category_id')) {
      context.handle(
        _categoryIdMeta,
        categoryId.isAcceptableOrUnknown(data['category_id']!, _categoryIdMeta),
      );
    } else if (isInserting) {
      context.missing(_categoryIdMeta);
    }
    if (data.containsKey('amount')) {
      context.handle(
        _amountMeta,
        amount.isAcceptableOrUnknown(data['amount']!, _amountMeta),
      );
    } else if (isInserting) {
      context.missing(_amountMeta);
    }
    if (data.containsKey('transaction_date')) {
      context.handle(
        _transactionDateMeta,
        transactionDate.isAcceptableOrUnknown(
          data['transaction_date']!,
          _transactionDateMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_transactionDateMeta);
    }
    if (data.containsKey('comment')) {
      context.handle(
        _commentMeta,
        comment.isAcceptableOrUnknown(data['comment']!, _commentMeta),
      );
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  UpdateTransactionEventDbModel map(
    Map<String, dynamic> data, {
    String? tablePrefix,
  }) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return UpdateTransactionEventDbModel(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}id'],
      )!,
      accountId: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}account_id'],
      )!,
      categoryId: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}category_id'],
      )!,
      amount: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}amount'],
      )!,
      transactionDate: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}transaction_date'],
      )!,
      comment: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}comment'],
      ),
    );
  }

  @override
  $UpdateTransactionEventTableTable createAlias(String alias) {
    return $UpdateTransactionEventTableTable(attachedDatabase, alias);
  }
}

class UpdateTransactionEventDbModel extends DataClass
    implements Insertable<UpdateTransactionEventDbModel> {
  final int id;
  final int accountId;
  final int categoryId;
  final String amount;
  final DateTime transactionDate;
  final String? comment;
  const UpdateTransactionEventDbModel({
    required this.id,
    required this.accountId,
    required this.categoryId,
    required this.amount,
    required this.transactionDate,
    this.comment,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['account_id'] = Variable<int>(accountId);
    map['category_id'] = Variable<int>(categoryId);
    map['amount'] = Variable<String>(amount);
    map['transaction_date'] = Variable<DateTime>(transactionDate);
    if (!nullToAbsent || comment != null) {
      map['comment'] = Variable<String>(comment);
    }
    return map;
  }

  UpdateTransactionEventTableCompanion toCompanion(bool nullToAbsent) {
    return UpdateTransactionEventTableCompanion(
      id: Value(id),
      accountId: Value(accountId),
      categoryId: Value(categoryId),
      amount: Value(amount),
      transactionDate: Value(transactionDate),
      comment: comment == null && nullToAbsent
          ? const Value.absent()
          : Value(comment),
    );
  }

  factory UpdateTransactionEventDbModel.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return UpdateTransactionEventDbModel(
      id: serializer.fromJson<int>(json['id']),
      accountId: serializer.fromJson<int>(json['accountId']),
      categoryId: serializer.fromJson<int>(json['categoryId']),
      amount: serializer.fromJson<String>(json['amount']),
      transactionDate: serializer.fromJson<DateTime>(json['transactionDate']),
      comment: serializer.fromJson<String?>(json['comment']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'accountId': serializer.toJson<int>(accountId),
      'categoryId': serializer.toJson<int>(categoryId),
      'amount': serializer.toJson<String>(amount),
      'transactionDate': serializer.toJson<DateTime>(transactionDate),
      'comment': serializer.toJson<String?>(comment),
    };
  }

  UpdateTransactionEventDbModel copyWith({
    int? id,
    int? accountId,
    int? categoryId,
    String? amount,
    DateTime? transactionDate,
    Value<String?> comment = const Value.absent(),
  }) => UpdateTransactionEventDbModel(
    id: id ?? this.id,
    accountId: accountId ?? this.accountId,
    categoryId: categoryId ?? this.categoryId,
    amount: amount ?? this.amount,
    transactionDate: transactionDate ?? this.transactionDate,
    comment: comment.present ? comment.value : this.comment,
  );
  UpdateTransactionEventDbModel copyWithCompanion(
    UpdateTransactionEventTableCompanion data,
  ) {
    return UpdateTransactionEventDbModel(
      id: data.id.present ? data.id.value : this.id,
      accountId: data.accountId.present ? data.accountId.value : this.accountId,
      categoryId: data.categoryId.present
          ? data.categoryId.value
          : this.categoryId,
      amount: data.amount.present ? data.amount.value : this.amount,
      transactionDate: data.transactionDate.present
          ? data.transactionDate.value
          : this.transactionDate,
      comment: data.comment.present ? data.comment.value : this.comment,
    );
  }

  @override
  String toString() {
    return (StringBuffer('UpdateTransactionEventDbModel(')
          ..write('id: $id, ')
          ..write('accountId: $accountId, ')
          ..write('categoryId: $categoryId, ')
          ..write('amount: $amount, ')
          ..write('transactionDate: $transactionDate, ')
          ..write('comment: $comment')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode =>
      Object.hash(id, accountId, categoryId, amount, transactionDate, comment);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is UpdateTransactionEventDbModel &&
          other.id == this.id &&
          other.accountId == this.accountId &&
          other.categoryId == this.categoryId &&
          other.amount == this.amount &&
          other.transactionDate == this.transactionDate &&
          other.comment == this.comment);
}

class UpdateTransactionEventTableCompanion
    extends UpdateCompanion<UpdateTransactionEventDbModel> {
  final Value<int> id;
  final Value<int> accountId;
  final Value<int> categoryId;
  final Value<String> amount;
  final Value<DateTime> transactionDate;
  final Value<String?> comment;
  const UpdateTransactionEventTableCompanion({
    this.id = const Value.absent(),
    this.accountId = const Value.absent(),
    this.categoryId = const Value.absent(),
    this.amount = const Value.absent(),
    this.transactionDate = const Value.absent(),
    this.comment = const Value.absent(),
  });
  UpdateTransactionEventTableCompanion.insert({
    this.id = const Value.absent(),
    required int accountId,
    required int categoryId,
    required String amount,
    required DateTime transactionDate,
    this.comment = const Value.absent(),
  }) : accountId = Value(accountId),
       categoryId = Value(categoryId),
       amount = Value(amount),
       transactionDate = Value(transactionDate);
  static Insertable<UpdateTransactionEventDbModel> custom({
    Expression<int>? id,
    Expression<int>? accountId,
    Expression<int>? categoryId,
    Expression<String>? amount,
    Expression<DateTime>? transactionDate,
    Expression<String>? comment,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (accountId != null) 'account_id': accountId,
      if (categoryId != null) 'category_id': categoryId,
      if (amount != null) 'amount': amount,
      if (transactionDate != null) 'transaction_date': transactionDate,
      if (comment != null) 'comment': comment,
    });
  }

  UpdateTransactionEventTableCompanion copyWith({
    Value<int>? id,
    Value<int>? accountId,
    Value<int>? categoryId,
    Value<String>? amount,
    Value<DateTime>? transactionDate,
    Value<String?>? comment,
  }) {
    return UpdateTransactionEventTableCompanion(
      id: id ?? this.id,
      accountId: accountId ?? this.accountId,
      categoryId: categoryId ?? this.categoryId,
      amount: amount ?? this.amount,
      transactionDate: transactionDate ?? this.transactionDate,
      comment: comment ?? this.comment,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (accountId.present) {
      map['account_id'] = Variable<int>(accountId.value);
    }
    if (categoryId.present) {
      map['category_id'] = Variable<int>(categoryId.value);
    }
    if (amount.present) {
      map['amount'] = Variable<String>(amount.value);
    }
    if (transactionDate.present) {
      map['transaction_date'] = Variable<DateTime>(transactionDate.value);
    }
    if (comment.present) {
      map['comment'] = Variable<String>(comment.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('UpdateTransactionEventTableCompanion(')
          ..write('id: $id, ')
          ..write('accountId: $accountId, ')
          ..write('categoryId: $categoryId, ')
          ..write('amount: $amount, ')
          ..write('transactionDate: $transactionDate, ')
          ..write('comment: $comment')
          ..write(')'))
        .toString();
  }
}

class $DeleteTransactionEventTableTable extends DeleteTransactionEventTable
    with
        TableInfo<
          $DeleteTransactionEventTableTable,
          DeleteTransactionEventDbModel
        > {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $DeleteTransactionEventTableTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
    'id',
    aliasedName,
    false,
    hasAutoIncrement: true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'PRIMARY KEY AUTOINCREMENT',
    ),
  );
  @override
  List<GeneratedColumn> get $columns => [id];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'delete_transaction_event_table';
  @override
  VerificationContext validateIntegrity(
    Insertable<DeleteTransactionEventDbModel> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  DeleteTransactionEventDbModel map(
    Map<String, dynamic> data, {
    String? tablePrefix,
  }) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return DeleteTransactionEventDbModel(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}id'],
      )!,
    );
  }

  @override
  $DeleteTransactionEventTableTable createAlias(String alias) {
    return $DeleteTransactionEventTableTable(attachedDatabase, alias);
  }
}

class DeleteTransactionEventDbModel extends DataClass
    implements Insertable<DeleteTransactionEventDbModel> {
  final int id;
  const DeleteTransactionEventDbModel({required this.id});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    return map;
  }

  DeleteTransactionEventTableCompanion toCompanion(bool nullToAbsent) {
    return DeleteTransactionEventTableCompanion(id: Value(id));
  }

  factory DeleteTransactionEventDbModel.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return DeleteTransactionEventDbModel(
      id: serializer.fromJson<int>(json['id']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{'id': serializer.toJson<int>(id)};
  }

  DeleteTransactionEventDbModel copyWith({int? id}) =>
      DeleteTransactionEventDbModel(id: id ?? this.id);
  DeleteTransactionEventDbModel copyWithCompanion(
    DeleteTransactionEventTableCompanion data,
  ) {
    return DeleteTransactionEventDbModel(
      id: data.id.present ? data.id.value : this.id,
    );
  }

  @override
  String toString() {
    return (StringBuffer('DeleteTransactionEventDbModel(')
          ..write('id: $id')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => id.hashCode;
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is DeleteTransactionEventDbModel && other.id == this.id);
}

class DeleteTransactionEventTableCompanion
    extends UpdateCompanion<DeleteTransactionEventDbModel> {
  final Value<int> id;
  const DeleteTransactionEventTableCompanion({this.id = const Value.absent()});
  DeleteTransactionEventTableCompanion.insert({this.id = const Value.absent()});
  static Insertable<DeleteTransactionEventDbModel> custom({
    Expression<int>? id,
  }) {
    return RawValuesInsertable({if (id != null) 'id': id});
  }

  DeleteTransactionEventTableCompanion copyWith({Value<int>? id}) {
    return DeleteTransactionEventTableCompanion(id: id ?? this.id);
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('DeleteTransactionEventTableCompanion(')
          ..write('id: $id')
          ..write(')'))
        .toString();
  }
}

abstract class _$Database extends GeneratedDatabase {
  _$Database(QueryExecutor e) : super(e);
  $DatabaseManager get managers => $DatabaseManager(this);
  late final $CategoryTableTable categoryTable = $CategoryTableTable(this);
  late final $TransactionTableTable transactionTable = $TransactionTableTable(
    this,
  );
  late final $AccountTableTable accountTable = $AccountTableTable(this);
  late final $CreateTransactionEventTableTable createTransactionEventTable =
      $CreateTransactionEventTableTable(this);
  late final $UpdateTransactionEventTableTable updateTransactionEventTable =
      $UpdateTransactionEventTableTable(this);
  late final $DeleteTransactionEventTableTable deleteTransactionEventTable =
      $DeleteTransactionEventTableTable(this);
  @override
  Iterable<TableInfo<Table, Object?>> get allTables =>
      allSchemaEntities.whereType<TableInfo<Table, Object?>>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities => [
    categoryTable,
    transactionTable,
    accountTable,
    createTransactionEventTable,
    updateTransactionEventTable,
    deleteTransactionEventTable,
  ];
}

typedef $$CategoryTableTableCreateCompanionBuilder =
    CategoryTableCompanion Function({
      required int id,
      required String name,
      required String emoji,
      required bool isIncome,
      Value<int> rowid,
    });
typedef $$CategoryTableTableUpdateCompanionBuilder =
    CategoryTableCompanion Function({
      Value<int> id,
      Value<String> name,
      Value<String> emoji,
      Value<bool> isIncome,
      Value<int> rowid,
    });

class $$CategoryTableTableFilterComposer
    extends Composer<_$Database, $CategoryTableTable> {
  $$CategoryTableTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get name => $composableBuilder(
    column: $table.name,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get emoji => $composableBuilder(
    column: $table.emoji,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<bool> get isIncome => $composableBuilder(
    column: $table.isIncome,
    builder: (column) => ColumnFilters(column),
  );
}

class $$CategoryTableTableOrderingComposer
    extends Composer<_$Database, $CategoryTableTable> {
  $$CategoryTableTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get name => $composableBuilder(
    column: $table.name,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get emoji => $composableBuilder(
    column: $table.emoji,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<bool> get isIncome => $composableBuilder(
    column: $table.isIncome,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$CategoryTableTableAnnotationComposer
    extends Composer<_$Database, $CategoryTableTable> {
  $$CategoryTableTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get name =>
      $composableBuilder(column: $table.name, builder: (column) => column);

  GeneratedColumn<String> get emoji =>
      $composableBuilder(column: $table.emoji, builder: (column) => column);

  GeneratedColumn<bool> get isIncome =>
      $composableBuilder(column: $table.isIncome, builder: (column) => column);
}

class $$CategoryTableTableTableManager
    extends
        RootTableManager<
          _$Database,
          $CategoryTableTable,
          CategoryDbModel,
          $$CategoryTableTableFilterComposer,
          $$CategoryTableTableOrderingComposer,
          $$CategoryTableTableAnnotationComposer,
          $$CategoryTableTableCreateCompanionBuilder,
          $$CategoryTableTableUpdateCompanionBuilder,
          (
            CategoryDbModel,
            BaseReferences<_$Database, $CategoryTableTable, CategoryDbModel>,
          ),
          CategoryDbModel,
          PrefetchHooks Function()
        > {
  $$CategoryTableTableTableManager(_$Database db, $CategoryTableTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$CategoryTableTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$CategoryTableTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$CategoryTableTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                Value<String> name = const Value.absent(),
                Value<String> emoji = const Value.absent(),
                Value<bool> isIncome = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => CategoryTableCompanion(
                id: id,
                name: name,
                emoji: emoji,
                isIncome: isIncome,
                rowid: rowid,
              ),
          createCompanionCallback:
              ({
                required int id,
                required String name,
                required String emoji,
                required bool isIncome,
                Value<int> rowid = const Value.absent(),
              }) => CategoryTableCompanion.insert(
                id: id,
                name: name,
                emoji: emoji,
                isIncome: isIncome,
                rowid: rowid,
              ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ),
      );
}

typedef $$CategoryTableTableProcessedTableManager =
    ProcessedTableManager<
      _$Database,
      $CategoryTableTable,
      CategoryDbModel,
      $$CategoryTableTableFilterComposer,
      $$CategoryTableTableOrderingComposer,
      $$CategoryTableTableAnnotationComposer,
      $$CategoryTableTableCreateCompanionBuilder,
      $$CategoryTableTableUpdateCompanionBuilder,
      (
        CategoryDbModel,
        BaseReferences<_$Database, $CategoryTableTable, CategoryDbModel>,
      ),
      CategoryDbModel,
      PrefetchHooks Function()
    >;
typedef $$TransactionTableTableCreateCompanionBuilder =
    TransactionTableCompanion Function({
      required int id,
      required int accountId,
      required int categoryId,
      required String amount,
      required DateTime transactionDate,
      required DateTime updatedAt,
      required DateTime createdAt,
      Value<String?> comment,
      Value<int> rowid,
    });
typedef $$TransactionTableTableUpdateCompanionBuilder =
    TransactionTableCompanion Function({
      Value<int> id,
      Value<int> accountId,
      Value<int> categoryId,
      Value<String> amount,
      Value<DateTime> transactionDate,
      Value<DateTime> updatedAt,
      Value<DateTime> createdAt,
      Value<String?> comment,
      Value<int> rowid,
    });

class $$TransactionTableTableFilterComposer
    extends Composer<_$Database, $TransactionTableTable> {
  $$TransactionTableTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get accountId => $composableBuilder(
    column: $table.accountId,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get categoryId => $composableBuilder(
    column: $table.categoryId,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get amount => $composableBuilder(
    column: $table.amount,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get transactionDate => $composableBuilder(
    column: $table.transactionDate,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get updatedAt => $composableBuilder(
    column: $table.updatedAt,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get comment => $composableBuilder(
    column: $table.comment,
    builder: (column) => ColumnFilters(column),
  );
}

class $$TransactionTableTableOrderingComposer
    extends Composer<_$Database, $TransactionTableTable> {
  $$TransactionTableTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get accountId => $composableBuilder(
    column: $table.accountId,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get categoryId => $composableBuilder(
    column: $table.categoryId,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get amount => $composableBuilder(
    column: $table.amount,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get transactionDate => $composableBuilder(
    column: $table.transactionDate,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get updatedAt => $composableBuilder(
    column: $table.updatedAt,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get comment => $composableBuilder(
    column: $table.comment,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$TransactionTableTableAnnotationComposer
    extends Composer<_$Database, $TransactionTableTable> {
  $$TransactionTableTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<int> get accountId =>
      $composableBuilder(column: $table.accountId, builder: (column) => column);

  GeneratedColumn<int> get categoryId => $composableBuilder(
    column: $table.categoryId,
    builder: (column) => column,
  );

  GeneratedColumn<String> get amount =>
      $composableBuilder(column: $table.amount, builder: (column) => column);

  GeneratedColumn<DateTime> get transactionDate => $composableBuilder(
    column: $table.transactionDate,
    builder: (column) => column,
  );

  GeneratedColumn<DateTime> get updatedAt =>
      $composableBuilder(column: $table.updatedAt, builder: (column) => column);

  GeneratedColumn<DateTime> get createdAt =>
      $composableBuilder(column: $table.createdAt, builder: (column) => column);

  GeneratedColumn<String> get comment =>
      $composableBuilder(column: $table.comment, builder: (column) => column);
}

class $$TransactionTableTableTableManager
    extends
        RootTableManager<
          _$Database,
          $TransactionTableTable,
          TransactionDbModel,
          $$TransactionTableTableFilterComposer,
          $$TransactionTableTableOrderingComposer,
          $$TransactionTableTableAnnotationComposer,
          $$TransactionTableTableCreateCompanionBuilder,
          $$TransactionTableTableUpdateCompanionBuilder,
          (
            TransactionDbModel,
            BaseReferences<
              _$Database,
              $TransactionTableTable,
              TransactionDbModel
            >,
          ),
          TransactionDbModel,
          PrefetchHooks Function()
        > {
  $$TransactionTableTableTableManager(
    _$Database db,
    $TransactionTableTable table,
  ) : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$TransactionTableTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$TransactionTableTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$TransactionTableTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                Value<int> accountId = const Value.absent(),
                Value<int> categoryId = const Value.absent(),
                Value<String> amount = const Value.absent(),
                Value<DateTime> transactionDate = const Value.absent(),
                Value<DateTime> updatedAt = const Value.absent(),
                Value<DateTime> createdAt = const Value.absent(),
                Value<String?> comment = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => TransactionTableCompanion(
                id: id,
                accountId: accountId,
                categoryId: categoryId,
                amount: amount,
                transactionDate: transactionDate,
                updatedAt: updatedAt,
                createdAt: createdAt,
                comment: comment,
                rowid: rowid,
              ),
          createCompanionCallback:
              ({
                required int id,
                required int accountId,
                required int categoryId,
                required String amount,
                required DateTime transactionDate,
                required DateTime updatedAt,
                required DateTime createdAt,
                Value<String?> comment = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => TransactionTableCompanion.insert(
                id: id,
                accountId: accountId,
                categoryId: categoryId,
                amount: amount,
                transactionDate: transactionDate,
                updatedAt: updatedAt,
                createdAt: createdAt,
                comment: comment,
                rowid: rowid,
              ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ),
      );
}

typedef $$TransactionTableTableProcessedTableManager =
    ProcessedTableManager<
      _$Database,
      $TransactionTableTable,
      TransactionDbModel,
      $$TransactionTableTableFilterComposer,
      $$TransactionTableTableOrderingComposer,
      $$TransactionTableTableAnnotationComposer,
      $$TransactionTableTableCreateCompanionBuilder,
      $$TransactionTableTableUpdateCompanionBuilder,
      (
        TransactionDbModel,
        BaseReferences<_$Database, $TransactionTableTable, TransactionDbModel>,
      ),
      TransactionDbModel,
      PrefetchHooks Function()
    >;
typedef $$AccountTableTableCreateCompanionBuilder =
    AccountTableCompanion Function({
      required int id,
      required int userId,
      required String name,
      required String balance,
      required String currency,
      required DateTime updatedAt,
      required DateTime createdAt,
      Value<int> rowid,
    });
typedef $$AccountTableTableUpdateCompanionBuilder =
    AccountTableCompanion Function({
      Value<int> id,
      Value<int> userId,
      Value<String> name,
      Value<String> balance,
      Value<String> currency,
      Value<DateTime> updatedAt,
      Value<DateTime> createdAt,
      Value<int> rowid,
    });

class $$AccountTableTableFilterComposer
    extends Composer<_$Database, $AccountTableTable> {
  $$AccountTableTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get userId => $composableBuilder(
    column: $table.userId,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get name => $composableBuilder(
    column: $table.name,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get balance => $composableBuilder(
    column: $table.balance,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get currency => $composableBuilder(
    column: $table.currency,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get updatedAt => $composableBuilder(
    column: $table.updatedAt,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnFilters(column),
  );
}

class $$AccountTableTableOrderingComposer
    extends Composer<_$Database, $AccountTableTable> {
  $$AccountTableTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get userId => $composableBuilder(
    column: $table.userId,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get name => $composableBuilder(
    column: $table.name,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get balance => $composableBuilder(
    column: $table.balance,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get currency => $composableBuilder(
    column: $table.currency,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get updatedAt => $composableBuilder(
    column: $table.updatedAt,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$AccountTableTableAnnotationComposer
    extends Composer<_$Database, $AccountTableTable> {
  $$AccountTableTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<int> get userId =>
      $composableBuilder(column: $table.userId, builder: (column) => column);

  GeneratedColumn<String> get name =>
      $composableBuilder(column: $table.name, builder: (column) => column);

  GeneratedColumn<String> get balance =>
      $composableBuilder(column: $table.balance, builder: (column) => column);

  GeneratedColumn<String> get currency =>
      $composableBuilder(column: $table.currency, builder: (column) => column);

  GeneratedColumn<DateTime> get updatedAt =>
      $composableBuilder(column: $table.updatedAt, builder: (column) => column);

  GeneratedColumn<DateTime> get createdAt =>
      $composableBuilder(column: $table.createdAt, builder: (column) => column);
}

class $$AccountTableTableTableManager
    extends
        RootTableManager<
          _$Database,
          $AccountTableTable,
          AccountDbModel,
          $$AccountTableTableFilterComposer,
          $$AccountTableTableOrderingComposer,
          $$AccountTableTableAnnotationComposer,
          $$AccountTableTableCreateCompanionBuilder,
          $$AccountTableTableUpdateCompanionBuilder,
          (
            AccountDbModel,
            BaseReferences<_$Database, $AccountTableTable, AccountDbModel>,
          ),
          AccountDbModel,
          PrefetchHooks Function()
        > {
  $$AccountTableTableTableManager(_$Database db, $AccountTableTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$AccountTableTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$AccountTableTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$AccountTableTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                Value<int> userId = const Value.absent(),
                Value<String> name = const Value.absent(),
                Value<String> balance = const Value.absent(),
                Value<String> currency = const Value.absent(),
                Value<DateTime> updatedAt = const Value.absent(),
                Value<DateTime> createdAt = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => AccountTableCompanion(
                id: id,
                userId: userId,
                name: name,
                balance: balance,
                currency: currency,
                updatedAt: updatedAt,
                createdAt: createdAt,
                rowid: rowid,
              ),
          createCompanionCallback:
              ({
                required int id,
                required int userId,
                required String name,
                required String balance,
                required String currency,
                required DateTime updatedAt,
                required DateTime createdAt,
                Value<int> rowid = const Value.absent(),
              }) => AccountTableCompanion.insert(
                id: id,
                userId: userId,
                name: name,
                balance: balance,
                currency: currency,
                updatedAt: updatedAt,
                createdAt: createdAt,
                rowid: rowid,
              ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ),
      );
}

typedef $$AccountTableTableProcessedTableManager =
    ProcessedTableManager<
      _$Database,
      $AccountTableTable,
      AccountDbModel,
      $$AccountTableTableFilterComposer,
      $$AccountTableTableOrderingComposer,
      $$AccountTableTableAnnotationComposer,
      $$AccountTableTableCreateCompanionBuilder,
      $$AccountTableTableUpdateCompanionBuilder,
      (
        AccountDbModel,
        BaseReferences<_$Database, $AccountTableTable, AccountDbModel>,
      ),
      AccountDbModel,
      PrefetchHooks Function()
    >;
typedef $$CreateTransactionEventTableTableCreateCompanionBuilder =
    CreateTransactionEventTableCompanion Function({
      Value<int> id,
      required int accountId,
      required int categoryId,
      required String amount,
      required DateTime transactionDate,
      required DateTime createdAt,
      required DateTime updatedAt,
      Value<String?> comment,
    });
typedef $$CreateTransactionEventTableTableUpdateCompanionBuilder =
    CreateTransactionEventTableCompanion Function({
      Value<int> id,
      Value<int> accountId,
      Value<int> categoryId,
      Value<String> amount,
      Value<DateTime> transactionDate,
      Value<DateTime> createdAt,
      Value<DateTime> updatedAt,
      Value<String?> comment,
    });

class $$CreateTransactionEventTableTableFilterComposer
    extends Composer<_$Database, $CreateTransactionEventTableTable> {
  $$CreateTransactionEventTableTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get accountId => $composableBuilder(
    column: $table.accountId,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get categoryId => $composableBuilder(
    column: $table.categoryId,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get amount => $composableBuilder(
    column: $table.amount,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get transactionDate => $composableBuilder(
    column: $table.transactionDate,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get updatedAt => $composableBuilder(
    column: $table.updatedAt,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get comment => $composableBuilder(
    column: $table.comment,
    builder: (column) => ColumnFilters(column),
  );
}

class $$CreateTransactionEventTableTableOrderingComposer
    extends Composer<_$Database, $CreateTransactionEventTableTable> {
  $$CreateTransactionEventTableTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get accountId => $composableBuilder(
    column: $table.accountId,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get categoryId => $composableBuilder(
    column: $table.categoryId,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get amount => $composableBuilder(
    column: $table.amount,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get transactionDate => $composableBuilder(
    column: $table.transactionDate,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get updatedAt => $composableBuilder(
    column: $table.updatedAt,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get comment => $composableBuilder(
    column: $table.comment,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$CreateTransactionEventTableTableAnnotationComposer
    extends Composer<_$Database, $CreateTransactionEventTableTable> {
  $$CreateTransactionEventTableTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<int> get accountId =>
      $composableBuilder(column: $table.accountId, builder: (column) => column);

  GeneratedColumn<int> get categoryId => $composableBuilder(
    column: $table.categoryId,
    builder: (column) => column,
  );

  GeneratedColumn<String> get amount =>
      $composableBuilder(column: $table.amount, builder: (column) => column);

  GeneratedColumn<DateTime> get transactionDate => $composableBuilder(
    column: $table.transactionDate,
    builder: (column) => column,
  );

  GeneratedColumn<DateTime> get createdAt =>
      $composableBuilder(column: $table.createdAt, builder: (column) => column);

  GeneratedColumn<DateTime> get updatedAt =>
      $composableBuilder(column: $table.updatedAt, builder: (column) => column);

  GeneratedColumn<String> get comment =>
      $composableBuilder(column: $table.comment, builder: (column) => column);
}

class $$CreateTransactionEventTableTableTableManager
    extends
        RootTableManager<
          _$Database,
          $CreateTransactionEventTableTable,
          CreateTransactionEventDbModel,
          $$CreateTransactionEventTableTableFilterComposer,
          $$CreateTransactionEventTableTableOrderingComposer,
          $$CreateTransactionEventTableTableAnnotationComposer,
          $$CreateTransactionEventTableTableCreateCompanionBuilder,
          $$CreateTransactionEventTableTableUpdateCompanionBuilder,
          (
            CreateTransactionEventDbModel,
            BaseReferences<
              _$Database,
              $CreateTransactionEventTableTable,
              CreateTransactionEventDbModel
            >,
          ),
          CreateTransactionEventDbModel,
          PrefetchHooks Function()
        > {
  $$CreateTransactionEventTableTableTableManager(
    _$Database db,
    $CreateTransactionEventTableTable table,
  ) : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$CreateTransactionEventTableTableFilterComposer(
                $db: db,
                $table: table,
              ),
          createOrderingComposer: () =>
              $$CreateTransactionEventTableTableOrderingComposer(
                $db: db,
                $table: table,
              ),
          createComputedFieldComposer: () =>
              $$CreateTransactionEventTableTableAnnotationComposer(
                $db: db,
                $table: table,
              ),
          updateCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                Value<int> accountId = const Value.absent(),
                Value<int> categoryId = const Value.absent(),
                Value<String> amount = const Value.absent(),
                Value<DateTime> transactionDate = const Value.absent(),
                Value<DateTime> createdAt = const Value.absent(),
                Value<DateTime> updatedAt = const Value.absent(),
                Value<String?> comment = const Value.absent(),
              }) => CreateTransactionEventTableCompanion(
                id: id,
                accountId: accountId,
                categoryId: categoryId,
                amount: amount,
                transactionDate: transactionDate,
                createdAt: createdAt,
                updatedAt: updatedAt,
                comment: comment,
              ),
          createCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                required int accountId,
                required int categoryId,
                required String amount,
                required DateTime transactionDate,
                required DateTime createdAt,
                required DateTime updatedAt,
                Value<String?> comment = const Value.absent(),
              }) => CreateTransactionEventTableCompanion.insert(
                id: id,
                accountId: accountId,
                categoryId: categoryId,
                amount: amount,
                transactionDate: transactionDate,
                createdAt: createdAt,
                updatedAt: updatedAt,
                comment: comment,
              ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ),
      );
}

typedef $$CreateTransactionEventTableTableProcessedTableManager =
    ProcessedTableManager<
      _$Database,
      $CreateTransactionEventTableTable,
      CreateTransactionEventDbModel,
      $$CreateTransactionEventTableTableFilterComposer,
      $$CreateTransactionEventTableTableOrderingComposer,
      $$CreateTransactionEventTableTableAnnotationComposer,
      $$CreateTransactionEventTableTableCreateCompanionBuilder,
      $$CreateTransactionEventTableTableUpdateCompanionBuilder,
      (
        CreateTransactionEventDbModel,
        BaseReferences<
          _$Database,
          $CreateTransactionEventTableTable,
          CreateTransactionEventDbModel
        >,
      ),
      CreateTransactionEventDbModel,
      PrefetchHooks Function()
    >;
typedef $$UpdateTransactionEventTableTableCreateCompanionBuilder =
    UpdateTransactionEventTableCompanion Function({
      Value<int> id,
      required int accountId,
      required int categoryId,
      required String amount,
      required DateTime transactionDate,
      Value<String?> comment,
    });
typedef $$UpdateTransactionEventTableTableUpdateCompanionBuilder =
    UpdateTransactionEventTableCompanion Function({
      Value<int> id,
      Value<int> accountId,
      Value<int> categoryId,
      Value<String> amount,
      Value<DateTime> transactionDate,
      Value<String?> comment,
    });

class $$UpdateTransactionEventTableTableFilterComposer
    extends Composer<_$Database, $UpdateTransactionEventTableTable> {
  $$UpdateTransactionEventTableTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get accountId => $composableBuilder(
    column: $table.accountId,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get categoryId => $composableBuilder(
    column: $table.categoryId,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get amount => $composableBuilder(
    column: $table.amount,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get transactionDate => $composableBuilder(
    column: $table.transactionDate,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get comment => $composableBuilder(
    column: $table.comment,
    builder: (column) => ColumnFilters(column),
  );
}

class $$UpdateTransactionEventTableTableOrderingComposer
    extends Composer<_$Database, $UpdateTransactionEventTableTable> {
  $$UpdateTransactionEventTableTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get accountId => $composableBuilder(
    column: $table.accountId,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get categoryId => $composableBuilder(
    column: $table.categoryId,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get amount => $composableBuilder(
    column: $table.amount,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get transactionDate => $composableBuilder(
    column: $table.transactionDate,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get comment => $composableBuilder(
    column: $table.comment,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$UpdateTransactionEventTableTableAnnotationComposer
    extends Composer<_$Database, $UpdateTransactionEventTableTable> {
  $$UpdateTransactionEventTableTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<int> get accountId =>
      $composableBuilder(column: $table.accountId, builder: (column) => column);

  GeneratedColumn<int> get categoryId => $composableBuilder(
    column: $table.categoryId,
    builder: (column) => column,
  );

  GeneratedColumn<String> get amount =>
      $composableBuilder(column: $table.amount, builder: (column) => column);

  GeneratedColumn<DateTime> get transactionDate => $composableBuilder(
    column: $table.transactionDate,
    builder: (column) => column,
  );

  GeneratedColumn<String> get comment =>
      $composableBuilder(column: $table.comment, builder: (column) => column);
}

class $$UpdateTransactionEventTableTableTableManager
    extends
        RootTableManager<
          _$Database,
          $UpdateTransactionEventTableTable,
          UpdateTransactionEventDbModel,
          $$UpdateTransactionEventTableTableFilterComposer,
          $$UpdateTransactionEventTableTableOrderingComposer,
          $$UpdateTransactionEventTableTableAnnotationComposer,
          $$UpdateTransactionEventTableTableCreateCompanionBuilder,
          $$UpdateTransactionEventTableTableUpdateCompanionBuilder,
          (
            UpdateTransactionEventDbModel,
            BaseReferences<
              _$Database,
              $UpdateTransactionEventTableTable,
              UpdateTransactionEventDbModel
            >,
          ),
          UpdateTransactionEventDbModel,
          PrefetchHooks Function()
        > {
  $$UpdateTransactionEventTableTableTableManager(
    _$Database db,
    $UpdateTransactionEventTableTable table,
  ) : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$UpdateTransactionEventTableTableFilterComposer(
                $db: db,
                $table: table,
              ),
          createOrderingComposer: () =>
              $$UpdateTransactionEventTableTableOrderingComposer(
                $db: db,
                $table: table,
              ),
          createComputedFieldComposer: () =>
              $$UpdateTransactionEventTableTableAnnotationComposer(
                $db: db,
                $table: table,
              ),
          updateCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                Value<int> accountId = const Value.absent(),
                Value<int> categoryId = const Value.absent(),
                Value<String> amount = const Value.absent(),
                Value<DateTime> transactionDate = const Value.absent(),
                Value<String?> comment = const Value.absent(),
              }) => UpdateTransactionEventTableCompanion(
                id: id,
                accountId: accountId,
                categoryId: categoryId,
                amount: amount,
                transactionDate: transactionDate,
                comment: comment,
              ),
          createCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                required int accountId,
                required int categoryId,
                required String amount,
                required DateTime transactionDate,
                Value<String?> comment = const Value.absent(),
              }) => UpdateTransactionEventTableCompanion.insert(
                id: id,
                accountId: accountId,
                categoryId: categoryId,
                amount: amount,
                transactionDate: transactionDate,
                comment: comment,
              ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ),
      );
}

typedef $$UpdateTransactionEventTableTableProcessedTableManager =
    ProcessedTableManager<
      _$Database,
      $UpdateTransactionEventTableTable,
      UpdateTransactionEventDbModel,
      $$UpdateTransactionEventTableTableFilterComposer,
      $$UpdateTransactionEventTableTableOrderingComposer,
      $$UpdateTransactionEventTableTableAnnotationComposer,
      $$UpdateTransactionEventTableTableCreateCompanionBuilder,
      $$UpdateTransactionEventTableTableUpdateCompanionBuilder,
      (
        UpdateTransactionEventDbModel,
        BaseReferences<
          _$Database,
          $UpdateTransactionEventTableTable,
          UpdateTransactionEventDbModel
        >,
      ),
      UpdateTransactionEventDbModel,
      PrefetchHooks Function()
    >;
typedef $$DeleteTransactionEventTableTableCreateCompanionBuilder =
    DeleteTransactionEventTableCompanion Function({Value<int> id});
typedef $$DeleteTransactionEventTableTableUpdateCompanionBuilder =
    DeleteTransactionEventTableCompanion Function({Value<int> id});

class $$DeleteTransactionEventTableTableFilterComposer
    extends Composer<_$Database, $DeleteTransactionEventTableTable> {
  $$DeleteTransactionEventTableTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );
}

class $$DeleteTransactionEventTableTableOrderingComposer
    extends Composer<_$Database, $DeleteTransactionEventTableTable> {
  $$DeleteTransactionEventTableTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$DeleteTransactionEventTableTableAnnotationComposer
    extends Composer<_$Database, $DeleteTransactionEventTableTable> {
  $$DeleteTransactionEventTableTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);
}

class $$DeleteTransactionEventTableTableTableManager
    extends
        RootTableManager<
          _$Database,
          $DeleteTransactionEventTableTable,
          DeleteTransactionEventDbModel,
          $$DeleteTransactionEventTableTableFilterComposer,
          $$DeleteTransactionEventTableTableOrderingComposer,
          $$DeleteTransactionEventTableTableAnnotationComposer,
          $$DeleteTransactionEventTableTableCreateCompanionBuilder,
          $$DeleteTransactionEventTableTableUpdateCompanionBuilder,
          (
            DeleteTransactionEventDbModel,
            BaseReferences<
              _$Database,
              $DeleteTransactionEventTableTable,
              DeleteTransactionEventDbModel
            >,
          ),
          DeleteTransactionEventDbModel,
          PrefetchHooks Function()
        > {
  $$DeleteTransactionEventTableTableTableManager(
    _$Database db,
    $DeleteTransactionEventTableTable table,
  ) : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$DeleteTransactionEventTableTableFilterComposer(
                $db: db,
                $table: table,
              ),
          createOrderingComposer: () =>
              $$DeleteTransactionEventTableTableOrderingComposer(
                $db: db,
                $table: table,
              ),
          createComputedFieldComposer: () =>
              $$DeleteTransactionEventTableTableAnnotationComposer(
                $db: db,
                $table: table,
              ),
          updateCompanionCallback: ({Value<int> id = const Value.absent()}) =>
              DeleteTransactionEventTableCompanion(id: id),
          createCompanionCallback: ({Value<int> id = const Value.absent()}) =>
              DeleteTransactionEventTableCompanion.insert(id: id),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ),
      );
}

typedef $$DeleteTransactionEventTableTableProcessedTableManager =
    ProcessedTableManager<
      _$Database,
      $DeleteTransactionEventTableTable,
      DeleteTransactionEventDbModel,
      $$DeleteTransactionEventTableTableFilterComposer,
      $$DeleteTransactionEventTableTableOrderingComposer,
      $$DeleteTransactionEventTableTableAnnotationComposer,
      $$DeleteTransactionEventTableTableCreateCompanionBuilder,
      $$DeleteTransactionEventTableTableUpdateCompanionBuilder,
      (
        DeleteTransactionEventDbModel,
        BaseReferences<
          _$Database,
          $DeleteTransactionEventTableTable,
          DeleteTransactionEventDbModel
        >,
      ),
      DeleteTransactionEventDbModel,
      PrefetchHooks Function()
    >;

class $DatabaseManager {
  final _$Database _db;
  $DatabaseManager(this._db);
  $$CategoryTableTableTableManager get categoryTable =>
      $$CategoryTableTableTableManager(_db, _db.categoryTable);
  $$TransactionTableTableTableManager get transactionTable =>
      $$TransactionTableTableTableManager(_db, _db.transactionTable);
  $$AccountTableTableTableManager get accountTable =>
      $$AccountTableTableTableManager(_db, _db.accountTable);
  $$CreateTransactionEventTableTableTableManager
  get createTransactionEventTable =>
      $$CreateTransactionEventTableTableTableManager(
        _db,
        _db.createTransactionEventTable,
      );
  $$UpdateTransactionEventTableTableTableManager
  get updateTransactionEventTable =>
      $$UpdateTransactionEventTableTableTableManager(
        _db,
        _db.updateTransactionEventTable,
      );
  $$DeleteTransactionEventTableTableTableManager
  get deleteTransactionEventTable =>
      $$DeleteTransactionEventTableTableTableManager(
        _db,
        _db.deleteTransactionEventTable,
      );
}
