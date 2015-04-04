.class public Lcom/android/providers/contacts/t9/T9Builder;
.super Ljava/lang/Object;
.source "T9Builder.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/android/providers/contacts/t9/T9Builder$EnoughAndFillBack;
    }
.end annotation


# static fields
.field private static final DEFAULT_SCALE:F = 0.6f

.field private static final DEFAULT_SCALE_THRESHOLD:F = 0.02f

.field public static final KEY_DELIMITER:C = ';'

.field private static final KEY_T9_LOOKUP_NUM:I = 0x2da

.field private static final KEY_WORDS_NUM:I = 0x3


# direct methods
.method public constructor <init>()V
    .locals 0

    .prologue
    .line 19
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 27
    return-void
.end method

.method private static build(Lcom/android/providers/contacts/t9/T9Item;Ljava/util/ArrayList;)Lcom/android/providers/contacts/t9/T9Item;
    .locals 1
    .param p0, "item"    # Lcom/android/providers/contacts/t9/T9Item;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/android/providers/contacts/t9/T9Item;",
            "Ljava/util/ArrayList",
            "<",
            "Lmiui/text/ChinesePinyinConverter$Token;",
            ">;)",
            "Lcom/android/providers/contacts/t9/T9Item;"
        }
    .end annotation

    .prologue
    .line 123
    .local p1, "originalTokens":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Lmiui/text/ChinesePinyinConverter$Token;>;"
    iget-object v0, p0, Lcom/android/providers/contacts/t9/T9Item;->mDisplayName:Ljava/lang/String;

    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 124
    const/4 v0, 0x0

    .line 128
    :goto_0
    return-object v0

    :cond_0
    iget-object v0, p0, Lcom/android/providers/contacts/t9/T9Item;->mDisplayName:Ljava/lang/String;

    invoke-static {p0, v0, p1}, Lcom/android/providers/contacts/t9/T9Builder;->buildT9Key(Lcom/android/providers/contacts/t9/T9Item;Ljava/lang/String;Ljava/util/ArrayList;)Lcom/android/providers/contacts/t9/T9Item;

    move-result-object v0

    goto :goto_0
.end method

.method private static buildHeadBackTokens(Ljava/util/ArrayList;Ljava/util/ArrayList;IZ)I
    .locals 4
    .param p2, "index"    # I
    .param p3, "middle"    # Z
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/ArrayList",
            "<[",
            "Ljava/lang/String;",
            ">;",
            "Ljava/util/ArrayList",
            "<",
            "Lmiui/text/ChinesePinyinConverter$Token;",
            ">;IZ)I"
        }
    .end annotation

    .prologue
    .line 502
    .local p0, "candidates":Ljava/util/ArrayList;, "Ljava/util/ArrayList<[Ljava/lang/String;>;"
    .local p1, "tokens":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Lmiui/text/ChinesePinyinConverter$Token;>;"
    const/4 v0, 0x0

    .line 503
    .local v0, "enough":I
    invoke-virtual {p1}, Ljava/util/ArrayList;->size()I

    move-result v1

    .line 504
    .local v1, "tokenSize":I
    if-nez p3, :cond_1

    .line 505
    invoke-virtual {p1, p2}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lmiui/text/ChinesePinyinConverter$Token;

    invoke-static {p0, v2, p2}, Lcom/android/providers/contacts/t9/T9Builder;->buildTokenIntoCandidates(Ljava/util/ArrayList;Lmiui/text/ChinesePinyinConverter$Token;I)I

    move-result v0

    .line 506
    if-nez v0, :cond_0

    .line 507
    sub-int v2, v1, p2

    add-int/lit8 v2, v2, -0x1

    invoke-virtual {p1, v2}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lmiui/text/ChinesePinyinConverter$Token;

    sub-int v3, v1, p2

    add-int/lit8 v3, v3, -0x1

    invoke-static {p0, v2, v3}, Lcom/android/providers/contacts/t9/T9Builder;->buildTokenIntoCandidates(Ljava/util/ArrayList;Lmiui/text/ChinesePinyinConverter$Token;I)I

    move-result v0

    .line 515
    :goto_0
    return v0

    .line 509
    :cond_0
    const/4 v0, 0x3

    goto :goto_0

    .line 513
    :cond_1
    invoke-virtual {p1, p2}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lmiui/text/ChinesePinyinConverter$Token;

    invoke-static {p0, v2, p2}, Lcom/android/providers/contacts/t9/T9Builder;->buildTokenIntoCandidates(Ljava/util/ArrayList;Lmiui/text/ChinesePinyinConverter$Token;I)I

    goto :goto_0
.end method

.method public static buildItem(Landroid/database/sqlite/SQLiteDatabase;IJ)Ljava/util/ArrayList;
    .locals 11
    .param p0, "db"    # Landroid/database/sqlite/SQLiteDatabase;
    .param p1, "type"    # I
    .param p2, "id"    # J
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/database/sqlite/SQLiteDatabase;",
            "IJ)",
            "Ljava/util/ArrayList",
            "<",
            "Lcom/android/providers/contacts/t9/T9Item;",
            ">;"
        }
    .end annotation

    .prologue
    const/4 v7, 0x0

    .line 81
    const/4 v0, 0x0

    .line 82
    .local v0, "cursor":Landroid/database/Cursor;
    invoke-static {}, Lcom/android/providers/contacts/t9/T9Utils;->getReusableItemList()Ljava/util/ArrayList;

    move-result-object v3

    .line 84
    .local v3, "items":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Lcom/android/providers/contacts/t9/T9Item;>;"
    if-nez p1, :cond_2

    .line 85
    :try_start_0
    sget-object v6, Lcom/android/providers/contacts/t9/T9Utils;->ITEM_QUERY_SQLS:[Ljava/lang/String;

    aget-object v6, v6, p1

    const/4 v8, 0x0

    invoke-virtual {p0, v6, v8}, Landroid/database/sqlite/SQLiteDatabase;->rawQuery(Ljava/lang/String;[Ljava/lang/String;)Landroid/database/Cursor;

    move-result-object v0

    .line 90
    :cond_0
    :goto_0
    invoke-interface {v0}, Landroid/database/Cursor;->moveToNext()Z

    move-result v6

    if-eqz v6, :cond_4

    .line 91
    new-instance v2, Lcom/android/providers/contacts/t9/T9Item;

    invoke-direct {v2}, Lcom/android/providers/contacts/t9/T9Item;-><init>()V

    .line 92
    .local v2, "item":Lcom/android/providers/contacts/t9/T9Item;
    const/4 v6, 0x4

    invoke-interface {v0, v6}, Landroid/database/Cursor;->getLong(I)J

    move-result-wide v4

    .line 93
    .local v4, "mimeTypeId":J
    const/4 v6, 0x0

    invoke-interface {v0, v6}, Landroid/database/Cursor;->getLong(I)J

    move-result-wide v8

    iput-wide v8, v2, Lcom/android/providers/contacts/t9/T9Item;->mDataId:J

    .line 94
    const/4 v6, 0x1

    invoke-interface {v0, v6}, Landroid/database/Cursor;->getLong(I)J

    move-result-wide v8

    iput-wide v8, v2, Lcom/android/providers/contacts/t9/T9Item;->mContactId:J

    .line 95
    const/4 v6, 0x2

    invoke-interface {v0, v6}, Landroid/database/Cursor;->getLong(I)J

    move-result-wide v8

    iput-wide v8, v2, Lcom/android/providers/contacts/t9/T9Item;->mRawContactId:J

    .line 96
    const/4 v6, 0x3

    invoke-interface {v0, v6}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v6

    iput-object v6, v2, Lcom/android/providers/contacts/t9/T9Item;->mData:Ljava/lang/String;

    .line 97
    iget-object v6, v2, Lcom/android/providers/contacts/t9/T9Item;->mData:Ljava/lang/String;

    invoke-static {v6, v4, v5}, Lcom/android/providers/contacts/t9/T9Builder;->normalizeData(Ljava/lang/String;J)Ljava/lang/String;

    move-result-object v6

    iput-object v6, v2, Lcom/android/providers/contacts/t9/T9Item;->mNormalizedData:Ljava/lang/String;

    .line 98
    const/4 v6, 0x5

    invoke-interface {v0, v6}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v6

    iput-object v6, v2, Lcom/android/providers/contacts/t9/T9Item;->mDisplayName:Ljava/lang/String;

    .line 99
    const/4 v6, 0x7

    invoke-interface {v0, v6}, Landroid/database/Cursor;->getLong(I)J

    move-result-wide v8

    iput-wide v8, v2, Lcom/android/providers/contacts/t9/T9Item;->mPhotoId:J

    .line 100
    const/16 v6, 0x8

    invoke-interface {v0, v6}, Landroid/database/Cursor;->getLong(I)J

    move-result-wide v8

    iput-wide v8, v2, Lcom/android/providers/contacts/t9/T9Item;->mTimesContacted:J

    .line 101
    const-string v6, ""

    iput-object v6, v2, Lcom/android/providers/contacts/t9/T9Item;->mDataTag:Ljava/lang/String;

    .line 103
    iget-object v6, v2, Lcom/android/providers/contacts/t9/T9Item;->mData:Ljava/lang/String;

    invoke-static {v6}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v6

    if-nez v6, :cond_0

    .line 104
    const/4 v6, 0x6

    invoke-interface {v0, v6}, Landroid/database/Cursor;->isNull(I)Z

    move-result v6

    if-eqz v6, :cond_3

    move-object v6, v7

    :goto_1
    invoke-static {v2, v6}, Lcom/android/providers/contacts/t9/T9Builder;->build(Lcom/android/providers/contacts/t9/T9Item;Ljava/util/ArrayList;)Lcom/android/providers/contacts/t9/T9Item;

    move-result-object v2

    .line 107
    if-eqz v2, :cond_0

    .line 108
    invoke-virtual {v3, v2}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z
    :try_end_0
    .catch Ljava/lang/RuntimeException; {:try_start_0 .. :try_end_0} :catch_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    goto :goto_0

    .line 112
    .end local v2    # "item":Lcom/android/providers/contacts/t9/T9Item;
    .end local v4    # "mimeTypeId":J
    :catch_0
    move-exception v1

    .line 113
    .local v1, "e":Ljava/lang/RuntimeException;
    :try_start_1
    new-instance v6, Ljava/lang/StringBuilder;

    invoke-direct {v6}, Ljava/lang/StringBuilder;-><init>()V

    const-string v7, "failed to query database - "

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    sget-object v7, Lcom/android/providers/contacts/t9/T9Utils;->ITEM_QUERY_SQLS:[Ljava/lang/String;

    aget-object v7, v7, p1

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v6

    invoke-static {v6, v1}, Lcom/android/providers/contacts/t9/T9Utils;->loge(Ljava/lang/String;Ljava/lang/Throwable;)V
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 115
    if-eqz v0, :cond_1

    .line 116
    invoke-interface {v0}, Landroid/database/Cursor;->close()V

    .line 119
    .end local v1    # "e":Ljava/lang/RuntimeException;
    :cond_1
    :goto_2
    return-object v3

    .line 87
    :cond_2
    :try_start_2
    sget-object v6, Lcom/android/providers/contacts/t9/T9Utils;->ITEM_QUERY_SQLS:[Ljava/lang/String;

    aget-object v6, v6, p1

    const/4 v8, 0x1

    new-array v8, v8, [Ljava/lang/String;

    const/4 v9, 0x0

    invoke-static {p2, p3}, Ljava/lang/String;->valueOf(J)Ljava/lang/String;

    move-result-object v10

    aput-object v10, v8, v9

    invoke-virtual {p0, v6, v8}, Landroid/database/sqlite/SQLiteDatabase;->rawQuery(Ljava/lang/String;[Ljava/lang/String;)Landroid/database/Cursor;

    move-result-object v0

    goto/16 :goto_0

    .line 104
    .restart local v2    # "item":Lcom/android/providers/contacts/t9/T9Item;
    .restart local v4    # "mimeTypeId":J
    :cond_3
    iget-object v6, v2, Lcom/android/providers/contacts/t9/T9Item;->mDisplayName:Ljava/lang/String;

    const/4 v8, 0x6

    invoke-interface {v0, v8}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v8

    invoke-static {v6, v8}, Lcom/android/providers/contacts/t9/T9Builder;->buildPinyinTokens(Ljava/lang/String;Ljava/lang/String;)Ljava/util/ArrayList;
    :try_end_2
    .catch Ljava/lang/RuntimeException; {:try_start_2 .. :try_end_2} :catch_0
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    move-result-object v6

    goto :goto_1

    .line 115
    .end local v2    # "item":Lcom/android/providers/contacts/t9/T9Item;
    .end local v4    # "mimeTypeId":J
    :cond_4
    if-eqz v0, :cond_1

    .line 116
    invoke-interface {v0}, Landroid/database/Cursor;->close()V

    goto :goto_2

    .line 115
    :catchall_0
    move-exception v6

    if-eqz v0, :cond_5

    .line 116
    invoke-interface {v0}, Landroid/database/Cursor;->close()V

    :cond_5
    throw v6
.end method

.method public static buildOneYellowPageT9Item(JLjava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;J)Lcom/android/providers/contacts/t9/T9Item;
    .locals 8
    .param p0, "yid"    # J
    .param p2, "number"    # Ljava/lang/String;
    .param p3, "displayName"    # Ljava/lang/String;
    .param p4, "phoneTag"    # Ljava/lang/String;
    .param p5, "pinyin"    # Ljava/lang/String;
    .param p6, "t9Rank"    # J

    .prologue
    .line 64
    invoke-static {p0, p1}, Lcom/android/providers/contacts/t9/T9Utils;->convertYellowPageIdToContact(J)J

    move-result-wide v0

    .line 65
    .local v0, "contactId":J
    invoke-static {p2}, Lcom/android/providers/contacts/t9/T9Utils;->convertYellowPageNumberToDataId(Ljava/lang/String;)J

    move-result-wide v2

    .line 66
    .local v2, "dataId":J
    move-wide v5, v2

    .line 68
    .local v5, "rawContactId":J
    new-instance v4, Lcom/android/providers/contacts/t9/T9Item;

    invoke-direct {v4}, Lcom/android/providers/contacts/t9/T9Item;-><init>()V

    .line 69
    .local v4, "item":Lcom/android/providers/contacts/t9/T9Item;
    iput-wide v2, v4, Lcom/android/providers/contacts/t9/T9Item;->mDataId:J

    .line 70
    iput-wide v0, v4, Lcom/android/providers/contacts/t9/T9Item;->mContactId:J

    .line 71
    iput-wide v5, v4, Lcom/android/providers/contacts/t9/T9Item;->mRawContactId:J

    .line 72
    iput-object p2, v4, Lcom/android/providers/contacts/t9/T9Item;->mData:Ljava/lang/String;

    .line 73
    iget-object v7, v4, Lcom/android/providers/contacts/t9/T9Item;->mData:Ljava/lang/String;

    iput-object v7, v4, Lcom/android/providers/contacts/t9/T9Item;->mNormalizedData:Ljava/lang/String;

    .line 74
    iput-object p3, v4, Lcom/android/providers/contacts/t9/T9Item;->mDisplayName:Ljava/lang/String;

    .line 75
    iput-object p4, v4, Lcom/android/providers/contacts/t9/T9Item;->mDataTag:Ljava/lang/String;

    .line 76
    iput-wide p6, v4, Lcom/android/providers/contacts/t9/T9Item;->mTimesContacted:J

    .line 77
    iget-object v7, v4, Lcom/android/providers/contacts/t9/T9Item;->mDisplayName:Ljava/lang/String;

    invoke-static {v7, p5}, Lcom/android/providers/contacts/t9/T9Builder;->buildPinyinTokens(Ljava/lang/String;Ljava/lang/String;)Ljava/util/ArrayList;

    move-result-object v7

    invoke-static {v4, v7}, Lcom/android/providers/contacts/t9/T9Builder;->build(Lcom/android/providers/contacts/t9/T9Item;Ljava/util/ArrayList;)Lcom/android/providers/contacts/t9/T9Item;

    move-result-object v7

    return-object v7
.end method

.method private static buildPinyinTokens(Ljava/lang/String;Ljava/lang/String;)Ljava/util/ArrayList;
    .locals 8
    .param p0, "name"    # Ljava/lang/String;
    .param p1, "pinyin"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ")",
            "Ljava/util/ArrayList",
            "<",
            "Lmiui/text/ChinesePinyinConverter$Token;",
            ">;"
        }
    .end annotation

    .prologue
    const/4 v5, 0x0

    .line 132
    invoke-static {p1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v6

    if-eqz v6, :cond_1

    move-object v3, v5

    .line 150
    :cond_0
    return-object v3

    .line 136
    :cond_1
    invoke-virtual {p1}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object v6

    const-string v7, " "

    invoke-virtual {v6, v7}, Ljava/lang/String;->split(Ljava/lang/String;)[Ljava/lang/String;

    move-result-object v1

    .line 137
    .local v1, "pinyins":[Ljava/lang/String;
    new-instance v3, Ljava/util/ArrayList;

    invoke-direct {v3}, Ljava/util/ArrayList;-><init>()V

    .line 138
    .local v3, "tokens":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Lmiui/text/ChinesePinyinConverter$Token;>;"
    const/4 v0, 0x0

    .local v0, "i":I
    :goto_0
    array-length v6, v1

    if-ge v0, v6, :cond_0

    .line 139
    aget-object v6, v1, v0

    invoke-static {v6}, Lcom/android/providers/contacts/t9/T9Builder;->filterNonLetterAndDigit(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v4

    .line 140
    .local v4, "validPinyin":Ljava/lang/String;
    invoke-virtual {v4}, Ljava/lang/String;->length()I

    move-result v6

    if-lez v6, :cond_2

    .line 141
    new-instance v2, Lmiui/text/ChinesePinyinConverter$Token;

    invoke-direct {v2}, Lmiui/text/ChinesePinyinConverter$Token;-><init>()V

    .line 142
    .local v2, "t":Lmiui/text/ChinesePinyinConverter$Token;
    iput-object v5, v2, Lmiui/text/ChinesePinyinConverter$Token;->polyPhones:[Ljava/lang/String;

    .line 143
    iput-object v5, v2, Lmiui/text/ChinesePinyinConverter$Token;->source:Ljava/lang/String;

    .line 144
    iput-object v4, v2, Lmiui/text/ChinesePinyinConverter$Token;->target:Ljava/lang/String;

    .line 145
    const/4 v6, 0x2

    iput v6, v2, Lmiui/text/ChinesePinyinConverter$Token;->type:I

    .line 146
    invoke-virtual {v3, v2}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 138
    .end local v2    # "t":Lmiui/text/ChinesePinyinConverter$Token;
    :cond_2
    add-int/lit8 v0, v0, 0x1

    goto :goto_0
.end method

.method public static buildT9Key(Lcom/android/providers/contacts/t9/T9Item;Ljava/lang/String;Ljava/util/ArrayList;)Lcom/android/providers/contacts/t9/T9Item;
    .locals 4
    .param p0, "item"    # Lcom/android/providers/contacts/t9/T9Item;
    .param p1, "name"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/android/providers/contacts/t9/T9Item;",
            "Ljava/lang/String;",
            "Ljava/util/ArrayList",
            "<",
            "Lmiui/text/ChinesePinyinConverter$Token;",
            ">;)",
            "Lcom/android/providers/contacts/t9/T9Item;"
        }
    .end annotation

    .prologue
    .line 162
    .local p2, "originalTokens":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Lmiui/text/ChinesePinyinConverter$Token;>;"
    const/4 v2, 0x1

    :try_start_0
    invoke-static {p0, p1, p2, v2}, Lcom/android/providers/contacts/t9/T9Builder;->buildT9Key(Lcom/android/providers/contacts/t9/T9Item;Ljava/lang/String;Ljava/util/ArrayList;Z)Lcom/android/providers/contacts/t9/T9Item;
    :try_end_0
    .catch Ljava/lang/OutOfMemoryError; {:try_start_0 .. :try_end_0} :catch_0

    move-result-object v2

    .line 171
    :goto_0
    return-object v2

    .line 163
    :catch_0
    move-exception v0

    .line 164
    .local v0, "e":Ljava/lang/OutOfMemoryError;
    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "Unable to build name \""

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v3, "\" due to OutOfMemoryError"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v2, v0}, Lcom/android/providers/contacts/t9/T9Utils;->loge(Ljava/lang/String;Ljava/lang/Throwable;)V

    .line 166
    const/4 v2, 0x0

    :try_start_1
    invoke-static {p0, p1, p2, v2}, Lcom/android/providers/contacts/t9/T9Builder;->buildT9Key(Lcom/android/providers/contacts/t9/T9Item;Ljava/lang/String;Ljava/util/ArrayList;Z)Lcom/android/providers/contacts/t9/T9Item;
    :try_end_1
    .catch Ljava/lang/OutOfMemoryError; {:try_start_1 .. :try_end_1} :catch_1

    move-result-object v2

    goto :goto_0

    .line 167
    :catch_1
    move-exception v1

    .line 168
    .local v1, "e2":Ljava/lang/OutOfMemoryError;
    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "Unable to build name \""

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v3, "\" due to OutOfMemoryError when polyphones disabled"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v2, v1}, Lcom/android/providers/contacts/t9/T9Utils;->loge(Ljava/lang/String;Ljava/lang/Throwable;)V

    .line 171
    const/4 v2, 0x0

    goto :goto_0
.end method

.method private static buildT9Key(Lcom/android/providers/contacts/t9/T9Item;Ljava/lang/String;Ljava/util/ArrayList;Z)Lcom/android/providers/contacts/t9/T9Item;
    .locals 24
    .param p0, "item"    # Lcom/android/providers/contacts/t9/T9Item;
    .param p1, "name"    # Ljava/lang/String;
    .param p3, "enablePolyPhones"    # Z
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/android/providers/contacts/t9/T9Item;",
            "Ljava/lang/String;",
            "Ljava/util/ArrayList",
            "<",
            "Lmiui/text/ChinesePinyinConverter$Token;",
            ">;Z)",
            "Lcom/android/providers/contacts/t9/T9Item;"
        }
    .end annotation

    .prologue
    .line 176
    .local p2, "originalTokens":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Lmiui/text/ChinesePinyinConverter$Token;>;"
    if-nez p2, :cond_2

    .line 177
    invoke-static {}, Lmiui/text/ChinesePinyinConverter;->getInstance()Lmiui/text/ChinesePinyinConverter;

    move-result-object v20

    const/16 v21, 0x0

    const/16 v22, 0x1

    move-object/from16 v0, v20

    move-object/from16 v1, p1

    move/from16 v2, v21

    move/from16 v3, v22

    invoke-virtual {v0, v1, v2, v3}, Lmiui/text/ChinesePinyinConverter;->get(Ljava/lang/String;ZZ)Ljava/util/ArrayList;

    move-result-object p2

    .line 185
    :cond_0
    if-nez p3, :cond_3

    .line 186
    invoke-virtual/range {p2 .. p2}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v8

    .local v8, "i$":Ljava/util/Iterator;
    :cond_1
    :goto_0
    invoke-interface {v8}, Ljava/util/Iterator;->hasNext()Z

    move-result v20

    if-eqz v20, :cond_3

    invoke-interface {v8}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v15

    check-cast v15, Lmiui/text/ChinesePinyinConverter$Token;

    .line 187
    .local v15, "t":Lmiui/text/ChinesePinyinConverter$Token;
    iget v0, v15, Lmiui/text/ChinesePinyinConverter$Token;->type:I

    move/from16 v20, v0

    const/16 v21, 0x2

    move/from16 v0, v20

    move/from16 v1, v21

    if-ne v0, v1, :cond_1

    iget-object v0, v15, Lmiui/text/ChinesePinyinConverter$Token;->polyPhones:[Ljava/lang/String;

    move-object/from16 v20, v0

    if-eqz v20, :cond_1

    .line 188
    const/16 v20, 0x1

    move/from16 v0, v20

    new-array v0, v0, [Ljava/lang/String;

    move-object/from16 v20, v0

    const/16 v21, 0x0

    iget-object v0, v15, Lmiui/text/ChinesePinyinConverter$Token;->polyPhones:[Ljava/lang/String;

    move-object/from16 v22, v0

    const/16 v23, 0x0

    aget-object v22, v22, v23

    aput-object v22, v20, v21

    move-object/from16 v0, v20

    iput-object v0, v15, Lmiui/text/ChinesePinyinConverter$Token;->polyPhones:[Ljava/lang/String;

    goto :goto_0

    .line 180
    .end local v8    # "i$":Ljava/util/Iterator;
    .end local v15    # "t":Lmiui/text/ChinesePinyinConverter$Token;
    :cond_2
    invoke-virtual/range {p2 .. p2}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v8

    .restart local v8    # "i$":Ljava/util/Iterator;
    :goto_1
    invoke-interface {v8}, Ljava/util/Iterator;->hasNext()Z

    move-result v20

    if-eqz v20, :cond_0

    invoke-interface {v8}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v15

    check-cast v15, Lmiui/text/ChinesePinyinConverter$Token;

    .line 181
    .restart local v15    # "t":Lmiui/text/ChinesePinyinConverter$Token;
    const/16 v20, -0x1

    move/from16 v0, v20

    iput v0, v15, Lmiui/text/ChinesePinyinConverter$Token;->type:I

    goto :goto_1

    .line 193
    .end local v8    # "i$":Ljava/util/Iterator;
    .end local v15    # "t":Lmiui/text/ChinesePinyinConverter$Token;
    :cond_3
    sget-object v20, Lcom/android/providers/contacts/t9/T9Utils;->sContext:Landroid/content/Context;

    invoke-virtual/range {v20 .. v20}, Landroid/content/Context;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v20

    const-string v21, "t9_indexing_key"

    invoke-static {}, Landroid/provider/MiuiSettings$System;->getT9IndexingKeyDefault()I

    move-result v22

    invoke-static/range {v20 .. v22}, Landroid/provider/Settings$System;->getInt(Landroid/content/ContentResolver;Ljava/lang/String;I)I

    move-result v20

    const/16 v21, 0x1

    move/from16 v0, v20

    move/from16 v1, v21

    if-ne v0, v1, :cond_5

    const/16 v19, 0x1

    .line 198
    .local v19, "useZhuyin":Z
    :goto_2
    new-instance v18, Ljava/util/ArrayList;

    invoke-direct/range {v18 .. v18}, Ljava/util/ArrayList;-><init>()V

    .line 201
    .local v18, "tokens":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Lmiui/text/ChinesePinyinConverter$Token;>;"
    const/4 v11, 0x2

    .line 203
    .local v11, "keyType":I
    invoke-static {}, Lcom/android/providers/contacts/t9/T9Utils;->getReusableStringBuilder()Ljava/lang/StringBuilder;

    move-result-object v4

    .line 206
    .local v4, "builder":Ljava/lang/StringBuilder;
    invoke-virtual/range {p2 .. p2}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v8

    .restart local v8    # "i$":Ljava/util/Iterator;
    :cond_4
    :goto_3
    invoke-interface {v8}, Ljava/util/Iterator;->hasNext()Z

    move-result v20

    if-eqz v20, :cond_8

    invoke-interface {v8}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v15

    check-cast v15, Lmiui/text/ChinesePinyinConverter$Token;

    .line 207
    .restart local v15    # "t":Lmiui/text/ChinesePinyinConverter$Token;
    iget v0, v15, Lmiui/text/ChinesePinyinConverter$Token;->type:I

    move/from16 v20, v0

    packed-switch v20, :pswitch_data_0

    :pswitch_0
    goto :goto_3

    .line 230
    :pswitch_1
    const/4 v11, 0x1

    .line 231
    iget-object v0, v15, Lmiui/text/ChinesePinyinConverter$Token;->target:Ljava/lang/String;

    move-object/from16 v20, v0

    invoke-static/range {v20 .. v20}, Lcom/android/providers/contacts/t9/T9Builder;->filterNonPinyinAndZhuyin(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v20

    move-object/from16 v0, v20

    iput-object v0, v15, Lmiui/text/ChinesePinyinConverter$Token;->target:Ljava/lang/String;

    .line 232
    const/16 v20, 0x2

    move/from16 v0, v20

    iput v0, v15, Lmiui/text/ChinesePinyinConverter$Token;->type:I

    .line 233
    iget-object v0, v15, Lmiui/text/ChinesePinyinConverter$Token;->target:Ljava/lang/String;

    move-object/from16 v20, v0

    invoke-virtual/range {v20 .. v20}, Ljava/lang/String;->length()I

    move-result v20

    if-eqz v20, :cond_4

    .line 234
    const/16 v20, 0x1

    move/from16 v0, v20

    new-array v0, v0, [Ljava/lang/String;

    move-object/from16 v20, v0

    const/16 v21, 0x0

    iget-object v0, v15, Lmiui/text/ChinesePinyinConverter$Token;->target:Ljava/lang/String;

    move-object/from16 v22, v0

    aput-object v22, v20, v21

    move-object/from16 v0, v20

    iput-object v0, v15, Lmiui/text/ChinesePinyinConverter$Token;->polyPhones:[Ljava/lang/String;

    .line 235
    move-object/from16 v0, v18

    invoke-virtual {v0, v15}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    goto :goto_3

    .line 193
    .end local v4    # "builder":Ljava/lang/StringBuilder;
    .end local v8    # "i$":Ljava/util/Iterator;
    .end local v11    # "keyType":I
    .end local v15    # "t":Lmiui/text/ChinesePinyinConverter$Token;
    .end local v18    # "tokens":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Lmiui/text/ChinesePinyinConverter$Token;>;"
    .end local v19    # "useZhuyin":Z
    :cond_5
    const/16 v19, 0x0

    goto :goto_2

    .line 209
    .restart local v4    # "builder":Ljava/lang/StringBuilder;
    .restart local v8    # "i$":Ljava/util/Iterator;
    .restart local v11    # "keyType":I
    .restart local v15    # "t":Lmiui/text/ChinesePinyinConverter$Token;
    .restart local v18    # "tokens":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Lmiui/text/ChinesePinyinConverter$Token;>;"
    .restart local v19    # "useZhuyin":Z
    :pswitch_2
    const/4 v11, 0x1

    .line 210
    iget-object v0, v15, Lmiui/text/ChinesePinyinConverter$Token;->polyPhones:[Ljava/lang/String;

    move-object/from16 v20, v0

    if-nez v20, :cond_6

    .line 211
    const/16 v20, 0x1

    move/from16 v0, v20

    new-array v0, v0, [Ljava/lang/String;

    move-object/from16 v20, v0

    const/16 v21, 0x0

    iget-object v0, v15, Lmiui/text/ChinesePinyinConverter$Token;->target:Ljava/lang/String;

    move-object/from16 v22, v0

    aput-object v22, v20, v21

    move-object/from16 v0, v20

    iput-object v0, v15, Lmiui/text/ChinesePinyinConverter$Token;->polyPhones:[Ljava/lang/String;

    .line 213
    :cond_6
    if-eqz v19, :cond_7

    .line 214
    const/4 v7, 0x0

    .local v7, "i":I
    :goto_4
    iget-object v0, v15, Lmiui/text/ChinesePinyinConverter$Token;->polyPhones:[Ljava/lang/String;

    move-object/from16 v20, v0

    move-object/from16 v0, v20

    array-length v0, v0

    move/from16 v20, v0

    move/from16 v0, v20

    if-ge v7, v0, :cond_7

    .line 215
    iget-object v0, v15, Lmiui/text/ChinesePinyinConverter$Token;->polyPhones:[Ljava/lang/String;

    move-object/from16 v20, v0

    invoke-static {}, Lmiui/text/ChinesePinyinConverter;->getInstance()Lmiui/text/ChinesePinyinConverter;

    move-result-object v21

    iget-object v0, v15, Lmiui/text/ChinesePinyinConverter$Token;->polyPhones:[Ljava/lang/String;

    move-object/from16 v22, v0

    aget-object v22, v22, v7

    move-object/from16 v0, v21

    move-object/from16 v1, v22

    invoke-virtual {v0, v1, v4}, Lmiui/text/ChinesePinyinConverter;->convertPinyin2Bopomofo(Ljava/lang/String;Ljava/lang/StringBuilder;)Ljava/lang/CharSequence;

    move-result-object v21

    invoke-virtual/range {v21 .. v21}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v21

    aput-object v21, v20, v7

    .line 214
    add-int/lit8 v7, v7, 0x1

    goto :goto_4

    .line 218
    .end local v7    # "i":I
    :cond_7
    move-object/from16 v0, v18

    invoke-virtual {v0, v15}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    goto/16 :goto_3

    .line 223
    :pswitch_3
    iget-object v0, v15, Lmiui/text/ChinesePinyinConverter$Token;->source:Ljava/lang/String;

    move-object/from16 v20, v0

    invoke-static/range {v20 .. v20}, Lcom/android/providers/contacts/t9/T9Builder;->filterNonLetterAndDigit(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v20

    move-object/from16 v0, v20

    iput-object v0, v15, Lmiui/text/ChinesePinyinConverter$Token;->target:Ljava/lang/String;

    .line 224
    iget-object v0, v15, Lmiui/text/ChinesePinyinConverter$Token;->target:Ljava/lang/String;

    move-object/from16 v20, v0

    invoke-virtual/range {v20 .. v20}, Ljava/lang/String;->length()I

    move-result v20

    if-eqz v20, :cond_4

    .line 225
    move-object/from16 v0, v18

    invoke-virtual {v0, v15}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    goto/16 :goto_3

    .line 241
    .end local v15    # "t":Lmiui/text/ChinesePinyinConverter$Token;
    :cond_8
    int-to-long v0, v11

    move-wide/from16 v20, v0

    move-wide/from16 v0, v20

    move-object/from16 v2, p0

    iput-wide v0, v2, Lcom/android/providers/contacts/t9/T9Item;->mKeyType:J

    .line 244
    const/16 v20, 0x1

    move/from16 v0, v20

    if-ne v11, v0, :cond_15

    .line 246
    new-instance v5, Ljava/util/ArrayList;

    invoke-direct {v5}, Ljava/util/ArrayList;-><init>()V

    .line 247
    .local v5, "candidates":Ljava/util/ArrayList;, "Ljava/util/ArrayList<[Ljava/lang/String;>;"
    invoke-virtual/range {v18 .. v18}, Ljava/util/ArrayList;->size()I

    move-result v20

    move/from16 v0, v20

    new-array v0, v0, [Ljava/lang/String;

    move-object/from16 v20, v0

    move-object/from16 v0, v20

    invoke-virtual {v5, v0}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 249
    invoke-virtual/range {v18 .. v18}, Ljava/util/ArrayList;->size()I

    move-result v17

    .line 250
    .local v17, "tokenSize":I
    const v12, 0x3ecccccc    # 0.39999998f

    .line 251
    .local v12, "lastScale":F
    const/4 v6, 0x0

    .line 252
    .local v6, "enough":I
    const/4 v7, 0x0

    .restart local v7    # "i":I
    :goto_5
    add-int/lit8 v20, v17, 0x1

    div-int/lit8 v20, v20, 0x2

    move/from16 v0, v20

    if-ge v7, v0, :cond_9

    .line 253
    const/16 v20, 0x3

    move/from16 v0, v20

    if-ge v7, v0, :cond_b

    .line 256
    sub-int v20, v17, v7

    add-int/lit8 v20, v20, -0x1

    move/from16 v0, v20

    if-ne v0, v7, :cond_a

    const/16 v20, 0x1

    :goto_6
    move-object/from16 v0, v18

    move/from16 v1, v20

    invoke-static {v5, v0, v7, v1}, Lcom/android/providers/contacts/t9/T9Builder;->buildHeadBackTokens(Ljava/util/ArrayList;Ljava/util/ArrayList;IZ)I

    move-result v6

    .line 284
    :goto_7
    if-eqz v6, :cond_10

    .line 285
    const/16 v20, 0x3

    move/from16 v0, v20

    if-ne v6, v0, :cond_f

    const/16 v20, 0x1

    :goto_8
    invoke-static/range {v20 .. v20}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v20

    move-object/from16 v0, v18

    move-object/from16 v1, v20

    invoke-static {v5, v0, v7, v1}, Lcom/android/providers/contacts/t9/T9Builder;->fillCandidate(Ljava/util/ArrayList;Ljava/util/ArrayList;ILjava/lang/Boolean;)V

    .line 289
    :cond_9
    invoke-virtual {v5}, Ljava/util/ArrayList;->size()I

    move-result v20

    const/16 v21, 0x1

    move/from16 v0, v20

    move/from16 v1, v21

    if-ne v0, v1, :cond_11

    .line 290
    const/16 v20, 0x0

    move/from16 v0, v20

    invoke-virtual {v5, v0}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v20

    check-cast v20, [Ljava/lang/String;

    invoke-static/range {v20 .. v20}, Lcom/android/providers/contacts/t9/T9Builder;->joinName([Ljava/lang/String;)Ljava/lang/String;

    move-result-object v20

    move-object/from16 v0, v20

    move-object/from16 v1, p0

    iput-object v0, v1, Lcom/android/providers/contacts/t9/T9Item;->mDisplayString:Ljava/lang/String;

    .line 291
    const/16 v20, 0x0

    move/from16 v0, v20

    invoke-virtual {v5, v0}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v20

    check-cast v20, [Ljava/lang/String;

    invoke-static/range {v20 .. v20}, Lcom/android/providers/contacts/t9/T9Builder;->convertNameToT9Key([Ljava/lang/String;)Ljava/lang/String;

    move-result-object v20

    move-object/from16 v0, v20

    move-object/from16 v1, p0

    iput-object v0, v1, Lcom/android/providers/contacts/t9/T9Item;->mT9Key:Ljava/lang/String;

    .line 317
    .end local v5    # "candidates":Ljava/util/ArrayList;, "Ljava/util/ArrayList<[Ljava/lang/String;>;"
    .end local v6    # "enough":I
    .end local v7    # "i":I
    .end local v12    # "lastScale":F
    .end local v17    # "tokenSize":I
    :goto_9
    return-object p0

    .line 256
    .restart local v5    # "candidates":Ljava/util/ArrayList;, "Ljava/util/ArrayList<[Ljava/lang/String;>;"
    .restart local v6    # "enough":I
    .restart local v7    # "i":I
    .restart local v12    # "lastScale":F
    .restart local v17    # "tokenSize":I
    :cond_a
    const/16 v20, 0x0

    goto :goto_6

    .line 264
    :cond_b
    sub-int v20, v17, v7

    add-int/lit8 v20, v20, -0x2

    add-int/lit8 v21, v7, 0x1

    move/from16 v0, v20

    move/from16 v1, v21

    if-le v0, v1, :cond_c

    .line 265
    const v20, 0x3f19999a    # 0.6f

    mul-float v16, v12, v20

    .line 270
    .local v16, "thisScale":F
    :goto_a
    const v20, 0x3ca3d70a    # 0.02f

    cmpg-float v20, v16, v20

    if-gez v20, :cond_d

    invoke-virtual {v5}, Ljava/util/ArrayList;->size()I

    move-result v20

    const/16 v21, 0x16d

    move/from16 v0, v20

    move/from16 v1, v21

    if-lt v0, v1, :cond_d

    .line 274
    const/4 v6, 0x2

    .line 275
    add-int/lit8 v7, v7, -0x1

    .line 281
    :goto_b
    sub-float v12, v12, v16

    goto :goto_7

    .line 267
    .end local v16    # "thisScale":F
    :cond_c
    move/from16 v16, v12

    .restart local v16    # "thisScale":F
    goto :goto_a

    .line 278
    :cond_d
    sub-int v20, v17, v7

    add-int/lit8 v20, v20, -0x1

    move/from16 v0, v20

    if-ne v0, v7, :cond_e

    const/16 v20, 0x1

    :goto_c
    move-object/from16 v0, v18

    move/from16 v1, v20

    invoke-static {v5, v0, v7, v1}, Lcom/android/providers/contacts/t9/T9Builder;->buildHeadBackTokens(Ljava/util/ArrayList;Ljava/util/ArrayList;IZ)I

    move-result v6

    goto :goto_b

    :cond_e
    const/16 v20, 0x0

    goto :goto_c

    .line 285
    .end local v16    # "thisScale":F
    :cond_f
    const/16 v20, 0x0

    goto/16 :goto_8

    .line 252
    :cond_10
    add-int/lit8 v7, v7, 0x1

    goto/16 :goto_5

    .line 293
    :cond_11
    invoke-static {}, Lcom/android/providers/contacts/t9/T9Utils;->getReusableStringBuilder()Ljava/lang/StringBuilder;

    move-result-object v14

    .line 294
    .local v14, "nbuilder":Ljava/lang/StringBuilder;
    invoke-static {}, Lcom/android/providers/contacts/t9/T9Utils;->getReusableStringBuilder()Ljava/lang/StringBuilder;

    move-result-object v10

    .line 295
    .local v10, "kbuilder":Ljava/lang/StringBuilder;
    const/4 v7, 0x0

    :goto_d
    invoke-virtual {v5}, Ljava/util/ArrayList;->size()I

    move-result v20

    move/from16 v0, v20

    if-ge v7, v0, :cond_14

    .line 296
    invoke-virtual {v5, v7}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v20

    check-cast v20, [Ljava/lang/String;

    invoke-static/range {v20 .. v20}, Lcom/android/providers/contacts/t9/T9Builder;->joinName([Ljava/lang/String;)Ljava/lang/String;

    move-result-object v13

    .line 297
    .local v13, "n":Ljava/lang/String;
    invoke-virtual {v5, v7}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v20

    check-cast v20, [Ljava/lang/String;

    invoke-static/range {v20 .. v20}, Lcom/android/providers/contacts/t9/T9Builder;->convertNameToT9Key([Ljava/lang/String;)Ljava/lang/String;

    move-result-object v9

    .line 298
    .local v9, "k":Ljava/lang/String;
    invoke-virtual {v10, v9}, Ljava/lang/StringBuilder;->indexOf(Ljava/lang/String;)I

    move-result v20

    if-gez v20, :cond_13

    .line 299
    invoke-virtual {v10}, Ljava/lang/StringBuilder;->length()I

    move-result v20

    if-eqz v20, :cond_12

    .line 300
    const/16 v20, 0x3b

    move/from16 v0, v20

    invoke-virtual {v10, v0}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 301
    const/16 v20, 0x3b

    move/from16 v0, v20

    invoke-virtual {v14, v0}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 303
    :cond_12
    invoke-virtual {v10, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 304
    invoke-virtual {v14, v13}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 295
    :cond_13
    add-int/lit8 v7, v7, 0x1

    goto :goto_d

    .line 307
    .end local v9    # "k":Ljava/lang/String;
    .end local v13    # "n":Ljava/lang/String;
    :cond_14
    invoke-virtual {v14}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v20

    move-object/from16 v0, v20

    move-object/from16 v1, p0

    iput-object v0, v1, Lcom/android/providers/contacts/t9/T9Item;->mDisplayString:Ljava/lang/String;

    .line 308
    invoke-virtual {v10}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v20

    move-object/from16 v0, v20

    move-object/from16 v1, p0

    iput-object v0, v1, Lcom/android/providers/contacts/t9/T9Item;->mT9Key:Ljava/lang/String;

    .line 309
    invoke-static {v14}, Lcom/android/providers/contacts/t9/T9Utils;->recyle(Ljava/lang/StringBuilder;)V

    .line 310
    invoke-static {v10}, Lcom/android/providers/contacts/t9/T9Utils;->recyle(Ljava/lang/StringBuilder;)V

    goto/16 :goto_9

    .line 314
    .end local v5    # "candidates":Ljava/util/ArrayList;, "Ljava/util/ArrayList<[Ljava/lang/String;>;"
    .end local v6    # "enough":I
    .end local v7    # "i":I
    .end local v10    # "kbuilder":Ljava/lang/StringBuilder;
    .end local v12    # "lastScale":F
    .end local v14    # "nbuilder":Ljava/lang/StringBuilder;
    .end local v17    # "tokenSize":I
    :cond_15
    move-object/from16 v0, p1

    move-object/from16 v1, p0

    iput-object v0, v1, Lcom/android/providers/contacts/t9/T9Item;->mDisplayString:Ljava/lang/String;

    .line 315
    invoke-static/range {p1 .. p1}, Lcom/android/providers/contacts/t9/T9Builder;->convertNameToT9Key(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v20

    move-object/from16 v0, v20

    move-object/from16 v1, p0

    iput-object v0, v1, Lcom/android/providers/contacts/t9/T9Item;->mT9Key:Ljava/lang/String;

    goto/16 :goto_9

    .line 207
    :pswitch_data_0
    .packed-switch -0x1
        :pswitch_1
        :pswitch_0
        :pswitch_3
        :pswitch_2
    .end packed-switch
.end method

.method private static buildTokenIntoCandidates(Ljava/util/ArrayList;Lmiui/text/ChinesePinyinConverter$Token;I)I
    .locals 9
    .param p1, "t"    # Lmiui/text/ChinesePinyinConverter$Token;
    .param p2, "index"    # I
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/ArrayList",
            "<[",
            "Ljava/lang/String;",
            ">;",
            "Lmiui/text/ChinesePinyinConverter$Token;",
            "I)I"
        }
    .end annotation

    .prologue
    .local p0, "candidates":Ljava/util/ArrayList;, "Ljava/util/ArrayList<[Ljava/lang/String;>;"
    const/4 v8, 0x1

    const/4 v7, 0x0

    .line 462
    const/4 v4, 0x0

    .line 463
    .local v4, "tokenTarget":Ljava/lang/String;
    const/4 v0, 0x0

    .line 464
    .local v0, "enough":I
    iget v5, p1, Lmiui/text/ChinesePinyinConverter$Token;->type:I

    packed-switch v5, :pswitch_data_0

    .line 489
    :cond_0
    return v0

    .line 466
    :pswitch_0
    invoke-virtual {p0}, Ljava/util/ArrayList;->size()I

    move-result v3

    .line 467
    .local v3, "lastSize":I
    iget-object v5, p1, Lmiui/text/ChinesePinyinConverter$Token;->polyPhones:[Ljava/lang/String;

    array-length v5, v5

    invoke-static {p0, v5}, Lcom/android/providers/contacts/t9/T9Builder;->extendCandidates(Ljava/util/ArrayList;I)I

    move-result v0

    .line 468
    const/4 v1, 0x0

    .local v1, "j":I
    :goto_0
    iget-object v5, p1, Lmiui/text/ChinesePinyinConverter$Token;->polyPhones:[Ljava/lang/String;

    array-length v5, v5

    if-ge v1, v5, :cond_0

    .line 469
    iget-object v5, p1, Lmiui/text/ChinesePinyinConverter$Token;->polyPhones:[Ljava/lang/String;

    aget-object v4, v5, v1

    .line 470
    invoke-virtual {v4}, Ljava/lang/String;->length()I

    move-result v5

    if-le v5, v8, :cond_1

    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v4, v7}, Ljava/lang/String;->charAt(I)C

    move-result v6

    invoke-static {v6}, Ljava/lang/Character;->toUpperCase(C)C

    move-result v6

    invoke-static {v6}, Ljava/lang/String;->valueOf(C)Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v4, v8}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/String;->toLowerCase()Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    .line 475
    :goto_1
    const/4 v2, 0x0

    .line 477
    .local v2, "k":I
    :goto_2
    mul-int v5, v1, v3

    add-int/2addr v5, v2

    invoke-virtual {p0}, Ljava/util/ArrayList;->size()I

    move-result v6

    if-ge v5, v6, :cond_2

    if-ge v2, v3, :cond_2

    .line 478
    mul-int v5, v1, v3

    add-int/2addr v5, v2

    invoke-virtual {p0, v5}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v5

    check-cast v5, [Ljava/lang/String;

    aput-object v4, v5, p2

    .line 479
    add-int/lit8 v2, v2, 0x1

    goto :goto_2

    .line 470
    .end local v2    # "k":I
    :cond_1
    invoke-virtual {v4, v7}, Ljava/lang/String;->charAt(I)C

    move-result v5

    invoke-static {v5}, Ljava/lang/Character;->toUpperCase(C)C

    move-result v5

    invoke-static {v5}, Ljava/lang/String;->valueOf(C)Ljava/lang/String;

    move-result-object v4

    goto :goto_1

    .line 468
    .restart local v2    # "k":I
    :cond_2
    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    .line 484
    .end local v1    # "j":I
    .end local v2    # "k":I
    .end local v3    # "lastSize":I
    :pswitch_1
    const/4 v2, 0x0

    .restart local v2    # "k":I
    :goto_3
    invoke-virtual {p0}, Ljava/util/ArrayList;->size()I

    move-result v5

    if-ge v2, v5, :cond_0

    .line 485
    invoke-virtual {p0, v2}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v5

    check-cast v5, [Ljava/lang/String;

    iget-object v6, p1, Lmiui/text/ChinesePinyinConverter$Token;->target:Ljava/lang/String;

    aput-object v6, v5, p2

    .line 484
    add-int/lit8 v2, v2, 0x1

    goto :goto_3

    .line 464
    :pswitch_data_0
    .packed-switch 0x1
        :pswitch_1
        :pswitch_0
    .end packed-switch
.end method

.method public static buildYellowPageItem()Ljava/util/ArrayList;
    .locals 13
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/ArrayList",
            "<",
            "Lcom/android/providers/contacts/t9/T9Item;",
            ">;"
        }
    .end annotation

    .prologue
    .line 34
    const/4 v8, 0x0

    .line 35
    .local v8, "cursor":Landroid/database/Cursor;
    invoke-static {}, Lcom/android/providers/contacts/t9/T9Utils;->getReusableItemList()Ljava/util/ArrayList;

    move-result-object v11

    .line 37
    .local v11, "items":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Lcom/android/providers/contacts/t9/T9Item;>;"
    :try_start_0
    sget-object v12, Lcom/android/providers/contacts/t9/T9Utils;->sContext:Landroid/content/Context;

    invoke-virtual {v12}, Landroid/content/Context;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v0

    sget-object v1, Lmiui/yellowpage/YellowPageContract$T9Lookup;->CONTENT_URI:Landroid/net/Uri;

    sget-object v2, Lcom/android/providers/contacts/T9SearchSupport$YPItemQuery;->PROJECTION:[Ljava/lang/String;

    const/4 v3, 0x0

    const/4 v4, 0x0

    const/4 v5, 0x0

    invoke-virtual/range {v0 .. v5}, Landroid/content/ContentResolver;->query(Landroid/net/Uri;[Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;)Landroid/database/Cursor;

    move-result-object v8

    .line 39
    :cond_0
    :goto_0
    invoke-interface {v8}, Landroid/database/Cursor;->moveToNext()Z

    move-result v12

    if-eqz v12, :cond_2

    .line 40
    const/4 v12, 0x0

    invoke-interface {v8, v12}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v2

    .line 41
    .local v2, "number":Ljava/lang/String;
    const/4 v12, 0x1

    invoke-interface {v8, v12}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v3

    .line 42
    .local v3, "displayName":Ljava/lang/String;
    const/4 v12, 0x2

    invoke-interface {v8, v12}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v5

    .line 43
    .local v5, "pinyin":Ljava/lang/String;
    const/4 v12, 0x4

    invoke-interface {v8, v12}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v4

    .line 44
    .local v4, "phoneTag":Ljava/lang/String;
    const/4 v12, 0x3

    invoke-interface {v8, v12}, Landroid/database/Cursor;->getLong(I)J

    move-result-wide v0

    .line 45
    .local v0, "yId":J
    const/4 v12, 0x5

    invoke-interface {v8, v12}, Landroid/database/Cursor;->getLong(I)J

    move-result-wide v6

    .line 46
    .local v6, "t9Rank":J
    invoke-static/range {v0 .. v7}, Lcom/android/providers/contacts/t9/T9Builder;->buildOneYellowPageT9Item(JLjava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;J)Lcom/android/providers/contacts/t9/T9Item;

    move-result-object v10

    .line 48
    .local v10, "item":Lcom/android/providers/contacts/t9/T9Item;
    if-eqz v10, :cond_0

    .line 49
    invoke-virtual {v11, v10}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z
    :try_end_0
    .catch Ljava/lang/RuntimeException; {:try_start_0 .. :try_end_0} :catch_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    goto :goto_0

    .line 52
    .end local v0    # "yId":J
    .end local v2    # "number":Ljava/lang/String;
    .end local v3    # "displayName":Ljava/lang/String;
    .end local v4    # "phoneTag":Ljava/lang/String;
    .end local v5    # "pinyin":Ljava/lang/String;
    .end local v6    # "t9Rank":J
    .end local v10    # "item":Lcom/android/providers/contacts/t9/T9Item;
    :catch_0
    move-exception v9

    .line 53
    .local v9, "e":Ljava/lang/RuntimeException;
    :try_start_1
    const-string v12, "failed to query SP database"

    invoke-static {v12, v9}, Lcom/android/providers/contacts/t9/T9Utils;->loge(Ljava/lang/String;Ljava/lang/Throwable;)V
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 55
    if-eqz v8, :cond_1

    .line 56
    invoke-interface {v8}, Landroid/database/Cursor;->close()V

    .line 59
    .end local v9    # "e":Ljava/lang/RuntimeException;
    :cond_1
    :goto_1
    return-object v11

    .line 55
    :cond_2
    if-eqz v8, :cond_1

    .line 56
    invoke-interface {v8}, Landroid/database/Cursor;->close()V

    goto :goto_1

    .line 55
    :catchall_0
    move-exception v12

    if-eqz v8, :cond_3

    .line 56
    invoke-interface {v8}, Landroid/database/Cursor;->close()V

    :cond_3
    throw v12
.end method

.method private static convertNameToT9Key(Ljava/lang/String;)Ljava/lang/String;
    .locals 8
    .param p0, "name"    # Ljava/lang/String;

    .prologue
    const/16 v7, 0x3b

    .line 322
    invoke-static {}, Lcom/android/providers/contacts/t9/T9Utils;->getReusableStringBuilder()Ljava/lang/StringBuilder;

    move-result-object v0

    .line 323
    .local v0, "builder":Ljava/lang/StringBuilder;
    const/16 v4, 0x20

    .line 324
    .local v4, "pc":C
    const/4 v3, 0x0

    .local v3, "i":I
    :goto_0
    invoke-virtual {p0}, Ljava/lang/String;->length()I

    move-result v6

    if-ge v3, v6, :cond_6

    .line 325
    invoke-virtual {p0, v3}, Ljava/lang/String;->charAt(I)C

    move-result v1

    .line 326
    .local v1, "c":C
    if-ne v1, v7, :cond_0

    .line 327
    invoke-virtual {v0, v7}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 324
    :goto_1
    add-int/lit8 v3, v3, 0x1

    goto :goto_0

    .line 330
    :cond_0
    invoke-static {v1}, Lcom/android/providers/contacts/t9/T9miuipro;->formatCharToT9(C)C

    move-result v2

    .line 331
    .local v2, "digit":C
    if-nez v2, :cond_2

    .line 333
    const/16 v2, 0x20

    .line 342
    :cond_1
    :goto_2
    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 343
    move v4, v1

    goto :goto_1

    .line 334
    :cond_2
    invoke-static {v1}, Ljava/lang/Character;->isUpperCase(C)Z

    move-result v6

    if-nez v6, :cond_3

    if-eqz v3, :cond_3

    invoke-static {v1}, Ljava/lang/Character;->isLetter(C)Z

    move-result v6

    if-eqz v6, :cond_4

    invoke-static {v4}, Ljava/lang/Character;->isLetter(C)Z

    move-result v6

    if-nez v6, :cond_4

    .line 336
    :cond_3
    invoke-static {v2}, Lcom/android/providers/contacts/t9/T9Utils;->converDigitToInitial(C)C

    move-result v2

    goto :goto_2

    .line 337
    :cond_4
    invoke-static {v1}, Ljava/lang/Character;->isDigit(C)Z

    move-result v6

    if-eqz v6, :cond_5

    invoke-static {v4}, Ljava/lang/Character;->isDigit(C)Z

    move-result v6

    if-nez v6, :cond_5

    .line 338
    invoke-static {v2}, Lcom/android/providers/contacts/t9/T9Utils;->converDigitToInitial(C)C

    move-result v2

    goto :goto_2

    .line 339
    :cond_5
    invoke-static {v1}, Lcom/android/providers/contacts/t9/T9Utils;->isValidT9Key(C)Z

    move-result v6

    if-eqz v6, :cond_1

    .line 340
    invoke-static {v2}, Lcom/android/providers/contacts/t9/T9Utils;->converDigitToInitial(C)C

    move-result v2

    goto :goto_2

    .line 345
    .end local v1    # "c":C
    .end local v2    # "digit":C
    :cond_6
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    .line 346
    .local v5, "ret":Ljava/lang/String;
    invoke-static {v0}, Lcom/android/providers/contacts/t9/T9Utils;->recyle(Ljava/lang/StringBuilder;)V

    .line 347
    return-object v5
.end method

.method private static convertNameToT9Key([Ljava/lang/String;)Ljava/lang/String;
    .locals 7
    .param p0, "tokens"    # [Ljava/lang/String;

    .prologue
    .line 352
    invoke-static {}, Lcom/android/providers/contacts/t9/T9Utils;->getReusableStringBuilder()Ljava/lang/StringBuilder;

    move-result-object v1

    .line 353
    .local v1, "builder":Ljava/lang/StringBuilder;
    move-object v0, p0

    .local v0, "arr$":[Ljava/lang/String;
    array-length v3, v0

    .local v3, "len$":I
    const/4 v2, 0x0

    .local v2, "i$":I
    :goto_0
    if-ge v2, v3, :cond_0

    aget-object v5, v0, v2

    .line 354
    .local v5, "token":Ljava/lang/String;
    invoke-static {v5}, Lcom/android/providers/contacts/t9/T9Builder;->convertNameToT9Key(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v1, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 353
    add-int/lit8 v2, v2, 0x1

    goto :goto_0

    .line 356
    .end local v5    # "token":Ljava/lang/String;
    :cond_0
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    .line 357
    .local v4, "ret":Ljava/lang/String;
    invoke-static {v1}, Lcom/android/providers/contacts/t9/T9Utils;->recyle(Ljava/lang/StringBuilder;)V

    .line 358
    return-object v4
.end method

.method private static extendCandidates(Ljava/util/ArrayList;I)I
    .locals 5
    .param p1, "times"    # I
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/ArrayList",
            "<[",
            "Ljava/lang/String;",
            ">;I)I"
        }
    .end annotation

    .prologue
    .line 440
    .local p0, "candidates":Ljava/util/ArrayList;, "Ljava/util/ArrayList<[Ljava/lang/String;>;"
    invoke-virtual {p0}, Ljava/util/ArrayList;->size()I

    move-result v0

    .line 441
    .local v0, "curSize":I
    const/4 v1, 0x1

    .local v1, "i":I
    :goto_0
    if-ge v1, p1, :cond_2

    .line 442
    const/4 v2, 0x0

    .local v2, "j":I
    :goto_1
    if-ge v2, v0, :cond_1

    .line 443
    invoke-virtual {p0, v2}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, [Ljava/lang/String;

    invoke-virtual {v3}, [Ljava/lang/String;->clone()Ljava/lang/Object;

    move-result-object v3

    invoke-virtual {p0, v3}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 444
    invoke-virtual {p0}, Ljava/util/ArrayList;->size()I

    move-result v3

    const/16 v4, 0x2da

    if-lt v3, v4, :cond_0

    .line 446
    const/4 v3, 0x2

    .line 450
    .end local v2    # "j":I
    :goto_2
    return v3

    .line 442
    .restart local v2    # "j":I
    :cond_0
    add-int/lit8 v2, v2, 0x1

    goto :goto_1

    .line 441
    :cond_1
    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    .line 450
    .end local v2    # "j":I
    :cond_2
    const/4 v3, 0x0

    goto :goto_2
.end method

.method private static fillCandidate(Ljava/util/ArrayList;Ljava/util/ArrayList;ILjava/lang/Boolean;)V
    .locals 9
    .param p2, "index"    # I
    .param p3, "fillBack"    # Ljava/lang/Boolean;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/ArrayList",
            "<[",
            "Ljava/lang/String;",
            ">;",
            "Ljava/util/ArrayList",
            "<",
            "Lmiui/text/ChinesePinyinConverter$Token;",
            ">;I",
            "Ljava/lang/Boolean;",
            ")V"
        }
    .end annotation

    .prologue
    .local p0, "candidates":Ljava/util/ArrayList;, "Ljava/util/ArrayList<[Ljava/lang/String;>;"
    .local p1, "tokens":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Lmiui/text/ChinesePinyinConverter$Token;>;"
    const/4 v8, 0x1

    const/4 v7, 0x0

    .line 528
    invoke-virtual {p3}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v5

    if-eqz v5, :cond_1

    .line 529
    invoke-virtual {p1}, Ljava/util/ArrayList;->size()I

    move-result v5

    sub-int v1, v5, p2

    .line 533
    .local v1, "indexTo":I
    :goto_0
    add-int/lit8 v0, p2, 0x1

    .local v0, "i":I
    :goto_1
    if-ge v0, v1, :cond_3

    .line 534
    invoke-virtual {p1, v0}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Lmiui/text/ChinesePinyinConverter$Token;

    .line 535
    .local v3, "t":Lmiui/text/ChinesePinyinConverter$Token;
    iget v5, v3, Lmiui/text/ChinesePinyinConverter$Token;->type:I

    packed-switch v5, :pswitch_data_0

    .line 533
    :cond_0
    add-int/lit8 v0, v0, 0x1

    goto :goto_1

    .line 531
    .end local v0    # "i":I
    .end local v1    # "indexTo":I
    .end local v3    # "t":Lmiui/text/ChinesePinyinConverter$Token;
    :cond_1
    invoke-virtual {p1}, Ljava/util/ArrayList;->size()I

    move-result v5

    sub-int/2addr v5, p2

    add-int/lit8 v1, v5, -0x1

    .restart local v1    # "indexTo":I
    goto :goto_0

    .line 537
    .restart local v0    # "i":I
    .restart local v3    # "t":Lmiui/text/ChinesePinyinConverter$Token;
    :pswitch_0
    invoke-virtual {p1, v0}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Lmiui/text/ChinesePinyinConverter$Token;

    iget-object v5, v5, Lmiui/text/ChinesePinyinConverter$Token;->polyPhones:[Ljava/lang/String;

    aget-object v4, v5, v7

    .line 538
    .local v4, "tokenTarget":Ljava/lang/String;
    invoke-virtual {v4}, Ljava/lang/String;->length()I

    move-result v5

    if-le v5, v8, :cond_2

    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v4, v7}, Ljava/lang/String;->charAt(I)C

    move-result v6

    invoke-static {v6}, Ljava/lang/Character;->toUpperCase(C)C

    move-result v6

    invoke-static {v6}, Ljava/lang/String;->valueOf(C)Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v4, v8}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/String;->toLowerCase()Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    .line 542
    :goto_2
    const/4 v2, 0x0

    .local v2, "j":I
    :goto_3
    invoke-virtual {p0}, Ljava/util/ArrayList;->size()I

    move-result v5

    if-ge v2, v5, :cond_0

    .line 543
    invoke-virtual {p0, v2}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v5

    check-cast v5, [Ljava/lang/String;

    aput-object v4, v5, v0

    .line 542
    add-int/lit8 v2, v2, 0x1

    goto :goto_3

    .line 538
    .end local v2    # "j":I
    :cond_2
    invoke-virtual {v4, v7}, Ljava/lang/String;->charAt(I)C

    move-result v5

    invoke-static {v5}, Ljava/lang/Character;->toUpperCase(C)C

    move-result v5

    invoke-static {v5}, Ljava/lang/String;->valueOf(C)Ljava/lang/String;

    move-result-object v4

    goto :goto_2

    .line 547
    .end local v4    # "tokenTarget":Ljava/lang/String;
    :pswitch_1
    const/4 v2, 0x0

    .restart local v2    # "j":I
    :goto_4
    invoke-virtual {p0}, Ljava/util/ArrayList;->size()I

    move-result v5

    if-ge v2, v5, :cond_0

    .line 548
    invoke-virtual {p0, v2}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v5

    check-cast v5, [Ljava/lang/String;

    iget-object v6, v3, Lmiui/text/ChinesePinyinConverter$Token;->target:Ljava/lang/String;

    aput-object v6, v5, v0

    .line 547
    add-int/lit8 v2, v2, 0x1

    goto :goto_4

    .line 553
    .end local v2    # "j":I
    .end local v3    # "t":Lmiui/text/ChinesePinyinConverter$Token;
    :cond_3
    return-void

    .line 535
    nop

    :pswitch_data_0
    .packed-switch 0x1
        :pswitch_1
        :pswitch_0
    .end packed-switch
.end method

.method private static filterNonLetterAndDigit(Ljava/lang/String;)Ljava/lang/String;
    .locals 6
    .param p0, "input"    # Ljava/lang/String;

    .prologue
    .line 394
    invoke-static {}, Lcom/android/providers/contacts/t9/T9Utils;->getReusableStringBuilder()Ljava/lang/StringBuilder;

    move-result-object v0

    .line 395
    .local v0, "builder":Ljava/lang/StringBuilder;
    const/4 v5, 0x0

    invoke-virtual {v0, v5}, Ljava/lang/StringBuilder;->setLength(I)V

    .line 396
    const/4 v2, 0x1

    .line 397
    .local v2, "firstLetter":Z
    const/4 v3, 0x0

    .local v3, "i":I
    :goto_0
    invoke-virtual {p0}, Ljava/lang/String;->length()I

    move-result v5

    if-ge v3, v5, :cond_4

    .line 398
    invoke-virtual {p0, v3}, Ljava/lang/String;->charAt(I)C

    move-result v1

    .line 399
    .local v1, "c":C
    invoke-static {v1}, Ljava/lang/Character;->isLetter(C)Z

    move-result v5

    if-eqz v5, :cond_1

    .line 400
    if-eqz v2, :cond_0

    invoke-static {v1}, Ljava/lang/Character;->toUpperCase(C)C

    move-result v1

    .end local v1    # "c":C
    :cond_0
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 401
    const/4 v2, 0x0

    .line 397
    :goto_1
    add-int/lit8 v3, v3, 0x1

    goto :goto_0

    .line 402
    .restart local v1    # "c":C
    :cond_1
    invoke-static {v1}, Ljava/lang/Character;->isDigit(C)Z

    move-result v5

    if-eqz v5, :cond_2

    .line 403
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 404
    const/4 v2, 0x1

    goto :goto_1

    .line 405
    :cond_2
    invoke-static {v1}, Lcom/android/providers/contacts/t9/T9Utils;->isValidT9Key(C)Z

    move-result v5

    if-eqz v5, :cond_3

    .line 406
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 407
    const/4 v2, 0x1

    goto :goto_1

    .line 409
    :cond_3
    const/16 v5, 0x20

    invoke-virtual {v0, v5}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 410
    const/4 v2, 0x1

    goto :goto_1

    .line 413
    .end local v1    # "c":C
    :cond_4
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    .line 414
    .local v4, "ret":Ljava/lang/String;
    invoke-static {v0}, Lcom/android/providers/contacts/t9/T9Utils;->recyle(Ljava/lang/StringBuilder;)V

    .line 415
    return-object v4
.end method

.method private static filterNonPinyinAndZhuyin(Ljava/lang/String;)Ljava/lang/String;
    .locals 5
    .param p0, "input"    # Ljava/lang/String;

    .prologue
    .line 419
    invoke-static {}, Lcom/android/providers/contacts/t9/T9Utils;->getReusableStringBuilder()Ljava/lang/StringBuilder;

    move-result-object v0

    .line 420
    .local v0, "builder":Ljava/lang/StringBuilder;
    const/4 v4, 0x0

    invoke-virtual {v0, v4}, Ljava/lang/StringBuilder;->setLength(I)V

    .line 421
    const/4 v2, 0x0

    .local v2, "i":I
    :goto_0
    invoke-virtual {p0}, Ljava/lang/String;->length()I

    move-result v4

    if-ge v2, v4, :cond_1

    .line 422
    invoke-virtual {p0, v2}, Ljava/lang/String;->charAt(I)C

    move-result v1

    .line 423
    .local v1, "c":C
    invoke-static {v1}, Lcom/android/providers/contacts/t9/T9miuipro;->formatCharToT9(C)C

    move-result v4

    if-eqz v4, :cond_0

    .line 424
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 421
    :cond_0
    add-int/lit8 v2, v2, 0x1

    goto :goto_0

    .line 427
    .end local v1    # "c":C
    :cond_1
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    .line 428
    .local v3, "ret":Ljava/lang/String;
    invoke-static {v0}, Lcom/android/providers/contacts/t9/T9Utils;->recyle(Ljava/lang/StringBuilder;)V

    .line 429
    return-object v3
.end method

.method private static joinName([Ljava/lang/String;)Ljava/lang/String;
    .locals 6
    .param p0, "tokens"    # [Ljava/lang/String;

    .prologue
    .line 362
    invoke-static {}, Lcom/android/providers/contacts/t9/T9Utils;->getReusableStringBuilder()Ljava/lang/StringBuilder;

    move-result-object v1

    .line 363
    .local v1, "builder":Ljava/lang/StringBuilder;
    move-object v0, p0

    .local v0, "arr$":[Ljava/lang/String;
    array-length v3, v0

    .local v3, "len$":I
    const/4 v2, 0x0

    .local v2, "i$":I
    :goto_0
    if-ge v2, v3, :cond_0

    aget-object v5, v0, v2

    .line 364
    .local v5, "token":Ljava/lang/String;
    invoke-virtual {v1, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 363
    add-int/lit8 v2, v2, 0x1

    goto :goto_0

    .line 366
    .end local v5    # "token":Ljava/lang/String;
    :cond_0
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    .line 367
    .local v4, "ret":Ljava/lang/String;
    invoke-static {v1}, Lcom/android/providers/contacts/t9/T9Utils;->recyle(Ljava/lang/StringBuilder;)V

    .line 368
    return-object v4
.end method

.method private static normalizeData(Ljava/lang/String;J)Ljava/lang/String;
    .locals 3
    .param p0, "number"    # Ljava/lang/String;
    .param p1, "mimeTypeId"    # J

    .prologue
    .line 380
    invoke-static {}, Lcom/android/providers/contacts/T9SearchSupport;->getInstance()Lcom/android/providers/contacts/T9SearchSupport;

    move-result-object v1

    invoke-virtual {v1}, Lcom/android/providers/contacts/T9SearchSupport;->getSipMimeTypeId()J

    move-result-wide v1

    cmp-long v1, v1, p1

    if-nez v1, :cond_0

    const/4 v0, 0x3

    .line 382
    .local v0, "phoneType":I
    :goto_0
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    invoke-static {p0, v0}, Lmiui/telephony/PhoneNumberUtils;->extractNetworkPortion(Ljava/lang/String;I)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-static {p0}, Lmiui/telephony/PhoneNumberUtils;->extractPostDialPortion(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    return-object v1

    .line 380
    .end local v0    # "phoneType":I
    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method
