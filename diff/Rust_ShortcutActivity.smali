.class public Lbin/mt/plus/ShortcutActivity;
.super Ll/ۗۢ;
.source "ShortcutActivity.java"

.field public static Lbin/mt/plus/ShortcutActivity;->ۘۖ:Ljava/lang/Boolean;
.field private static final Lbin/mt/plus/ShortcutActivity;->۠ܶۧ:[S
.field public static final Lbin/mt/plus/ShortcutActivity;->ܽۖ:Ll/۠᩺۟;

.method public static constructor Lbin/mt/plus/ShortcutActivity;-><clinit>()V
    .registers 21
    const/16 v0, 0x184
    new-array v0, v0, [S
    fill-array-data v0, :cond_2e6
    sput-object v0, Lbin/mt/plus/ShortcutActivity;->۠ܶۧ:[S
    const/4 v0, 0x0
    const/4 v1, 0x0
    const/4 v2, 0x0
    const/4 v3, 0x0
    const/4 v4, 0x0
    const/4 v5, 0x0
    const/4 v6, 0x0
    const/4 v7, 0x0
    const/4 v8, 0x0
    const/4 v9, 0x0
    const/4 v10, 0x0
    const/4 v11, 0x0
    const/4 v12, 0x0
    const/4 v13, 0x0
    sget v14, Ll/ܳܺ;->۫ܿ᩵:I
    sget v15, Ll/ܽۛ;->۠ܺ۟:I
    const-string v16, "ۛۖۙ"
    invoke-static/range {v16 .. v16}, Ll/ۙۘ;->ۙᩴ۫(Ljava/lang/Object;)I
    move-result v16
    xor-int v16, v16, v14
    :goto_23
    sparse-switch v16, :cond_29c
    move-object/from16 v16, v0
    move-object/from16 v17, v1
    move/from16 v18, v2
    const v0, 0x9b80
    const v10, 0x9b80
    goto/16 :goto_293
    .line 265
    invoke-static {}, Ll/ᩴ᩵;->ۡۨܶ()Z
    sget v16, Ll/ܽ᩵;->᩻ۗ֨:I
    if-gez v16, :cond_6c
    move-object/from16 v16, v0
    move-object/from16 v17, v1
    move/from16 v18, v2
    goto/16 :goto_214
    .line 268
    sget-object v16, Lbin/mt/plus/ShortcutActivity;->۠ܶۧ:[S
    invoke-static {}, Ll/᩹;->ۖ᩷֫()I
    move-result v17
    if-eqz v17, :cond_53
    move-object/from16 v16, v0
    move-object/from16 v17, v1
    move/from16 v18, v2
    goto/16 :goto_1ec
    :cond_53
    const-string v1, "۠᩶ۧ"
    invoke-static {v1}, Ll/ۤ֨;->۬ۚᩴ(Ljava/lang/Object;)I
    move-result v1
    xor-int/2addr v1, v15
    const/4 v2, 0x0
    move-object/from16 v20, v16
    move-object/from16 v16, v0
    move v0, v1
    move-object/from16 v1, v20
    goto/16 :goto_28b
    .line 267
    aget-short v16, v1, v2
    .line 268
    invoke-static {}, Ll/ᩴ;->ۙ֨ᩴ()I
    move-result v17
    if-eqz v17, :cond_71
    :cond_6c
    move-object/from16 v17, v1
    move/from16 v18, v2
    goto :goto_a6
    :cond_71
    const-string v3, "۠ܿ᩷"
    move-object/from16 v17, v1
    const/4 v1, 0x1
    invoke-static {v3, v1}, Ll/ۡ۫;->۠ۢ᩶(Ljava/lang/Object;I)C
    move-result v1
    move/from16 v18, v2
    const/4 v2, 0x2
    invoke-static {v3, v2}, Ll/ۡ۫;->۠ۢ᩶(Ljava/lang/Object;I)C
    move-result v2
    mul-int v1, v1, v2
    xor-int/2addr v1, v14
    const/4 v2, 0x0
    invoke-static {v3, v2}, Ll/ۡ۫;->۠ۢ᩶(Ljava/lang/Object;I)C
    move-result v2
    add-int/2addr v2, v1
    move/from16 v3, v16
    move-object/from16 v1, v17
    move-object/from16 v16, v0
    move v0, v2
    goto/16 :goto_289
    .line 265
    invoke-static {v11, v12, v13, v10}, Ll/ܰۡ;->ܳۧۤ([SIII)Ljava/lang/String;
    move-result-object v1
    invoke-static {v0, v1}, Ll/᩻᩺;->ܺۖܰ(Ljava/lang/Object;Ljava/lang/Object;)Ll/۠᩺۟;
    move-result-object v0
    sput-object v0, Lbin/mt/plus/ShortcutActivity;->ܽۖ:Ll/۠᩺۟;
    return-void
    move-object/from16 v17, v1
    move/from16 v18, v2
    .line 268
    sget v1, Ll/ۗ۬;->᩵᩻ܽ:I
    if-ltz v1, :cond_be
    :goto_a6
    const-string v1, "ۡ۫ܰ"
    const/4 v2, 0x1
    invoke-static {v1, v2}, Ll/ܽ᩵;->ᩳ᩹֨(Ljava/lang/Object;I)C
    move-result v2
    xor-int/2addr v2, v14
    move-object/from16 v16, v0
    const/4 v0, 0x0
    invoke-static {v1, v0}, Ll/ۡ۫;->۠ۢ᩶(Ljava/lang/Object;I)C
    move-result v0
    mul-int v2, v2, v0
    const/4 v0, 0x2
    invoke-static {v1, v0}, Ll/ܽ᩵;->ᩳ᩹֨(Ljava/lang/Object;I)C
    move-result v0
    goto/16 :goto_229
    :cond_be
    move-object/from16 v16, v0
    const-string v0, "ۚۗۢ"
    invoke-static {v0}, Ll/ۙۘ;->ۙᩴ۫(Ljava/lang/Object;)I
    move-result v0
    xor-int/2addr v0, v15
    goto/16 :goto_1a8
    move-object/from16 v16, v0
    move-object/from16 v17, v1
    move/from16 v18, v2
    .line 265
    sget-object v0, Ll/۫᩺۟;->۟:Ll/۠᩺۟;
    sget-object v1, Lbin/mt/plus/ShortcutActivity;->۠ܶۧ:[S
    .line 268
    invoke-static {}, Ll/֨ۖ;->ۤᩴۤ()Z
    move-result v2
    if-eqz v2, :cond_db
    goto/16 :goto_201
    :cond_db
    const-string/jumbo v2, "᩸᩷ᩳ"
    const/4 v11, 0x1
    invoke-static {v2, v11}, Ll/ܽ᩵;->ᩳ᩹֨(Ljava/lang/Object;I)C
    move-result v11
    xor-int/2addr v11, v15
    move-object/from16 v19, v0
    const/4 v0, 0x0
    invoke-static {v2, v0}, Ll/ܽ᩵;->ᩳ᩹֨(Ljava/lang/Object;I)C
    move-result v0
    mul-int v11, v11, v0
    const/4 v0, 0x2
    invoke-static {v2, v0}, Ll/ۡ۫;->۠ۢ᩶(Ljava/lang/Object;I)C
    move-result v0
    sub-int v16, v11, v0
    move-object v11, v1
    move-object/from16 v1, v17
    move/from16 v2, v18
    move-object/from16 v0, v19
    goto/16 :goto_23
    move-object/from16 v16, v0
    move-object/from16 v17, v1
    move/from16 v18, v2
    mul-int v0, v3, v4
    .line 266
    invoke-static {}, Ll/᩻᩷;->ܺ᩻᩺()I
    move-result v1
    if-ltz v1, :cond_10d
    goto/16 :goto_25a
    :cond_10d
    const-string v1, "᩷۠᩵"
    const/4 v2, 0x1
    invoke-static {v1, v2}, Ll/ۡ۫;->۠ۢ᩶(Ljava/lang/Object;I)C
    move-result v2
    xor-int/2addr v2, v15
    const/4 v5, 0x0
    invoke-static {v1, v5}, Ll/ۡ۫;->۠ۢ᩶(Ljava/lang/Object;I)C
    move-result v5
    mul-int v2, v2, v5
    const/4 v5, 0x2
    invoke-static {v1, v5}, Ll/ۡ۫;->۠ۢ᩶(Ljava/lang/Object;I)C
    move-result v1
    sub-int/2addr v2, v1
    const/4 v1, 0x1
    move v5, v0
    move v0, v2
    move-object/from16 v1, v17
    move/from16 v2, v18
    const/4 v6, 0x1
    goto/16 :goto_28b
    move-object/from16 v16, v0
    move-object/from16 v17, v1
    move/from16 v18, v2
    sget v0, Ll/ܽۛ;->۠ܺ۟:I
    if-ltz v0, :cond_138
    goto/16 :goto_1ec
    :cond_138
    const-string v0, "ۨۖ֡"
    invoke-static {v0}, Ll/ۤ֨;->۬ۚᩴ(Ljava/lang/Object;)I
    move-result v0
    xor-int/2addr v0, v15
    const/16 v13, 0x9
    goto/16 :goto_287
    move-object/from16 v16, v0
    move-object/from16 v17, v1
    move/from16 v18, v2
    add-int v0, v5, v6
    sget-boolean v1, Ll/ۛܶ;->ۙ᩵᩶:Z
    if-nez v1, :cond_151
    goto/16 :goto_214
    :cond_151
    const-string/jumbo v1, "᩻᩶᩶"
    const/4 v2, 0x0
    invoke-static {v1, v2}, Ll/ۡ۫;->۠ۢ᩶(Ljava/lang/Object;I)C
    move-result v2
    mul-int/lit16 v2, v2, 0x3c1
    const/4 v7, 0x1
    invoke-static {v1, v7}, Ll/ܽ᩵;->ᩳ᩹֨(Ljava/lang/Object;I)C
    move-result v7
    mul-int/lit8 v7, v7, 0x1f
    add-int/2addr v2, v7
    xor-int/2addr v2, v15
    const/4 v7, 0x2
    invoke-static {v1, v7}, Ll/ۡ۫;->۠ۢ᩶(Ljava/lang/Object;I)C
    move-result v1
    add-int/2addr v1, v2
    const/4 v2, 0x1
    move v7, v0
    move v0, v1
    move-object/from16 v1, v17
    move/from16 v2, v18
    const/4 v8, 0x1
    goto/16 :goto_28b
    move-object/from16 v16, v0
    move-object/from16 v17, v1
    move/from16 v18, v2
    const v0, 0xf14c
    const v10, 0xf14c
    goto/16 :goto_293
    move-object/from16 v16, v0
    move-object/from16 v17, v1
    move/from16 v18, v2
    add-int v0, v3, v8
    .line 268
    invoke-static {}, Ll/֨֡;->ۘ۠ۘ()I
    move-result v1
    if-ltz v1, :cond_191
    goto :goto_1ec
    :cond_191
    const-string v1, "ۨ۫ܺ"
    const/4 v2, 0x1
    invoke-static {v1, v2}, Ll/ۡ۫;->۠ۢ᩶(Ljava/lang/Object;I)C
    move-result v2
    xor-int/2addr v2, v14
    const/4 v9, 0x0
    invoke-static {v1, v9}, Ll/ۡ۫;->۠ۢ᩶(Ljava/lang/Object;I)C
    move-result v9
    mul-int v2, v2, v9
    const/4 v9, 0x2
    invoke-static {v1, v9}, Ll/ۡ۫;->۠ۢ᩶(Ljava/lang/Object;I)C
    move-result v1
    sub-int/2addr v2, v1
    move v9, v0
    move v0, v2
    :goto_1a8
    move-object/from16 v1, v17
    goto/16 :goto_289
    move-object/from16 v16, v0
    move-object/from16 v17, v1
    move/from16 v18, v2
    .line 265
    invoke-static {}, Ll/ܽۘ;->᩻ۙܰ()Z
    goto :goto_214
    move-object/from16 v16, v0
    move-object/from16 v17, v1
    move/from16 v18, v2
    sget v0, Ll/ۤۛ;->᩺᩻ۘ:I
    if-gez v0, :goto_1ec
    goto :goto_214
    move-object/from16 v16, v0
    move-object/from16 v17, v1
    move/from16 v18, v2
    mul-int v0, v9, v9
    sub-int/2addr v0, v7
    if-gez v0, :cond_1dd
    const-string v0, "ۢ᩶ܶ"
    const/4 v1, 0x1
    .line 268
    invoke-static {v0, v1}, Ll/ܽ᩵;->ᩳ᩹֨(Ljava/lang/Object;I)C
    move-result v1
    const/4 v2, 0x2
    invoke-static {v0, v2}, Ll/ܽ᩵;->ᩳ᩹֨(Ljava/lang/Object;I)C
    move-result v2
    mul-int v1, v1, v2
    xor-int/2addr v1, v15
    goto/16 :goto_269
    :cond_1dd
    const-string/jumbo v0, "᩺ۢܶ"
    goto/16 :goto_295
    move-object/from16 v16, v0
    move-object/from16 v17, v1
    move/from16 v18, v2
    .line 265
    sget v0, Ll/ۚۙ;->ܽ۟֡:I
    if-lez v0, :goto_201
    :goto_1ec
    const-string/jumbo v0, "᩻᩵ܽ"
    const/4 v1, 0x0
    .line 268
    invoke-static {v0, v1}, Ll/ܽ᩵;->ᩳ᩹֨(Ljava/lang/Object;I)C
    move-result v1
    mul-int/lit16 v1, v1, 0x3c1
    const/4 v2, 0x1
    invoke-static {v0, v2}, Ll/ۡ۫;->۠ۢ᩶(Ljava/lang/Object;I)C
    move-result v2
    mul-int/lit8 v2, v2, 0x1f
    add-int/2addr v1, v2
    xor-int/2addr v1, v15
    const/4 v2, 0x2
    goto :goto_26a
    :goto_201
    const-string v0, "֨ۖ֡"
    const/4 v1, 0x1
    invoke-static {v0, v1}, Ll/ܽ᩵;->ᩳ᩹֨(Ljava/lang/Object;I)C
    move-result v1
    xor-int/2addr v1, v15
    goto :goto_21d
    move-object/from16 v16, v0
    move-object/from16 v17, v1
    move/from16 v18, v2
    .line 267
    sget v0, Ll/ۙۘ;->ۖۢۙ:I
    if-eqz v0, :cond_22d
    :goto_214
    const-string/jumbo v0, "᩻ۖ֨"
    const/4 v1, 0x1
    invoke-static {v0, v1}, Ll/ۡ۫;->۠ۢ᩶(Ljava/lang/Object;I)C
    move-result v1
    xor-int/2addr v1, v14
    :goto_21d
    const/4 v2, 0x0
    invoke-static {v0, v2}, Ll/ܽ᩵;->ᩳ᩹֨(Ljava/lang/Object;I)C
    move-result v2
    mul-int v2, v2, v1
    const/4 v1, 0x2
    invoke-static {v0, v1}, Ll/ۡ۫;->۠ۢ᩶(Ljava/lang/Object;I)C
    move-result v0
    :goto_229
    sub-int v0, v2, v0
    goto/16 :goto_1a8
    :cond_22d
    const-string v0, "۟ۗۖ"
    const/4 v1, 0x1
    invoke-static {v0, v1}, Ll/ۡ۫;->۠ۢ᩶(Ljava/lang/Object;I)C
    move-result v1
    const/4 v2, 0x2
    invoke-static {v0, v2}, Ll/ܽ᩵;->ᩳ᩹֨(Ljava/lang/Object;I)C
    move-result v2
    mul-int v1, v1, v2
    xor-int/2addr v1, v14
    const/4 v2, 0x0
    invoke-static {v0, v2}, Ll/ۡ۫;->۠ۢ᩶(Ljava/lang/Object;I)C
    move-result v0
    add-int/2addr v0, v1
    const/4 v4, 0x2
    goto :goto_287
    .line 265
    invoke-static {}, Ll/᩻᩺;->ۨ۠֡()I
    invoke-static {}, Ll/ۙۘ;->ۚۜۧ()I
    new-instance v0, Ljava/lang/RuntimeException;
    invoke-direct {v0}, Ljava/lang/RuntimeException;-><init>()V
    throw v0
    move-object/from16 v16, v0
    move-object/from16 v17, v1
    move/from16 v18, v2
    .line 267
    sget v0, Ll/ۗ۬;->᩵᩻ܽ:I
    if-ltz v0, :cond_271
    :goto_25a
    const-string v0, "ۧ֫᩶"
    const/4 v1, 0x1
    .line 266
    invoke-static {v0, v1}, Ll/ۡ۫;->۠ۢ᩶(Ljava/lang/Object;I)C
    move-result v1
    const/4 v2, 0x2
    invoke-static {v0, v2}, Ll/ܽ᩵;->ᩳ᩹֨(Ljava/lang/Object;I)C
    move-result v2
    mul-int v1, v1, v2
    xor-int/2addr v1, v14
    :goto_269
    const/4 v2, 0x0
    :goto_26a
    .line 268
    invoke-static {v0, v2}, Ll/ܽ᩵;->ᩳ᩹֨(Ljava/lang/Object;I)C
    move-result v0
    add-int/2addr v0, v1
    goto/16 :goto_1a8
    :cond_271
    const-string v0, "ܽۗ۠"
    const/4 v1, 0x1
    .line 267
    invoke-static {v0, v1}, Ll/ܽ᩵;->ᩳ᩹֨(Ljava/lang/Object;I)C
    move-result v1
    const/4 v2, 0x2
    invoke-static {v0, v2}, Ll/ܽ᩵;->ᩳ᩹֨(Ljava/lang/Object;I)C
    move-result v2
    mul-int v1, v1, v2
    xor-int/2addr v1, v14
    const/4 v2, 0x0
    invoke-static {v0, v2}, Ll/ܽ᩵;->ᩳ᩹֨(Ljava/lang/Object;I)C
    move-result v0
    add-int/2addr v0, v1
    const/4 v12, 0x1
    :goto_287
    move-object/from16 v1, v17
    :goto_289
    move/from16 v2, v18
    :goto_28b
    move-object/from16 v20, v16
    move/from16 v16, v0
    move-object/from16 v0, v20
    goto/16 :goto_23
    :goto_293
    const-string v0, "۠᩸֨"
    :goto_295
    .line 268
    invoke-static {v0}, Ll/ۙۘ;->ۙᩴ۫(Ljava/lang/Object;)I
    move-result v0
    xor-int/2addr v0, v14
    goto/16 :goto_1a8
    :cond_29c
    .sparse-switch
        -54079251 -> :cond_22d
        -33557498 -> :sswitch_221
        -12569323 -> :sswitch_1e7
        -9824363 -> :sswitch_1bf
        -8787042 -> :sswitch_19e
        -8752249 -> :sswitch_193
        -6723454 -> :sswitch_189
        -6717156 -> :sswitch_15f
        -6575374 -> :cond_151
        -6490448 -> :sswitch_120
        -3083367 -> :sswitch_109
        -3067227 -> :sswitch_da
        -1907860 -> :goto_a6
        -1904462 -> :sswitch_7b
        -1753904 -> :sswitch_70
        -1742362 -> :sswitch_41
        -1737566 -> :sswitch_20
        -1314777 -> :sswitch_11
    .end sparse-switch
    :cond_2e6
    .array-data 2
        0x0616
        0xf13f
        0xf124
        0xf123
        0xf13e
        0xf138
        0xf12f
        0xf139
        0xf138
        0xf13f
        0x059e
        0x75e8
        0x9379
        0x9d04
        0x001c
        0x0007
        0x0007
        0x0004
        0x0045
        0x0007
        0x0018
        0x000d
        0x001a
        0x0009
        0x001c
        0x0001
        0x0007
        0x0006
        0x001d
        0x0018
        0x000c
        0x0009
        0x001c
        0x000d
        0x0024
        0x0009
        0x000a
        0x000d
        0x0004
        0x0009
        0x000b
        0x000b
        0x000d
        0x0006
        0x001c
        0x002b
        0x0007
        0x0004
        0x0007
        0x001a
        0x0021
        0x000b
        0x0007
        0x0006
        0x000e
        0x0007
        0x0004
        0x000c
        0x000d
        0x001a
        0x002b
        0x0007
        0x0004
        0x0007
        0x001a
        0x0021
        0x000b
        0x0007
        0x0006
        0x963e
        0x6bb0
        0x9985
        0x6135
        0x80ed
        0x4f89
        0x0001
        0x001b
        0x002c
        0x0001
        0x001a
        0x0a61
        0xd71d
        0xd702
        0xd717
        0xd700
        0xd713
        0xd706
        0xd71b
        0xd71d
        0xd71c
        0xd702
        0xd713
        0xd706
        0xd71a
        0xd706
        0xd71d
        0xd71d
        0xd71e
        0xd75f
        0xd717
        0xd70a
        0xd706
        0xd700
        0xd713
        0xd711
        0xd706
        0xd75f
        0xd713
        0xd702
        0xd719
        0xd717
        0xd716
        0xd71b
        0xd706
        0xd75f
        0xd706
        0xd717
        0xd70a
        0xd706
        0xd71d
        0xd702
        0xd717
        0xd71c
        0xd75f
        0xd71c
        0xd701
        0xd71e
        0xd71d
        0xd711
        0xd713
        0xd706
        0xd717
        0xd75f
        0xd711
        0xd71e
        0xd71b
        0xd711
        0xd719
        0xd706
        0xd71d
        0xd71d
        0xd71e
        0xd75f
        0xd711
        0xd71d
        0xd71e
        0xd71d
        0xd700
        0xd75f
        0xd702
        0xd71b
        0xd711
        0xd719
        0xd717
        0xd700
        0xd71e
        0xd71d
        0xd711
        0xd713
        0xd706
        0xd717
        0xd706
        0xd71d
        0xd71d
        0xd71e
        0xd75f
        0xd706
        0xd717
        0xd700
        0xd71f
        0xd71b
        0xd71c
        0xd713
        0xd71e
        0xd706
        0xd71d
        0xd71d
        0xd71e
        0xd75f
        0xd701
        0xd71b
        0xd715
        0xd71c
        0xd713
        0xd706
        0xd707
        0xd700
        0xd717
        0xd75f
        0xd719
        0xd717
        0xd70b
        0xd706
        0xd71d
        0xd71d
        0xd71e
        0xd75f
        0xd713
        0xd711
        0xd706
        0xd71b
        0xd704
        0xd71b
        0xd706
        0xd70b
        0xd75f
        0xd700
        0xd717
        0xd711
        0xd71d
        0xd700
        0xd716
        0xd715
        0xd71d
        0xd706
        0xd71d
        0xd75f
        0xd71d
        0xd700
        0xd75f
        0xd71e
        0xd71d
        0xd711
        0xd713
        0xd706
        0xd717
        0xd706
        0xd71d
        0xd71d
        0xd71e
        0xd75f
        0xd702
        0xd71e
        0xd707
        0xd715
        0xd71b
        0xd71c
        0xd75f
        0xd71f
        0xd713
        0xd71c
        0xd713
        0xd715
        0xd717
        0xd715
        0xd71d
        0xd706
        0xd71d
        0xd706
        0xd71d
        0xd71d
        0xd71e
        0xd75f
        0xd701
        0xd71f
        0xd713
        0xd71e
        0xd71b
        0xd75f
        0xd703
        0xd707
        0xd717
        0xd700
        0xd70b
        0xd717
        0xd70a
        0xd717
        0xd711
        0xd75f
        0xd701
        0xd711
        0xd700
        0xd71b
        0xd702
        0xd706
        0xd706
        0xd71d
        0xd71d
        0xd71e
        0xd75f
        0xd706
        0xd707
        0xd706
        0xd71d
        0xd700
        0xd71b
        0xd713
        0xd71e
        0xd706
        0xd71d
        0xd71d
        0xd71e
        0xd75f
        0xd700
        0xd717
        0xd71f
        0xd71d
        0xd706
        0xd717
        0xd75f
        0xd71f
        0xd713
        0xd71c
        0xd713
        0xd715
        0xd717
        0xd706
        0xd71d
        0xd71d
        0xd71e
        0xd75f
        0xd700
        0xd717
        0xd711
        0xd70b
        0xd711
        0xd71e
        0xd717
        0xd75f
        0xd710
        0xd71b
        0xd71c
        0xd706
        0xd71d
        0xd71d
        0xd71e
        0xd75f
        0xd713
        0xd702
        0xd702
        0xd75f
        0xd702
        0xd700
        0xd71d
        0xd706
        0xd717
        0xd711
        0xd706
        0xd706
        0xd71d
        0xd71d
        0xd71e
        0xd75f
        0xd706
        0xd717
        0xd70a
        0xd706
        0xd75f
        0xd717
        0xd716
        0xd71b
        0xd706
        0xd71d
        0xd700
        0xd713
        0xd71c
        0xd716
        0xd700
        0xd71d
        0xd71b
        0xd716
        0xd75c
        0xd71b
        0xd71c
        0xd706
        0xd717
        0xd71c
        0xd706
        0xd75c
        0xd713
        0xd711
        0xd706
        0xd71b
        0xd71d
        0xd71c
        0xd75c
        0xd724
        0xd73b
        0xd737
        0xd725
        0xd701
        0xd71a
        0xd71d
        0xd700
        0xd706
        0xd711
        0xd707
        0xd706
    .end array-data
.end method

.method public constructor Lbin/mt/plus/ShortcutActivity;-><init>()V
    .registers 1
    .line 37
    invoke-direct {v0}, Ll/ۗۢ;-><init>()V
    return-void
.end method

.method public static Lbin/mt/plus/ShortcutActivity;->ۖ(Ljava/lang/String;)Landroid/graphics/Bitmap;
    .registers 14
    const/4 v0, 0x0
    const/4 v1, 0x0
    const/4 v2, 0x0
    const/4 v3, 0x0
    const/4 v4, 0x0
    const/4 v5, 0x0
    const/4 v6, 0x0
    sget v7, Ll/ܰۙ;->ۘۢ֫:I
    sget v8, Ll/ۚۘ;->᩹᩺ۨ:I
    const-string v9, "ۘ᩷ᩳ"
    const/4 v10, 0x0
    invoke-static {v9, v10}, Ll/ۡ۫;->۠ۢ᩶(Ljava/lang/Object;I)C
    move-result v10
    mul-int/lit16 v10, v10, 0x3c1
    const/4 v11, 0x1
    invoke-static {v9, v11}, Ll/ۡ۫;->۠ۢ᩶(Ljava/lang/Object;I)C
    move-result v11
    mul-int/lit8 v11, v11, 0x1f
    add-int/2addr v10, v11
    xor-int/2addr v10, v8
    :goto_1d
    const/4 v11, 0x2
    :goto_1e
    invoke-static {v9, v11}, Ll/ۡ۫;->۠ۢ᩶(Ljava/lang/Object;I)C
    move-result v9
    :goto_22
    add-int/2addr v10, v9
    :goto_23
    sparse-switch v10, :cond_214
    .line 77
    invoke-static {}, Ll/ۤۙ;->ᩴ֫֫()I
    sget-boolean v9, Ll/ۛܶ;->ۙ᩵᩶:Z
    if-eqz v9, :cond_197
    goto/16 :goto_16f
    .line 171
    invoke-static {}, Ll/ܽ᩶;->ۖܶ᩹()I
    invoke-static {}, Ll/ۛܰ;->ᩴ᩶ᩴ()I
    move-result v9
    if-eqz v9, :cond_3a
    goto/16 :goto_1ea
    :cond_3a
    const-string v9, "ۗ۠ۤ"
    const/4 v10, 0x1
    invoke-static {v9, v10}, Ll/ۡ۫;->۠ۢ᩶(Ljava/lang/Object;I)C
    move-result v10
    const/4 v11, 0x2
    invoke-static {v9, v11}, Ll/ۡ۫;->۠ۢ᩶(Ljava/lang/Object;I)C
    move-result v11
    mul-int v10, v10, v11
    xor-int/2addr v10, v8
    goto/16 :goto_d0
    .line 243
    invoke-static {}, Ll/ܽۛ;->ܺۢᩴ()I
    invoke-static {}, Ll/ۘ᩹;->᩶᩵᩵()I
    move-result v9
    if-lez v9, :goto_1ea
    goto/16 :goto_16f
    .line 7
    invoke-static {}, Ll/ۘ;->۬ۖ۬()I
    sget-boolean v9, Ll/᩻᩷;->ܰ۫ۡ:Z
    if-eqz v9, :cond_1d1
    goto/16 :goto_16f
    .line 25
    invoke-static {}, Ll/ۤܿ;->۬ܽܳ()I
    invoke-static {}, Ll/ۤ۟;->ܺ᩷ᩴ()I
    goto/16 :goto_16f
    .line 248
    invoke-static {}, Ll/ܰۡ;->᩷۫֡()I
    const/4 v13, 0x0
    return-object v13
    :try_start_006c
    .line 273
    invoke-static {v5, v6}, Ll/ۤۙ;->ᩳۡۚ(Ljava/lang/Object;Ljava/lang/Object;)V
    goto :goto_74
    throw v5
    :try_end_006c
    :try_end_006c
    :try_start_0071
    invoke-virtual {v3}, Ljava/io/BufferedInputStream;->close()V
    :try_end_0071
    :try_end_0071
    :goto_74
    const-string v9, "᩷ۙ֫"
    const/4 v10, 0x1
    invoke-static {v9, v10}, Ll/ܽ᩵;->ᩳ᩹֨(Ljava/lang/Object;I)C
    move-result v10
    xor-int/2addr v10, v7
    const/4 v11, 0x0
    invoke-static {v9, v11}, Ll/ܽ᩵;->ᩳ᩹֨(Ljava/lang/Object;I)C
    move-result v11
    mul-int v10, v10, v11
    const/4 v11, 0x2
    invoke-static {v9, v11}, Ll/ۡ۫;->۠ۢ᩶(Ljava/lang/Object;I)C
    move-result v9
    goto/16 :goto_18e
    move-exception v6
    const-string v9, "ۧۚ۬"
    goto/16 :goto_1a7
    return-object v4
    return-object v2
    :try_start_0091
    invoke-virtual {v1}, Ll/۠᩺۟;->ܶۜ()Ljava/io/BufferedInputStream;
    move-result-object v9
    :try_end_0091
    :try_end_0091
    :try_start_0095
    .line 274
    invoke-static {v9}, Landroid/graphics/BitmapFactory;->decodeStream(Ljava/io/InputStream;)Landroid/graphics/Bitmap;
    move-result-object v10
    :try_end_0095
    :try_end_0095
    :try_start_0099
    .line 275
    invoke-virtual {v9}, Ljava/io/BufferedInputStream;->close()V
    :try_end_0099
    :try_end_0099
    const-string v4, "ۨܳ᩹"
    invoke-static {v4}, Ll/ۙۘ;->ۙᩴ۫(Ljava/lang/Object;)I
    move-result v4
    xor-int/2addr v4, v7
    move-object v12, v10
    move v10, v4
    move-object v4, v12
    goto/16 :goto_23
    move-exception v5
    const-string v3, "ۤۨۨ"
    const/4 v10, 0x1
    invoke-static {v3, v10}, Ll/ܽ᩵;->ᩳ᩹֨(Ljava/lang/Object;I)C
    move-result v10
    xor-int/2addr v10, v8
    const/4 v11, 0x0
    invoke-static {v3, v11}, Ll/ۡ۫;->۠ۢ᩶(Ljava/lang/Object;I)C
    move-result v11
    mul-int v10, v10, v11
    const/4 v11, 0x2
    invoke-static {v3, v11}, Ll/ܽ᩵;->ᩳ᩹֨(Ljava/lang/Object;I)C
    move-result v3
    sub-int/2addr v10, v3
    move-object v3, v9
    goto/16 :goto_23
    const-string v9, "ۛ۠۠"
    const/4 v10, 0x1
    invoke-static {v9, v10}, Ll/ܽ᩵;->ᩳ᩹֨(Ljava/lang/Object;I)C
    move-result v10
    const/4 v11, 0x2
    invoke-static {v9, v11}, Ll/ۡ۫;->۠ۢ᩶(Ljava/lang/Object;I)C
    move-result v11
    :goto_cd
    mul-int v10, v10, v11
    xor-int/2addr v10, v7
    :goto_d0
    const/4 v11, 0x0
    goto/16 :goto_1c7
    .line 270
    invoke-virtual {v1}, Ll/۠᩺۟;->ܰۖ()Z
    move-result v2
    const/4 v9, 0x0
    if-nez v2, :cond_f0
    const-string v2, "۠ܶۧ"
    const/4 v10, 0x1
    invoke-static {v2, v10}, Ll/ۡ۫;->۠ۢ᩶(Ljava/lang/Object;I)C
    move-result v10
    xor-int/2addr v10, v8
    const/4 v11, 0x0
    invoke-static {v2, v11}, Ll/ۡ۫;->۠ۢ᩶(Ljava/lang/Object;I)C
    move-result v11
    mul-int v10, v10, v11
    const/4 v11, 0x2
    invoke-static {v2, v11}, Ll/ܽ᩵;->ᩳ᩹֨(Ljava/lang/Object;I)C
    move-result v2
    sub-int/2addr v10, v2
    goto :goto_105
    :cond_f0
    const-string v2, "ܺ᩷᩺"
    const/4 v10, 0x1
    invoke-static {v2, v10}, Ll/ܽ᩵;->ᩳ᩹֨(Ljava/lang/Object;I)C
    move-result v10
    const/4 v11, 0x2
    invoke-static {v2, v11}, Ll/ۡ۫;->۠ۢ᩶(Ljava/lang/Object;I)C
    move-result v11
    mul-int v10, v10, v11
    xor-int/2addr v10, v7
    const/4 v11, 0x0
    invoke-static {v2, v11}, Ll/ۡ۫;->۠ۢ᩶(Ljava/lang/Object;I)C
    move-result v2
    add-int/2addr v10, v2
    :goto_105
    move-object v2, v9
    goto/16 :goto_23
    .line 269
    invoke-static {v0, v13}, Ll/֫;->ܳܶ᩹(Ljava/lang/Object;Ljava/lang/Object;)Ll/۠᩺۟;
    move-result-object v9
    .line 230
    invoke-static {}, Ll/᩺ܳ;->ۜܺܶ()I
    move-result v10
    if-gtz v10, :cond_113
    goto :goto_12f
    :cond_113
    const-string v1, "᩶ܳ۫"
    const/4 v10, 0x1
    invoke-static {v1, v10}, Ll/ܽ᩵;->ᩳ᩹֨(Ljava/lang/Object;I)C
    move-result v10
    xor-int/2addr v10, v8
    const/4 v11, 0x0
    invoke-static {v1, v11}, Ll/ۡ۫;->۠ۢ᩶(Ljava/lang/Object;I)C
    move-result v11
    mul-int v10, v10, v11
    const/4 v11, 0x2
    invoke-static {v1, v11}, Ll/ܽ᩵;->ᩳ᩹֨(Ljava/lang/Object;I)C
    move-result v1
    sub-int/2addr v10, v1
    move-object v1, v9
    goto/16 :goto_23
    .line 234
    sget v9, Ll/ۤ֫;->᩻ܺ᩵:I
    if-gtz v9, :cond_143
    :goto_12f
    const-string v9, "ۘ᩵᩶"
    const/4 v10, 0x0
    invoke-static {v9, v10}, Ll/ܽ᩵;->ᩳ᩹֨(Ljava/lang/Object;I)C
    move-result v10
    mul-int/lit16 v10, v10, 0x3c1
    const/4 v11, 0x1
    invoke-static {v9, v11}, Ll/ܽ᩵;->ᩳ᩹֨(Ljava/lang/Object;I)C
    move-result v11
    mul-int/lit8 v11, v11, 0x1f
    add-int/2addr v10, v11
    xor-int/2addr v10, v7
    goto/16 :goto_1d
    :cond_143
    const-string v9, "۟᩻ᩳ"
    const/4 v10, 0x1
    invoke-static {v9, v10}, Ll/ܽ᩵;->ᩳ᩹֨(Ljava/lang/Object;I)C
    move-result v10
    const/4 v11, 0x2
    invoke-static {v9, v11}, Ll/ۡ۫;->۠ۢ᩶(Ljava/lang/Object;I)C
    move-result v11
    mul-int v10, v10, v11
    xor-int/2addr v10, v8
    const/4 v11, 0x0
    goto/16 :goto_1e
    .line 222
    sget-boolean v9, Ll/ܽۘ;->ᩳᩳ᩻:Z
    if-eqz v9, :cond_15a
    goto :goto_16f
    :cond_15a
    const-string v9, "ۖۘܰ"
    goto/16 :goto_1dc
    sget v9, Ll/᩻ᩴ;->ۤ᩹ۜ:I
    if-gtz v9, :cond_164
    goto/16 :goto_1ea
    :cond_164
    const-string v9, "ᩳۖܳ"
    :goto_166
    invoke-static {v9}, Ll/ۙۘ;->ۙᩴ۫(Ljava/lang/Object;)I
    move-result v9
    goto :goto_1ab
    .line 82
    sget v9, Ll/ۗۤ;->ܺ᩷ۡ:I
    if-gtz v9, :cond_172
    :goto_16f
    const-string v9, "۬ۧ֡"
    goto :goto_166
    :cond_172
    const-string v9, "ۛ᩵ۜ"
    goto :goto_1dc
    sget v9, Ll/ۙۘ;->ۖۢۙ:I
    if-eqz v9, :cond_17a
    goto :cond_197
    :cond_17a
    const-string v9, "ܽۚ֫"
    const/4 v10, 0x1
    invoke-static {v9, v10}, Ll/ܽ᩵;->ᩳ᩹֨(Ljava/lang/Object;I)C
    move-result v10
    xor-int/2addr v10, v7
    :goto_182
    const/4 v11, 0x0
    invoke-static {v9, v11}, Ll/ۡ۫;->۠ۢ᩶(Ljava/lang/Object;I)C
    move-result v11
    :goto_187
    mul-int v10, v10, v11
    const/4 v11, 0x2
    invoke-static {v9, v11}, Ll/ܽ᩵;->ᩳ᩹֨(Ljava/lang/Object;I)C
    move-result v9
    :goto_18e
    sub-int/2addr v10, v9
    goto/16 :goto_23
    invoke-static {}, Ll/᩹;->ۖ᩷֫()I
    move-result v9
    if-eqz v9, :cond_1a5
    :cond_197
    const-string v9, "᩷᩵ۙ"
    const/4 v10, 0x1
    invoke-static {v9, v10}, Ll/ۡ۫;->۠ۢ᩶(Ljava/lang/Object;I)C
    move-result v10
    const/4 v11, 0x2
    invoke-static {v9, v11}, Ll/ܽ᩵;->ᩳ᩹֨(Ljava/lang/Object;I)C
    move-result v11
    goto/16 :goto_cd
    :cond_1a5
    const-string v9, "۬᩸۫"
    :goto_1a7
    invoke-static {v9}, Ll/ۤ֨;->۬ۚᩴ(Ljava/lang/Object;)I
    move-result v9
    :goto_1ab
    xor-int v10, v9, v8
    goto/16 :goto_23
    .line 186
    sget v9, Ll/ۢۨ;->ᩳۨܶ:I
    if-ltz v9, :cond_1b4
    goto :goto_1ea
    :cond_1b4
    const-string v9, "᩸ᩳܶ"
    const/4 v10, 0x0
    invoke-static {v9, v10}, Ll/ܽ᩵;->ᩳ᩹֨(Ljava/lang/Object;I)C
    move-result v10
    mul-int/lit16 v10, v10, 0x3c1
    const/4 v11, 0x1
    invoke-static {v9, v11}, Ll/ܽ᩵;->ᩳ᩹֨(Ljava/lang/Object;I)C
    move-result v11
    mul-int/lit8 v11, v11, 0x1f
    add-int/2addr v10, v11
    xor-int/2addr v10, v8
    const/4 v11, 0x2
    :goto_1c7
    invoke-static {v9, v11}, Ll/ܽ᩵;->ᩳ᩹֨(Ljava/lang/Object;I)C
    move-result v9
    goto/16 :goto_22
    .line 122
    sget v9, Ll/ۗۤ;->ܺ᩷ۡ:I
    if-gtz v9, :cond_1da
    :cond_1d1
    const-string v9, "֫ۜܽ"
    const/4 v10, 0x1
    invoke-static {v9, v10}, Ll/ۡ۫;->۠ۢ᩶(Ljava/lang/Object;I)C
    move-result v10
    xor-int/2addr v10, v8
    goto :goto_182
    :cond_1da
    const-string v9, "ۘۢۛ"
    :goto_1dc
    invoke-static {v9}, Ll/ۙۘ;->ۙᩴ۫(Ljava/lang/Object;)I
    move-result v9
    xor-int v10, v9, v7
    goto/16 :goto_23
    .line 269
    sget-object v9, Lbin/mt/plus/ShortcutActivity;->ܽۖ:Ll/۠᩺۟;
    .line 28
    sget v10, Ll/ۘᩳ;->ܰ֡۫:I
    if-ltz v10, :cond_1f8
    :goto_1ea
    const-string v9, "ۜۡᩳ"
    const/4 v10, 0x1
    invoke-static {v9, v10}, Ll/ۡ۫;->۠ۢ᩶(Ljava/lang/Object;I)C
    move-result v10
    xor-int/2addr v10, v7
    const/4 v11, 0x0
    invoke-static {v9, v11}, Ll/ܽ᩵;->ᩳ᩹֨(Ljava/lang/Object;I)C
    move-result v11
    goto :goto_187
    :cond_1f8
    const-string v0, "ۚᩳܳ"
    const/4 v10, 0x0
    invoke-static {v0, v10}, Ll/ܽ᩵;->ᩳ᩹֨(Ljava/lang/Object;I)C
    move-result v10
    mul-int/lit16 v10, v10, 0x3c1
    const/4 v11, 0x1
    invoke-static {v0, v11}, Ll/ۡ۫;->۠ۢ᩶(Ljava/lang/Object;I)C
    move-result v11
    mul-int/lit8 v11, v11, 0x1f
    add-int/2addr v10, v11
    xor-int/2addr v10, v7
    const/4 v11, 0x2
    invoke-static {v0, v11}, Ll/ۡ۫;->۠ۢ᩶(Ljava/lang/Object;I)C
    move-result v0
    add-int/2addr v10, v0
    move-object v0, v9
    goto/16 :goto_23
    nop
    :cond_214
    .sparse-switch
        -45905535 -> :sswitch_e5
        -43680523 -> :sswitch_b0
        -11341447 -> :sswitch_6d
        -11271964 -> :sswitch_4e
        -6719300 -> :sswitch_16e
        -6568653 -> :sswitch_132
        -3095238 -> :sswitch_28
        -1911108 -> :sswitch_152
        -1892587 -> :sswitch_1c1
        -1759846 -> :sswitch_49
        -1755547 -> :sswitch_44
        1737145 -> :sswitch_18c
        1738758 -> :sswitch_108
        1763878 -> :sswitch_6c
        1894434 -> :sswitch_1aa
        1899402 -> :sswitch_13b
        1901601 -> :sswitch_c
        3100547 -> :sswitch_6d
        4616777 -> :sswitch_33
        4953471 -> :sswitch_148
        11878908 -> :sswitch_3c
        18108124 -> :sswitch_4d
        45925720 -> :sswitch_6e
    .end sparse-switch
.end method

.method public static Lbin/mt/plus/ShortcutActivity;->ۖ(Ljava/lang/String;Landroid/graphics/Bitmap;)V
    .registers 10
    const/4 v0, 0x0
    const/4 v1, 0x0
    const/4 v2, 0x0
    sget v3, Ll/ܳܺ;->۫ܿ᩵:I
    sget v4, Ll/᩺ܶ;->ۨ۬۠:I
    const-string v5, "֫ۤ۬"
    const/4 v6, 0x0
    invoke-static {v5, v6}, Ll/ۡ۫;->۠ۢ᩶(Ljava/lang/Object;I)C
    move-result v6
    mul-int/lit16 v6, v6, 0x3c1
    const/4 v7, 0x1
    invoke-static {v5, v7}, Ll/ܽ᩵;->ᩳ᩹֨(Ljava/lang/Object;I)C
    move-result v7
    :goto_15
    mul-int/lit8 v7, v7, 0x1f
    add-int/2addr v6, v7
    xor-int/2addr v6, v3
    :goto_19
    const/4 v7, 0x2
    :goto_1a
    invoke-static {v5, v7}, Ll/ܽ᩵;->ᩳ᩹֨(Ljava/lang/Object;I)C
    move-result v5
    :goto_1e
    add-int/2addr v6, v5
    :goto_1f
    sparse-switch v6, :cond_1e6
    .line 17
    sget v5, Ll/ۘ᩹;->ۛۡ᩵:I
    if-gez v5, :cond_137
    goto :goto_49
    .line 237
    invoke-static {}, Ll/ܰۡ;->᩷۫֡()I
    move-result v5
    if-gez v5, :cond_118
    goto/16 :goto_190
    .line 177
    sget-boolean v5, Ll/ۤۙ;->۫ᩳ۬:Z
    if-eqz v5, :cond_1cd
    goto/16 :goto_190
    .line 32
    sget v5, Ll/ܽ᩶;->ܺ᩵֨:I
    if-gtz v5, :cond_174
    goto :goto_49
    .line 131
    sget-boolean v5, Ll/ۤۙ;->۫ᩳ۬:Z
    if-eqz v5, :goto_190
    goto/16 :goto_159
    invoke-static {}, Ll/᩻᩷;->ܺ᩻᩺()I
    sget v5, Ll/ۤۛ;->᩺᩻ۘ:I
    if-ltz v5, :goto_49
    goto/16 :goto_159
    :goto_49
    const-string v5, "֨ۜۧ"
    const/4 v6, 0x0
    invoke-static {v5, v6}, Ll/ۡ۫;->۠ۢ᩶(Ljava/lang/Object;I)C
    move-result v6
    mul-int/lit16 v6, v6, 0x3c1
    const/4 v7, 0x1
    invoke-static {v5, v7}, Ll/ۡ۫;->۠ۢ᩶(Ljava/lang/Object;I)C
    move-result v7
    mul-int/lit8 v7, v7, 0x1f
    add-int/2addr v6, v7
    xor-int/2addr v6, v4
    goto :goto_19
    .line 26
    invoke-static {}, Ll/ۤۚ;->ܶۘ֨()I
    sget v5, Ll/ܽۛ;->۠ܺ۟:I
    if-ltz v5, :goto_159
    goto :goto_6a
    .line 200
    invoke-static {}, Ll/ۤۚ;->ܶۘ֨()I
    invoke-static {}, Ll/ۘ;->۬ۖ۬()I
    :goto_6a
    const-string v5, "ۚ᩷᩺"
    const/4 v6, 0x1
    invoke-static {v5, v6}, Ll/ۡ۫;->۠ۢ᩶(Ljava/lang/Object;I)C
    move-result v6
    :goto_71
    xor-int/2addr v6, v3
    const/4 v7, 0x0
    invoke-static {v5, v7}, Ll/ܽ᩵;->ᩳ᩹֨(Ljava/lang/Object;I)C
    move-result v7
    goto/16 :goto_129
    .line 179
    invoke-static {}, Ll/ܰۙ;->᩶ۡۤ()I
    return-void
    :try_start_007d
    .line 283
    invoke-static {v1, v2}, Ll/ۤۙ;->ᩳۡۚ(Ljava/lang/Object;Ljava/lang/Object;)V
    goto :goto_86
    throw v1
    :try_end_007d
    :try_end_007d
    return-void
    :try_start_0083
    invoke-static {v0}, Ll/۬ۨ;->ۜۜܿ(Ljava/lang/Object;)V
    :try_end_0083
    :try_end_0083
    :goto_86
    const-string v5, "۟ܽۢ"
    const/4 v6, 0x1
    invoke-static {v5, v6}, Ll/ۡ۫;->۠ۢ᩶(Ljava/lang/Object;I)C
    move-result v6
    xor-int/2addr v6, v4
    const/4 v7, 0x0
    invoke-static {v5, v7}, Ll/ۡ۫;->۠ۢ᩶(Ljava/lang/Object;I)C
    move-result v7
    :goto_93
    mul-int v6, v6, v7
    const/4 v7, 0x2
    invoke-static {v5, v7}, Ll/ۡ۫;->۠ۢ᩶(Ljava/lang/Object;I)C
    move-result v5
    goto/16 :goto_130
    move-exception v2
    const-string v5, "ۧܶ۠"
    const/4 v6, 0x1
    invoke-static {v5, v6}, Ll/ܽ᩵;->ᩳ᩹֨(Ljava/lang/Object;I)C
    move-result v6
    xor-int/2addr v6, v3
    const/4 v7, 0x0
    invoke-static {v5, v7}, Ll/ܽ᩵;->ᩳ᩹֨(Ljava/lang/Object;I)C
    move-result v7
    goto :goto_93
    return-void
    :try_start_00ac
    .line 282
    sget-object v5, Lbin/mt/plus/ShortcutActivity;->ܽۖ:Ll/۠᩺۟;
    invoke-virtual {v5}, Ll/۠᩺۟;->ۢۖ()V
    .line 283
    invoke-static {v5, v8}, Ll/᩻᩺;->ܺۖܰ(Ljava/lang/Object;Ljava/lang/Object;)Ll/۠᩺۟;
    move-result-object v5
    invoke-virtual {v5}, Ll/۠᩺۟;->ᩳۜ()Ljava/io/BufferedOutputStream;
    move-result-object v5
    :try_end_00ac
    :try_end_00ac
    :try_start_00b9
    .line 284
    sget-object v6, Landroid/graphics/Bitmap$CompressFormat;->PNG:Landroid/graphics/Bitmap$CompressFormat;
    const/16 v7, 0x64
    invoke-virtual {v9, v6, v7, v5}, Landroid/graphics/Bitmap;->compress(Landroid/graphics/Bitmap$CompressFormat;ILjava/io/OutputStream;)Z
    :try_end_00b9
    :try_end_00b9
    :try_start_00c0
    .line 285
    invoke-static {v5}, Ll/ܽ᩶;->֡ۨᩳ(Ljava/lang/Object;)V
    :try_end_00c0
    :try_end_00c0
    const-string/jumbo v5, "᩺ۚۢ"
    invoke-static {v5}, Ll/ۤ֨;->۬ۚᩴ(Ljava/lang/Object;)I
    move-result v5
    :goto_ca
    xor-int v6, v5, v3
    goto/16 :goto_1f
    move-exception v0
    move-object v1, v0
    const-string v0, "ܰۧ᩸"
    invoke-static {v0}, Ll/ۙۘ;->ۙᩴ۫(Ljava/lang/Object;)I
    move-result v0
    xor-int v6, v0, v4
    move-object v0, v5
    goto/16 :goto_1f
    const-string v5, "۠۟ۖ"
    const/4 v6, 0x1
    invoke-static {v5, v6}, Ll/ܽ᩵;->ᩳ᩹֨(Ljava/lang/Object;I)C
    move-result v6
    :goto_e2
    const/4 v7, 0x2
    invoke-static {v5, v7}, Ll/ۡ۫;->۠ۢ᩶(Ljava/lang/Object;I)C
    move-result v7
    mul-int v6, v6, v7
    xor-int/2addr v6, v4
    const/4 v7, 0x0
    goto/16 :goto_1a
    .line 96
    sget v5, Ll/᩺ܶ;->ۨ۬۠:I
    if-gtz v5, :cond_f3
    goto/16 :goto_1b2
    :cond_f3
    const-string v5, "᩵ۗۙ"
    const/4 v6, 0x0
    invoke-static {v5, v6}, Ll/ܽ᩵;->ᩳ᩹֨(Ljava/lang/Object;I)C
    move-result v6
    mul-int/lit16 v6, v6, 0x3c1
    const/4 v7, 0x1
    invoke-static {v5, v7}, Ll/ۡ۫;->۠ۢ᩶(Ljava/lang/Object;I)C
    move-result v7
    goto/16 :goto_15
    .line 23
    invoke-static {}, Ll/ᩴᩴ;->ۡۙ۬()I
    move-result v5
    if-ltz v5, :cond_10a
    goto :cond_137
    :cond_10a
    const-string v5, "֫ܺ᩻"
    :goto_10c
    invoke-static {v5}, Ll/ۤ֨;->۬ۚᩴ(Ljava/lang/Object;)I
    move-result v5
    :goto_110
    xor-int v6, v5, v4
    goto/16 :goto_1f
    .line 117
    sget v5, Ll/ۢۨ;->ᩳۨܶ:I
    if-ltz v5, :cond_11c
    :cond_118
    const-string/jumbo v5, "᩻۠ۖ"
    goto :goto_10c
    :cond_11c
    const-string v5, "᩵֫᩹"
    const/4 v6, 0x1
    invoke-static {v5, v6}, Ll/ܽ᩵;->ᩳ᩹֨(Ljava/lang/Object;I)C
    move-result v6
    xor-int/2addr v6, v3
    const/4 v7, 0x0
    invoke-static {v5, v7}, Ll/ۡ۫;->۠ۢ᩶(Ljava/lang/Object;I)C
    move-result v7
    :goto_129
    mul-int v6, v6, v7
    const/4 v7, 0x2
    invoke-static {v5, v7}, Ll/ܽ᩵;->ᩳ᩹֨(Ljava/lang/Object;I)C
    move-result v5
    :goto_130
    sub-int/2addr v6, v5
    goto/16 :goto_1f
    .line 77
    sget-boolean v5, Ll/ܽۜ;->ۖۙۖ:Z
    if-eqz v5, :cond_13e
    :cond_137
    const-string v5, "ۤۡ۠"
    :goto_139
    invoke-static {v5}, Ll/ۙۘ;->ۙᩴ۫(Ljava/lang/Object;)I
    move-result v5
    goto :goto_110
    :cond_13e
    const-string v5, "ۢۨܺ"
    const/4 v6, 0x0
    invoke-static {v5, v6}, Ll/ۡ۫;->۠ۢ᩶(Ljava/lang/Object;I)C
    move-result v6
    goto :goto_184
    .line 220
    sget v5, Ll/ܽ֫;->ۡᩴ᩻:I
    if-ltz v5, :cond_14b
    goto :goto_190
    :cond_14b
    const-string v5, "ۚۚ֡"
    const/4 v6, 0x0
    invoke-static {v5, v6}, Ll/ܽ᩵;->ᩳ᩹֨(Ljava/lang/Object;I)C
    move-result v6
    goto :goto_1bc
    .line 221
    invoke-static {}, Ll/ܰۙ;->᩶ۡۤ()I
    move-result v5
    if-eqz v5, :cond_161
    :goto_159
    const-string v5, "ۛۖۙ"
    const/4 v6, 0x1
    invoke-static {v5, v6}, Ll/ۡ۫;->۠ۢ᩶(Ljava/lang/Object;I)C
    move-result v6
    goto :goto_e2
    :cond_161
    const-string v5, "ܺܿۧ"
    const/4 v6, 0x0
    invoke-static {v5, v6}, Ll/ۡ۫;->۠ۢ᩶(Ljava/lang/Object;I)C
    move-result v6
    mul-int/lit16 v6, v6, 0x3c1
    const/4 v7, 0x1
    invoke-static {v5, v7}, Ll/ܽ᩵;->ᩳ᩹֨(Ljava/lang/Object;I)C
    move-result v7
    goto :goto_1c3
    .line 84
    sget-boolean v5, Ll/ۛܰ;->ۗ᩻֨:Z
    if-nez v5, :cond_17d
    :cond_174
    const-string/jumbo v5, "᩺ۧ᩻"
    :goto_177
    invoke-static {v5}, Ll/ۙۘ;->ۙᩴ۫(Ljava/lang/Object;)I
    move-result v5
    goto/16 :goto_ca
    :cond_17d
    const-string v5, "᩸ۖ᩻"
    const/4 v6, 0x0
    invoke-static {v5, v6}, Ll/ܽ᩵;->ᩳ᩹֨(Ljava/lang/Object;I)C
    move-result v6
    :goto_184
    mul-int/lit16 v6, v6, 0x3c1
    const/4 v7, 0x1
    invoke-static {v5, v7}, Ll/ܽ᩵;->ᩳ᩹֨(Ljava/lang/Object;I)C
    move-result v7
    goto :goto_1a7
    sget v5, Ll/֫;->᩺ܽ֫:I
    if-gtz v5, :cond_199
    :goto_190
    const-string v5, "᩸֨᩹"
    const/4 v6, 0x1
    invoke-static {v5, v6}, Ll/ܽ᩵;->ᩳ᩹֨(Ljava/lang/Object;I)C
    move-result v6
    goto/16 :goto_71
    :cond_199
    const-string v5, "ܿܳ᩵"
    const/4 v6, 0x0
    invoke-static {v5, v6}, Ll/ܽ᩵;->ᩳ᩹֨(Ljava/lang/Object;I)C
    move-result v6
    mul-int/lit16 v6, v6, 0x3c1
    const/4 v7, 0x1
    invoke-static {v5, v7}, Ll/ۡ۫;->۠ۢ᩶(Ljava/lang/Object;I)C
    move-result v7
    :goto_1a7
    mul-int/lit8 v7, v7, 0x1f
    add-int/2addr v6, v7
    xor-int/2addr v6, v3
    goto :goto_1c7
    invoke-static {}, Ll/ۤۛ;->ۚۨ᩶()Z
    move-result v5
    if-nez v5, :cond_1b5
    :goto_1b2
    const-string v5, "۫ۙۤ"
    goto :goto_139
    :cond_1b5
    const-string v5, "ۙۜۛ"
    const/4 v6, 0x0
    invoke-static {v5, v6}, Ll/ۡ۫;->۠ۢ᩶(Ljava/lang/Object;I)C
    move-result v6
    :goto_1bc
    mul-int/lit16 v6, v6, 0x3c1
    const/4 v7, 0x1
    invoke-static {v5, v7}, Ll/ۡ۫;->۠ۢ᩶(Ljava/lang/Object;I)C
    move-result v7
    :goto_1c3
    mul-int/lit8 v7, v7, 0x1f
    add-int/2addr v6, v7
    xor-int/2addr v6, v4
    :goto_1c7
    const/4 v7, 0x2
    goto :goto_1e0
    .line 118
    sget v5, Ll/ۘ۟;->᩻ܿ۟:I
    if-gtz v5, :cond_1d0
    :cond_1cd
    const-string v5, "ۘܺܿ"
    goto :goto_177
    :cond_1d0
    const-string v5, "ۙ᩻֨"
    const/4 v6, 0x1
    invoke-static {v5, v6}, Ll/ܽ᩵;->ᩳ᩹֨(Ljava/lang/Object;I)C
    move-result v6
    const/4 v7, 0x2
    invoke-static {v5, v7}, Ll/ۡ۫;->۠ۢ᩶(Ljava/lang/Object;I)C
    move-result v7
    mul-int v6, v6, v7
    xor-int/2addr v6, v4
    const/4 v7, 0x0
    :goto_1e0
    invoke-static {v5, v7}, Ll/ۡ۫;->۠ۢ᩶(Ljava/lang/Object;I)C
    move-result v5
    goto/16 :goto_1e
    :cond_1e6
    .sparse-switch
        -28059417 -> :sswitch_21
        -28026678 -> :sswitch_e4
        -8465690 -> :sswitch_5e
        -7171868 -> :sswitch_5a
        -6570478 -> :sswitch_1b
        -6564546 -> :sswitch_63
        -6564325 -> :sswitch_8d
        -6556519 -> :sswitch_134
        -1830075 -> :sswitch_151
        -1749696 -> :sswitch_f5
        -1442329 -> :sswitch_1aa
        1445542 -> :sswitch_3d
        1463967 -> :sswitch_ce
        1745108 -> :sswitch_114
        1746345 -> :sswitch_16d
        1748464 -> :sswitch_16
        1754277 -> :sswitch_8
        1834066 -> :sswitch_64
        1842575 -> :sswitch_127
        3071856 -> :sswitch_45
        3077753 -> :sswitch_8c
        6575170 -> :sswitch_10
        7565456 -> :sswitch_62
        9819940 -> :sswitch_18d
    .end sparse-switch
.end method

.method public static Lbin/mt/plus/ShortcutActivity;->ۖ(Ll/۠ᩴۡ;Z)V
    .registers 88
    move-object/from16 v0, v86
    const/4 v4, 0x0
    const/4 v5, 0x0
    const/4 v6, 0x0
    const/4 v7, 0x0
    const/4 v8, 0x0
    const/4 v9, 0x0
    const/4 v10, 0x0
    const/4 v11, 0x0
    const/4 v12, 0x0
    const/4 v13, 0x0
    const/4 v14, 0x0
    const/4 v15, 0x0
    const/16 v16, 0x0
    const/16 v17, 0x0
    const/16 v18, 0x0
    const/16 v19, 0x0
    const/16 v20, 0x0
    const/16 v21, 0x0
    const/16 v22, 0x0
    const/16 v23, 0x0
    const/16 v24, 0x0
    const/16 v25, 0x0
    const/16 v26, 0x0
    const/16 v27, 0x0
    const/16 v28, 0x0
    const/16 v29, 0x0
    const/16 v30, 0x0
    const/16 v31, 0x0
    const/16 v32, 0x0
    const/16 v33, 0x0
    const/16 v34, 0x0
    const/16 v35, 0x0
    const/16 v36, 0x0
    const/16 v37, 0x0
    const/16 v38, 0x0
    const/16 v39, 0x0
    const/16 v40, 0x0
    const/16 v41, 0x0
    const/16 v42, 0x0
    const/16 v43, 0x0
    const/16 v44, 0x0
    const/16 v45, 0x0
    const/16 v46, 0x0
    const/16 v47, 0x0
    const/16 v48, 0x0
    const/16 v49, 0x0
    const/16 v50, 0x0
    const/16 v51, 0x0
    const/16 v52, 0x0
    const/16 v53, 0x0
    const/16 v54, 0x0
    const/16 v55, 0x0
    const/16 v56, 0x0
    const/16 v57, 0x0
    const/16 v58, 0x0
    const/16 v59, 0x0
    const/16 v60, 0x0
    const/16 v61, 0x0
    sget v62, Ll/ۘ᩹;->ۛۡ᩵:I
    sget v63, Ll/ۤ֫;->᩻ܺ᩵:I
    const-string v1, "۟ܿۙ"
    const/4 v2, 0x0
    invoke-static {v1, v2}, Ll/ۡ۫;->۠ۢ᩶(Ljava/lang/Object;I)C
    move-result v2
    mul-int/lit16 v2, v2, 0x3c1
    const/4 v3, 0x1
    invoke-static {v1, v3}, Ll/ܽ᩵;->ᩳ᩹֨(Ljava/lang/Object;I)C
    move-result v3
    mul-int/lit8 v3, v3, 0x1f
    add-int/2addr v2, v3
    xor-int v2, v2, v62
    const/4 v3, 0x2
    invoke-static {v1, v3}, Ll/ۡ۫;->۠ۢ᩶(Ljava/lang/Object;I)C
    move-result v1
    add-int/2addr v2, v1
    move-object/from16 v23, v8
    move-object/from16 v11, v17
    move-object/from16 v15, v35
    move-object/from16 v69, v44
    move-object/from16 v71, v46
    move-object/from16 v74, v49
    move-object/from16 v76, v52
    move-object/from16 v79, v55
    move-object/from16 v81, v57
    move-object/from16 v35, v59
    move-object/from16 v8, v60
    move-object/from16 v10, v61
    const/4 v0, 0x0
    const/4 v1, 0x0
    const/4 v3, 0x0
    const/16 v17, 0x0
    const/16 v29, 0x0
    const/16 v30, 0x0
    const/16 v33, 0x0
    const/16 v38, 0x0
    const/16 v43, 0x0
    const/16 v65, 0x0
    const/16 v67, 0x0
    const/16 v68, 0x0
    const/16 v70, 0x0
    const/16 v72, 0x0
    const/16 v73, 0x0
    const/16 v75, 0x0
    const/16 v77, 0x0
    const/16 v78, 0x0
    const/16 v80, 0x0
    const/16 v82, 0x0
    move-object/from16 v83, v24
    move-object/from16 v24, v9
    move-object/from16 v9, v83
    move-object/from16 v84, v19
    move-object/from16 v19, v13
    move-object/from16 v13, v84
    move-object/from16 v85, v25
    move-object/from16 v25, v14
    move-object/from16 v14, v85
    :goto_d6
    sparse-switch v2, :cond_1628
    move/from16 v45, v0
    move/from16 v44, v3
    invoke-static {}, Ll/ۙۙ;->ܳܶۖ()I
    invoke-static {}, Ll/ۛܶ;->ܶۖۚ()Z
    move-result v0
    if-eqz v0, :cond_286
    goto/16 :goto_2a3
    .line 27
    invoke-static {}, Ll/ۙ᩻;->ۧ۫᩺()I
    sget v2, Ll/ۢۨ;->ᩳۨܶ:I
    if-ltz v2, :cond_f5
    move/from16 v45, v0
    move/from16 v44, v3
    goto/16 :cond_286
    :cond_f5
    const-string/jumbo v2, "᩻ܽ۟"
    move/from16 v44, v3
    const/4 v3, 0x0
    invoke-static {v2, v3}, Ll/ܽ᩵;->ᩳ᩹֨(Ljava/lang/Object;I)C
    move-result v3
    mul-int/lit16 v3, v3, 0x3c1
    move/from16 v45, v0
    const/4 v0, 0x1
    invoke-static {v2, v0}, Ll/ۡ۫;->۠ۢ᩶(Ljava/lang/Object;I)C
    move-result v0
    mul-int/lit8 v0, v0, 0x1f
    add-int/2addr v3, v0
    xor-int v0, v3, v63
    const/4 v3, 0x2
    invoke-static {v2, v3}, Ll/ܽ᩵;->ᩳ᩹֨(Ljava/lang/Object;I)C
    move-result v2
    goto/16 :goto_408
    move/from16 v45, v0
    move/from16 v44, v3
    .line 245
    invoke-static {}, Ll/᩹;->ۖ᩷֫()I
    invoke-static {}, Ll/ᩴᩳ;->ۛܰܶ()I
    move-result v0
    if-lez v0, :cond_123
    goto/16 :goto_2a3
    :cond_123
    move-object/from16 v46, v6
    move-object/from16 v6, v23
    move-object/from16 v50, v24
    move/from16 v48, v28
    move/from16 v47, v38
    move/from16 v38, v43
    move-object/from16 v58, v71
    move/from16 v59, v72
    move/from16 v60, v73
    move-object/from16 v52, v74
    move/from16 v56, v75
    move-object/from16 v53, v76
    move/from16 v54, v77
    move/from16 v55, v78
    move/from16 v49, v80
    move-object/from16 v23, v81
    move/from16 v3, v82
    move-object/from16 v24, v1
    move-object/from16 v43, v5
    move-object/from16 v28, v18
    move/from16 v5, v29
    move-object/from16 v18, v4
    move-object/from16 v29, v7
    move/from16 v7, v68
    move-object/from16 v4, v79
    goto/16 :goto_117b
    move/from16 v45, v0
    move/from16 v44, v3
    .line 198
    sget v0, Ll/ܳܺ;->۫ܿ᩵:I
    if-ltz v0, :cond_199
    :cond_15f
    move-object/from16 v46, v6
    move-object/from16 v6, v23
    move-object/from16 v50, v24
    move/from16 v48, v28
    move/from16 v47, v38
    move/from16 v38, v43
    move/from16 v57, v67
    move-object/from16 v64, v69
    move/from16 v66, v70
    move-object/from16 v58, v71
    move/from16 v59, v72
    move/from16 v60, v73
    move-object/from16 v52, v74
    move/from16 v56, v75
    move-object/from16 v53, v76
    move/from16 v54, v77
    move/from16 v55, v78
    move/from16 v49, v80
    move-object/from16 v23, v81
    move/from16 v3, v82
    move-object/from16 v24, v1
    move-object/from16 v43, v5
    move-object/from16 v28, v18
    move/from16 v5, v29
    move-object/from16 v18, v4
    move-object/from16 v29, v7
    move/from16 v7, v68
    move-object/from16 v4, v79
    goto/16 :goto_15b6
    :cond_199
    move-object/from16 v46, v6
    move-object/from16 v6, v23
    move-object/from16 v50, v24
    move/from16 v48, v28
    move/from16 v47, v38
    move/from16 v38, v43
    move/from16 v2, v70
    move-object/from16 v58, v71
    move/from16 v59, v72
    move/from16 v60, v73
    move-object/from16 v52, v74
    move/from16 v56, v75
    move-object/from16 v53, v76
    move/from16 v54, v77
    move/from16 v55, v78
    move/from16 v49, v80
    move-object/from16 v23, v81
    move/from16 v3, v82
    move-object/from16 v24, v1
    move-object/from16 v43, v5
    move-object/from16 v28, v18
    move/from16 v5, v29
    move-object/from16 v1, v69
    move-object/from16 v18, v4
    move-object/from16 v29, v7
    move/from16 v7, v68
    move-object/from16 v4, v79
    goto/16 :goto_1232
    move/from16 v45, v0
    move/from16 v44, v3
    .line 239
    invoke-static {}, Ll/ۚۘ;->᩸֨᩺()Z
    invoke-static {}, Ll/ۙ֫;->ۛ֫۬()I
    move-result v0
    if-gez v0, :cond_15f
    :cond_1de
    move-object/from16 v46, v6
    move-object/from16 v6, v23
    move-object/from16 v50, v24
    move/from16 v48, v28
    move/from16 v47, v38
    move/from16 v38, v43
    move-object/from16 v53, v76
    move/from16 v2, v78
    move/from16 v49, v80
    move-object/from16 v23, v81
    move/from16 v3, v82
    move-object/from16 v24, v1
    move-object/from16 v43, v5
    move-object/from16 v28, v18
    move/from16 v5, v29
    move/from16 v1, v77
    move-object/from16 v18, v4
    move-object/from16 v29, v7
    move/from16 v7, v68
    move-object/from16 v4, v79
    goto/16 :goto_f5b
    move/from16 v45, v0
    move/from16 v44, v3
    .line 44
    invoke-static {}, Ll/ܽۛ;->ܺۢᩴ()I
    sget-boolean v0, Ll/ۛܰ;->ۗ᩻֨:Z
    if-nez v0, :cond_1de
    :cond_213
    move-object/from16 v46, v6
    move-object/from16 v6, v23
    move-object/from16 v50, v24
    move/from16 v48, v28
    move/from16 v47, v38
    move/from16 v38, v43
    move/from16 v2, v75
    move-object/from16 v53, v76
    move/from16 v54, v77
    move/from16 v55, v78
    move/from16 v49, v80
    move-object/from16 v23, v81
    move/from16 v3, v82
    move-object/from16 v24, v1
    move-object/from16 v43, v5
    move-object/from16 v28, v18
    move/from16 v5, v29
    move-object/from16 v1, v74
    move-object/from16 v18, v4
    move-object/from16 v29, v7
    move/from16 v7, v68
    move-object/from16 v4, v79
    goto/16 :goto_101b
    move/from16 v45, v0
    move/from16 v44, v3
    invoke-static {}, Ll/ۙۙ;->ܳܶۖ()I
    sget v0, Ll/ᩴᩳ;->۟֡ۛ:I
    if-ltz v0, :cond_213
    :goto_24c
    move-object/from16 v46, v6
    move-object/from16 v6, v23
    move-object/from16 v50, v24
    move/from16 v48, v28
    move/from16 v47, v38
    move/from16 v38, v43
    move/from16 v57, v67
    move-object/from16 v64, v69
    move/from16 v66, v70
    move-object/from16 v58, v71
    move/from16 v59, v72
    move/from16 v60, v73
    move-object/from16 v52, v74
    move/from16 v56, v75
    move-object/from16 v53, v76
    move/from16 v54, v77
    move/from16 v55, v78
    move/from16 v49, v80
    move-object/from16 v23, v81
    move/from16 v3, v82
    move-object/from16 v24, v1
    move-object/from16 v43, v5
    move-object/from16 v28, v18
    move/from16 v5, v29
    move-object/from16 v18, v4
    move-object/from16 v29, v7
    move/from16 v7, v68
    move-object/from16 v4, v79
    goto/16 :goto_1513
    :cond_286
    const-string/jumbo v0, "᩹᩶ۨ"
    const/4 v2, 0x1
    invoke-static {v0, v2}, Ll/ܽ᩵;->ᩳ᩹֨(Ljava/lang/Object;I)C
    move-result v2
    xor-int v2, v2, v63
    const/4 v3, 0x0
    invoke-static {v0, v3}, Ll/ۡ۫;->۠ۢ᩶(Ljava/lang/Object;I)C
    move-result v3
    goto/16 :goto_483
    move/from16 v45, v0
    move/from16 v44, v3
    .line 161
    invoke-static {}, Ll/᩻ᩴ;->۟ᩳܳ()Z
    sget v0, Ll/ۙ᩻;->ܿۨ֡:I
    if-gtz v0, :goto_2a3
    goto :goto_24c
    :goto_2a3
    const-string v0, "ۜ۠ܶ"
    goto/16 :goto_43d
    move/from16 v45, v0
    move/from16 v44, v3
    .line 226
    invoke-static {}, Ll/ۘ;->۬ۖ۬()I
    goto :goto_24c
    invoke-static {}, Ll/᩺ܳ;->ۜܺܶ()I
    invoke-static {}, Ll/ܽ֫;->᩺ۙ۬()Z
    return-void
    move/from16 v45, v0
    move/from16 v44, v3
    .line 187
    invoke-static/range {v42 .. v42}, Ll/ۚ۫;->ۜ(Landroid/graphics/Bitmap;)Ll/ۚ۫;
    move-result-object v0
    invoke-virtual {v15, v0}, Ll/۟᩺;->ۖ(Ll/ۚ۫;)V
    goto :goto_2f5
    move/from16 v45, v0
    move/from16 v44, v3
    .line 189
    invoke-virtual {v15}, Ll/۟᩺;->ۖ()Ll/ۢ᩺;
    move-result-object v0
    invoke-static {v1, v0}, Ll/ᩴᩳ;->ᩴܺ᩸(Ljava/lang/Object;Ljava/lang/Object;)Z
    goto :goto_319
    move/from16 v45, v0
    move/from16 v44, v3
    .line 235
    invoke-static {v7}, Ll/۟۠ۢ;->ۖ(Ljava/lang/String;)Ljava/lang/String;
    move-result-object v0
    if-eqz v0, :cond_438
    move-object v10, v0
    goto/16 :goto_43a
    move/from16 v45, v0
    move/from16 v44, v3
    .line 184
    invoke-virtual {v15, v8}, Ll/۟᩺;->ۖ(Ljava/lang/CharSequence;)V
    goto/16 :goto_350
    move/from16 v45, v0
    move/from16 v44, v3
    if-eqz v42, :goto_2f5
    const-string v0, "ۨ᩻ۧ"
    const/4 v2, 0x1
    invoke-static {v0, v2}, Ll/ܽ᩵;->ᩳ᩹֨(Ljava/lang/Object;I)C
    move-result v2
    xor-int v2, v2, v63
    goto/16 :goto_47e
    :goto_2f5
    const-string v0, "ܽ֨ۛ"
    goto/16 :goto_43d
    move/from16 v45, v0
    move/from16 v44, v3
    .line 234
    invoke-static {v7, v4}, Ll/᩶ۤ;->ܿ᩶ۘ(Ljava/lang/Object;Ljava/lang/Object;)Z
    move-result v0
    if-eqz v0, :cond_438
    const-string v0, "ܶܽᩳ"
    goto/16 :goto_4a9
    move/from16 v45, v0
    move/from16 v44, v3
    .line 177
    invoke-static/range {v35 .. v35}, Ll/۟۠ۢ;->ۖ(Ljava/lang/String;)Ljava/lang/String;
    move-result-object v0
    goto/16 :goto_474
    move/from16 v45, v0
    move/from16 v44, v3
    if-eqz v42, :goto_319
    goto/16 :goto_40d
    :goto_319
    move-object/from16 v46, v6
    move-object/from16 v6, v23
    move-object/from16 v2, v24
    move/from16 v48, v28
    move/from16 v47, v38
    move/from16 v38, v43
    move-object/from16 v24, v1
    move-object/from16 v43, v5
    move-object/from16 v28, v18
    move/from16 v5, v29
    move-object/from16 v18, v4
    move-object/from16 v29, v7
    move/from16 v7, v68
    goto/16 :goto_d87
    move/from16 v45, v0
    move/from16 v44, v3
    .line 182
    new-instance v15, Ll/۟᩺;
    invoke-direct {v15, v9}, Ll/۟᩺;-><init>(Ll/ۢ᩺;)V
    if-eqz v8, :goto_350
    const-string v0, "ᩳ᩻᩷"
    const/4 v2, 0x0
    invoke-static {v0, v2}, Ll/ۡ۫;->۠ۢ᩶(Ljava/lang/Object;I)C
    move-result v2
    mul-int/lit16 v2, v2, 0x3c1
    const/4 v3, 0x1
    invoke-static {v0, v3}, Ll/ۡ۫;->۠ۢ᩶(Ljava/lang/Object;I)C
    move-result v3
    goto/16 :goto_4cd
    :goto_350
    const-string v0, "᩷ᩳܶ"
    const/4 v2, 0x1
    invoke-static {v0, v2}, Ll/ۡ۫;->۠ۢ᩶(Ljava/lang/Object;I)C
    move-result v2
    const/4 v3, 0x2
    invoke-static {v0, v3}, Ll/ܽ᩵;->ᩳ᩹֨(Ljava/lang/Object;I)C
    move-result v3
    mul-int v2, v2, v3
    xor-int v2, v2, v63
    const/4 v3, 0x0
    invoke-static {v0, v3}, Ll/ۡ۫;->۠ۢ᩶(Ljava/lang/Object;I)C
    move-result v0
    goto/16 :goto_4d7
    move/from16 v44, v3
    move/from16 v45, v0
    move-object/from16 v46, v6
    move/from16 v16, v17
    move-object/from16 v6, v23
    move-object/from16 v2, v24
    move/from16 v48, v28
    move/from16 v47, v38
    move/from16 v38, v43
    move-object/from16 v24, v1
    move-object/from16 v43, v5
    move-object/from16 v28, v18
    move/from16 v5, v29
    move-object/from16 v18, v4
    move-object/from16 v29, v7
    move/from16 v7, v68
    goto/16 :goto_dc9
    move/from16 v45, v0
    move/from16 v44, v3
    .line 233
    invoke-static {v13, v5}, Ll/ܽۘ;->֫֫ۨ(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/String;
    move-result-object v0
    if-eqz v0, :cond_438
    const-string v2, "ᩴۘ᩹"
    const/4 v3, 0x0
    invoke-static {v2, v3}, Ll/ۡ۫;->۠ۢ᩶(Ljava/lang/Object;I)C
    move-result v3
    mul-int/lit16 v3, v3, 0x3c1
    const/4 v7, 0x1
    invoke-static {v2, v7}, Ll/ܽ᩵;->ᩳ᩹֨(Ljava/lang/Object;I)C
    move-result v7
    mul-int/lit8 v7, v7, 0x1f
    add-int/2addr v3, v7
    xor-int v3, v3, v62
    const/4 v7, 0x2
    invoke-static {v2, v7}, Ll/ܽ᩵;->ᩳ᩹֨(Ljava/lang/Object;I)C
    move-result v2
    add-int/2addr v2, v3
    move-object v7, v0
    goto/16 :goto_611
    move/from16 v45, v0
    move/from16 v44, v3
    .line 241
    new-instance v0, Ll/۟᩺;
    invoke-direct {v0, v11}, Ll/۟᩺;-><init>(Ll/ۢ᩺;)V
    .line 242
    invoke-virtual {v0, v10}, Ll/۟᩺;->ۖ(Ljava/lang/CharSequence;)V
    .line 243
    invoke-static/range {v51 .. v51}, Ll/ۚ۫;->ۜ(Landroid/graphics/Bitmap;)Ll/ۚ۫;
    move-result-object v2
    invoke-virtual {v0, v2}, Ll/۟᩺;->ۖ(Ll/ۚ۫;)V
    .line 244
    invoke-virtual {v0}, Ll/۟᩺;->ۖ()Ll/ۢ᩺;
    move-result-object v0
    .line 241
    invoke-static {v1, v0}, Ll/ۘ۟;->ܰۨܶ(Ljava/lang/Object;Ljava/lang/Object;)Z
    goto :goto_419
    move/from16 v45, v0
    move/from16 v44, v3
    move-object/from16 v0, v35
    .line 176
    invoke-static {v0, v4}, Ll/᩶ۤ;->ܿ᩶ۘ(Ljava/lang/Object;Ljava/lang/Object;)Z
    move-result v2
    if-eqz v2, :cond_3e2
    const-string v2, "۫ۚܶ"
    invoke-static {v2}, Ll/ۙۘ;->ۙᩴ۫(Ljava/lang/Object;)I
    move-result v2
    xor-int v2, v2, v63
    move-object/from16 v35, v0
    goto/16 :goto_611
    :cond_3e2
    move-object/from16 v35, v0
    goto/16 :goto_4ec
    move/from16 v45, v0
    move/from16 v44, v3
    move-object/from16 v0, v35
    if-nez v8, :cond_40b
    const-string v2, "ۘۨۤ"
    const/4 v3, 0x0
    invoke-static {v2, v3}, Ll/ܽ᩵;->ᩳ᩹֨(Ljava/lang/Object;I)C
    move-result v3
    mul-int/lit16 v3, v3, 0x3c1
    move-object/from16 v35, v0
    const/4 v0, 0x1
    invoke-static {v2, v0}, Ll/ܽ᩵;->ᩳ᩹֨(Ljava/lang/Object;I)C
    move-result v0
    mul-int/lit8 v0, v0, 0x1f
    add-int/2addr v3, v0
    xor-int v0, v3, v63
    const/4 v3, 0x2
    invoke-static {v2, v3}, Ll/ۡ۫;->۠ۢ᩶(Ljava/lang/Object;I)C
    move-result v2
    :goto_408
    add-int/2addr v2, v0
    goto/16 :goto_611
    :cond_40b
    move-object/from16 v35, v0
    :goto_40d
    const-string v0, "ۧ֡᩶"
    const/4 v2, 0x1
    invoke-static {v0, v2}, Ll/ܽ᩵;->ᩳ᩹֨(Ljava/lang/Object;I)C
    move-result v2
    goto :goto_47c
    move/from16 v45, v0
    move/from16 v44, v3
    :goto_419
    const-string v0, "ܳܰۜ"
    goto :goto_43d
    move/from16 v45, v0
    move/from16 v44, v3
    const/4 v0, 0x0
    .line 232
    invoke-virtual {v13, v6, v0}, Landroid/content/Intent;->getBooleanExtra(Ljava/lang/String;Z)Z
    move-result v0
    if-eqz v0, :cond_438
    const-string/jumbo v0, "᩺᩷ۖ"
    const/4 v2, 0x1
    invoke-static {v0, v2}, Ll/ۡ۫;->۠ۢ᩶(Ljava/lang/Object;I)C
    move-result v2
    xor-int v2, v2, v63
    const/4 v3, 0x0
    invoke-static {v0, v3}, Ll/ܽ᩵;->ᩳ᩹֨(Ljava/lang/Object;I)C
    move-result v3
    goto/16 :goto_4b5
    :cond_438
    move-object/from16 v10, v20
    :goto_43a
    const-string/jumbo v0, "᩺۬ܽ"
    :goto_43d
    invoke-static {v0}, Ll/ۤ֨;->۬ۚᩴ(Ljava/lang/Object;)I
    move-result v0
    xor-int v2, v0, v62
    goto/16 :goto_611
    move/from16 v45, v0
    move/from16 v44, v3
    .line 175
    invoke-static {v14, v5}, Ll/ۙ֫;->ܶܳᩴ(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/String;
    move-result-object v0
    if-eqz v0, :goto_4ec
    const-string v2, "ܺۛۢ"
    const/4 v3, 0x1
    invoke-static {v2, v3}, Ll/ۡ۫;->۠ۢ᩶(Ljava/lang/Object;I)C
    move-result v3
    move-object/from16 v46, v0
    const/4 v0, 0x2
    invoke-static {v2, v0}, Ll/ܽ᩵;->ᩳ᩹֨(Ljava/lang/Object;I)C
    move-result v0
    mul-int v3, v3, v0
    xor-int v0, v3, v63
    const/4 v3, 0x0
    invoke-static {v2, v3}, Ll/ܽ᩵;->ᩳ᩹֨(Ljava/lang/Object;I)C
    move-result v2
    add-int/2addr v2, v0
    move/from16 v3, v44
    move/from16 v0, v45
    move-object/from16 v35, v46
    goto/16 :goto_d6
    move/from16 v45, v0
    move/from16 v44, v3
    const/4 v0, 0x0
    :goto_474
    move-object v8, v0
    const-string v0, "ܳܰۗ"
    const/4 v2, 0x1
    invoke-static {v0, v2}, Ll/ۡ۫;->۠ۢ᩶(Ljava/lang/Object;I)C
    move-result v2
    :goto_47c
    xor-int v2, v2, v62
    :goto_47e
    const/4 v3, 0x0
    invoke-static {v0, v3}, Ll/ܽ᩵;->ᩳ᩹֨(Ljava/lang/Object;I)C
    move-result v3
    :goto_483
    mul-int v2, v2, v3
    const/4 v3, 0x2
    invoke-static {v0, v3}, Ll/ܽ᩵;->ᩳ᩹֨(Ljava/lang/Object;I)C
    move-result v0
    goto :goto_4bc
    move/from16 v45, v0
    move/from16 v44, v3
    .line 227
    invoke-static/range {v18 .. v18}, Lbin/mt/plus/ShortcutActivity;->ۖ(Ljava/lang/String;)Landroid/graphics/Bitmap;
    move-result-object v0
    move-object/from16 v51, v0
    move-object/from16 v2, v18
    move/from16 v3, v38
    move/from16 v38, v43
    move-object/from16 v18, v4
    move-object/from16 v43, v5
    goto/16 :goto_5b0
    move/from16 v45, v0
    move/from16 v44, v3
    if-nez v51, :cond_4bf
    const-string v0, "ܺۡܽ"
    :goto_4a9
    const/4 v2, 0x1
    invoke-static {v0, v2}, Ll/ܽ᩵;->ᩳ᩹֨(Ljava/lang/Object;I)C
    move-result v2
    xor-int v2, v2, v63
    const/4 v3, 0x0
    invoke-static {v0, v3}, Ll/ۡ۫;->۠ۢ᩶(Ljava/lang/Object;I)C
    move-result v3
    :goto_4b5
    mul-int v2, v2, v3
    const/4 v3, 0x2
    invoke-static {v0, v3}, Ll/ۡ۫;->۠ۢ᩶(Ljava/lang/Object;I)C
    move-result v0
    :goto_4bc
    sub-int/2addr v2, v0
    goto/16 :goto_611
    :cond_4bf
    const-string v0, "ۛۗۙ"
    const/4 v2, 0x0
    invoke-static {v0, v2}, Ll/ܽ᩵;->ᩳ᩹֨(Ljava/lang/Object;I)C
    move-result v2
    mul-int/lit16 v2, v2, 0x3c1
    const/4 v3, 0x1
    invoke-static {v0, v3}, Ll/ܽ᩵;->ᩳ᩹֨(Ljava/lang/Object;I)C
    move-result v3
    :goto_4cd
    mul-int/lit8 v3, v3, 0x1f
    add-int/2addr v2, v3
    xor-int v2, v2, v62
    const/4 v3, 0x2
    invoke-static {v0, v3}, Ll/ܽ᩵;->ᩳ᩹֨(Ljava/lang/Object;I)C
    move-result v0
    :goto_4d7
    add-int/2addr v2, v0
    goto/16 :goto_611
    move/from16 v45, v0
    move/from16 v44, v3
    .line 174
    invoke-virtual {v14, v6, v12}, Landroid/content/Intent;->getBooleanExtra(Ljava/lang/String;Z)Z
    move-result v0
    if-eqz v0, :goto_4ec
    const-string/jumbo v0, "᩻֫ۡ"
    invoke-static {v0}, Ll/ۙۘ;->ۙᩴ۫(Ljava/lang/Object;)I
    move-result v0
    goto :goto_4f2
    :goto_4ec
    const-string v0, "ۤ۬᩻"
    invoke-static {v0}, Ll/ۤ֨;->۬ۚᩴ(Ljava/lang/Object;)I
    move-result v0
    :goto_4f2
    xor-int v2, v0, v63
    goto/16 :goto_611
    move/from16 v45, v0
    move/from16 v44, v3
    .line 168
    sget-object v0, Ll/ᩳܳۢ;->᩺ۖ:Ll/ܺܳۢ;
    invoke-virtual {v0}, Ll/ܺܳۢ;->᩸()I
    move-result v0
    move/from16 v2, v45
    invoke-static {v0, v2, v12}, Ll/᩵᩸֨;->ۖ(IIZ)Landroid/graphics/Bitmap;
    move-result-object v0
    move-object/from16 v42, v0
    goto :goto_520
    move v2, v0
    move/from16 v44, v3
    .line 171
    sget-object v0, Ll/ᩳܳۢ;->ᩳ:Ll/ᩳܳۢ;
    .line 244
    iget-object v3, v0, Ll/ᩳܳۢ;->ۖ:Ll/ܺܳۢ;
    invoke-virtual {v3}, Ll/ܺܳۢ;->᩸()I
    move-result v3
    iget-object v0, v0, Ll/ᩳܳۢ;->ۢ:Ll/ܶܳۢ;
    iget v0, v0, Ll/ܶܳۢ;->ۢۖ:I
    invoke-static {v3, v0, v12}, Ll/᩵᩸֨;->ۖ(IIZ)Landroid/graphics/Bitmap;
    move-result-object v0
    move-object/from16 v42, v0
    move/from16 v45, v2
    :goto_520
    move-object/from16 v2, v18
    move/from16 v3, v38
    move/from16 v38, v43
    move-object/from16 v18, v4
    move-object/from16 v43, v5
    move/from16 v4, v30
    goto/16 :goto_5fc
    move/from16 v44, v3
    .line 195
    invoke-static/range {v44 .. v44}, Ll/۟᩸;->ܿ᩵֨(I)V
    return-void
    move v2, v0
    move/from16 v44, v3
    const/4 v0, 0x1
    move/from16 v45, v2
    move-object/from16 v46, v6
    move/from16 v3, v38
    move-object/from16 v34, v40
    move/from16 v38, v43
    const/16 v17, 0x1
    move-object/from16 v43, v5
    move/from16 v5, v29
    move-object/from16 v29, v7
    move/from16 v7, v68
    move-object/from16 v83, v18
    move-object/from16 v18, v4
    move/from16 v4, v28
    move-object/from16 v28, v83
    goto/16 :goto_7b0
    move v2, v0
    move/from16 v44, v3
    .line 221
    sget-object v0, Ll/ᩳܳۢ;->᩺ۖ:Ll/ܺܳۢ;
    invoke-virtual {v0}, Ll/ܺܳۢ;->᩸()I
    move-result v0
    move/from16 v45, v2
    move/from16 v3, v38
    move/from16 v2, v43
    invoke-static {v0, v2, v3}, Ll/᩵᩸֨;->ۖ(IIZ)Landroid/graphics/Bitmap;
    move-result-object v0
    move/from16 v38, v2
    move-object/from16 v2, v18
    .line 222
    invoke-static {v2, v0}, Lbin/mt/plus/ShortcutActivity;->ۖ(Ljava/lang/String;Landroid/graphics/Bitmap;)V
    move-object/from16 v40, v0
    move-object/from16 v18, v4
    move-object/from16 v43, v5
    move-object/from16 v46, v6
    move/from16 v4, v28
    move/from16 v5, v29
    move-object/from16 v29, v7
    move/from16 v7, v68
    goto/16 :goto_726
    move/from16 v45, v0
    move/from16 v44, v3
    move-object/from16 v2, v18
    move/from16 v3, v38
    move/from16 v38, v43
    if-nez v34, :cond_5aa
    const-string v0, "ۗܶ֫"
    move-object/from16 v18, v4
    const/4 v4, 0x1
    invoke-static {v0, v4}, Ll/ܽ᩵;->ᩳ᩹֨(Ljava/lang/Object;I)C
    move-result v4
    xor-int v4, v4, v62
    move-object/from16 v43, v5
    const/4 v5, 0x0
    invoke-static {v0, v5}, Ll/ۡ۫;->۠ۢ᩶(Ljava/lang/Object;I)C
    move-result v5
    mul-int v4, v4, v5
    const/4 v5, 0x2
    invoke-static {v0, v5}, Ll/ܽ᩵;->ᩳ᩹֨(Ljava/lang/Object;I)C
    move-result v0
    sub-int v0, v4, v0
    goto :goto_606
    :cond_5aa
    move-object/from16 v18, v4
    move-object/from16 v43, v5
    move-object/from16 v51, v34
    :goto_5b0
    const-string v0, "ۧۗۢ"
    const/4 v4, 0x0
    invoke-static {v0, v4}, Ll/ܽ᩵;->ᩳ᩹֨(Ljava/lang/Object;I)C
    move-result v4
    mul-int/lit16 v4, v4, 0x3c1
    const/4 v5, 0x1
    invoke-static {v0, v5}, Ll/ܽ᩵;->ᩳ᩹֨(Ljava/lang/Object;I)C
    move-result v5
    mul-int/lit8 v5, v5, 0x1f
    add-int/2addr v4, v5
    xor-int v4, v4, v63
    const/4 v5, 0x2
    invoke-static {v0, v5}, Ll/ۡ۫;->۠ۢ᩶(Ljava/lang/Object;I)C
    move-result v0
    add-int/2addr v0, v4
    goto :goto_606
    .line 249
    invoke-static/range {v33 .. v33}, Ll/ۘ᩺;->ۛۘܿ(I)V
    return-void
    move/from16 v45, v0
    move/from16 v44, v3
    move-object/from16 v2, v18
    move/from16 v3, v38
    move/from16 v38, v43
    move-object/from16 v18, v4
    move-object/from16 v43, v5
    .line 163
    sget-object v0, Ll/ᩳܳۢ;->ۘۖ:Ll/ܺܳۢ;
    invoke-virtual {v0}, Ll/ܺܳۢ;->᩸()I
    move-result v0
    move/from16 v4, v30
    invoke-static {v0, v4, v12}, Ll/᩵᩸֨;->ۖ(IIZ)Landroid/graphics/Bitmap;
    move-result-object v0
    goto :goto_5fa
    move/from16 v45, v0
    move/from16 v44, v3
    move-object/from16 v2, v18
    move/from16 v3, v38
    move/from16 v38, v43
    move-object/from16 v18, v4
    move-object/from16 v43, v5
    move/from16 v4, v30
    const/4 v0, 0x0
    :goto_5fa
    move-object/from16 v42, v0
    :goto_5fc
    const-string v0, "ۢ᩻ܿ"
    invoke-static {v0}, Ll/ۙۘ;->ۙᩴ۫(Ljava/lang/Object;)I
    move-result v0
    xor-int v0, v0, v62
    move/from16 v30, v4
    :goto_606
    move-object/from16 v4, v18
    move-object/from16 v5, v43
    move-object/from16 v18, v2
    move/from16 v43, v38
    move v2, v0
    move/from16 v38, v3
    :goto_611
    move/from16 v3, v44
    move/from16 v0, v45
    goto/16 :goto_d6
    move/from16 v45, v0
    move/from16 v44, v3
    move-object/from16 v2, v18
    move/from16 v3, v38
    move/from16 v38, v43
    move-object/from16 v18, v4
    move-object/from16 v43, v5
    move/from16 v4, v30
    .line 166
    invoke-static/range {v27 .. v27}, Ll/ᩳܳۢ;->ۖ(Ljava/lang/String;)I
    move-result v0
    move/from16 v5, v29
    if-eq v0, v5, :cond_65f
    move/from16 v29, v0
    const-string v0, "ۖ֫᩶"
    move/from16 v30, v4
    const/4 v4, 0x0
    invoke-static {v0, v4}, Ll/ۡ۫;->۠ۢ᩶(Ljava/lang/Object;I)C
    move-result v4
    mul-int/lit16 v4, v4, 0x3c1
    move-object/from16 v46, v6
    const/4 v6, 0x1
    invoke-static {v0, v6}, Ll/ܽ᩵;->ᩳ᩹֨(Ljava/lang/Object;I)C
    move-result v6
    mul-int/lit8 v6, v6, 0x1f
    add-int/2addr v4, v6
    xor-int v4, v4, v62
    const/4 v6, 0x2
    invoke-static {v0, v6}, Ll/ۡ۫;->۠ۢ᩶(Ljava/lang/Object;I)C
    move-result v0
    add-int/2addr v0, v4
    move-object/from16 v4, v18
    move-object/from16 v6, v46
    move-object/from16 v18, v2
    move v2, v0
    move/from16 v0, v29
    move/from16 v29, v5
    move-object/from16 v5, v43
    move/from16 v43, v38
    goto/16 :goto_6ef
    :cond_65f
    move/from16 v30, v4
    move-object/from16 v46, v6
    move-object/from16 v29, v7
    move/from16 v4, v28
    move/from16 v7, v68
    goto :goto_6a7
    move/from16 v45, v0
    move/from16 v44, v3
    move-object/from16 v46, v6
    move-object/from16 v2, v18
    move/from16 v3, v38
    move/from16 v38, v43
    move-object/from16 v18, v4
    move-object/from16 v43, v5
    move/from16 v5, v29
    .line 168
    sget-object v0, Lbin/mt/plus/ShortcutActivity;->۠ܶۧ:[S
    const/16 v4, 0x4b
    const/4 v6, 0x5
    move-object/from16 v29, v7
    move/from16 v7, v68
    invoke-static {v0, v4, v6, v7}, Ll/ۤۛ;->ܳ᩺۫([SIII)Ljava/lang/String;
    move-result-object v0
    .line 170
    invoke-virtual {v14, v0, v12}, Landroid/content/Intent;->getBooleanExtra(Ljava/lang/String;Z)Z
    move-result v0
    if-eqz v0, :cond_6a5
    const-string v0, "ܰ᩷᩷"
    const/4 v4, 0x1
    invoke-static {v0, v4}, Ll/ۡ۫;->۠ۢ᩶(Ljava/lang/Object;I)C
    move-result v4
    const/4 v6, 0x2
    invoke-static {v0, v6}, Ll/ۡ۫;->۠ۢ᩶(Ljava/lang/Object;I)C
    move-result v6
    mul-int v4, v4, v6
    xor-int v4, v4, v63
    const/4 v6, 0x0
    invoke-static {v0, v6}, Ll/ۡ۫;->۠ۢ᩶(Ljava/lang/Object;I)C
    move-result v0
    goto :goto_6db
    :cond_6a5
    move/from16 v4, v28
    :goto_6a7
    move-object/from16 v28, v2
    goto/16 :goto_863
    move/from16 v45, v0
    move/from16 v44, v3
    move-object/from16 v46, v6
    move-object/from16 v2, v18
    move/from16 v3, v38
    move/from16 v38, v43
    move-object/from16 v18, v4
    move-object/from16 v43, v5
    move/from16 v5, v29
    move-object/from16 v29, v7
    move/from16 v7, v68
    if-eqz v87, :cond_6f5
    const-string v0, "ܳ᩺᩹"
    const/4 v4, 0x0
    invoke-static {v0, v4}, Ll/ܽ᩵;->ᩳ᩹֨(Ljava/lang/Object;I)C
    move-result v4
    mul-int/lit16 v4, v4, 0x3c1
    const/4 v6, 0x1
    invoke-static {v0, v6}, Ll/ۡ۫;->۠ۢ᩶(Ljava/lang/Object;I)C
    move-result v6
    mul-int/lit8 v6, v6, 0x1f
    add-int/2addr v4, v6
    xor-int v4, v4, v62
    const/4 v6, 0x2
    invoke-static {v0, v6}, Ll/ܽ᩵;->ᩳ᩹֨(Ljava/lang/Object;I)C
    move-result v0
    :goto_6db
    add-int/2addr v0, v4
    move/from16 v68, v7
    move-object/from16 v4, v18
    move-object/from16 v7, v29
    move-object/from16 v6, v46
    move-object/from16 v18, v2
    move/from16 v29, v5
    move-object/from16 v5, v43
    move v2, v0
    move/from16 v43, v38
    move/from16 v0, v45
    :goto_6ef
    move/from16 v38, v3
    move/from16 v3, v44
    goto/16 :goto_d6
    :cond_6f5
    move-object/from16 v0, v86
    move/from16 v47, v3
    move/from16 v4, v28
    move-object/from16 v28, v2
    goto/16 :goto_a1f
    move/from16 v45, v0
    move/from16 v44, v3
    move-object/from16 v46, v6
    move-object/from16 v2, v18
    move/from16 v3, v38
    move/from16 v38, v43
    move-object/from16 v18, v4
    move-object/from16 v43, v5
    move/from16 v5, v29
    move-object/from16 v29, v7
    move/from16 v7, v68
    .line 214
    sget-object v0, Ll/ᩳܳۢ;->ۘۖ:Ll/ܺܳۢ;
    invoke-virtual {v0}, Ll/ܺܳۢ;->᩸()I
    move-result v0
    move/from16 v4, v28
    invoke-static {v0, v4, v3}, Ll/᩵᩸֨;->ۖ(IIZ)Landroid/graphics/Bitmap;
    move-result-object v0
    .line 215
    invoke-static {v2, v0}, Lbin/mt/plus/ShortcutActivity;->ۖ(Ljava/lang/String;Landroid/graphics/Bitmap;)V
    move-object/from16 v40, v0
    :goto_726
    const-string v0, "ۢܿۜ"
    const/4 v6, 0x1
    invoke-static {v0, v6}, Ll/ۡ۫;->۠ۢ᩶(Ljava/lang/Object;I)C
    move-result v6
    xor-int v6, v6, v63
    move-object/from16 v28, v2
    const/4 v2, 0x0
    invoke-static {v0, v2}, Ll/ۡ۫;->۠ۢ᩶(Ljava/lang/Object;I)C
    move-result v2
    mul-int v6, v6, v2
    const/4 v2, 0x2
    invoke-static {v0, v2}, Ll/ܽ᩵;->ᩳ᩹֨(Ljava/lang/Object;I)C
    move-result v0
    sub-int v2, v6, v0
    goto/16 :goto_8dc
    move/from16 v45, v0
    move/from16 v44, v3
    move-object/from16 v46, v6
    move/from16 v3, v38
    move/from16 v38, v43
    move-object/from16 v43, v5
    move/from16 v5, v29
    move-object/from16 v29, v7
    move/from16 v7, v68
    move-object/from16 v83, v18
    move-object/from16 v18, v4
    move/from16 v4, v28
    move-object/from16 v28, v83
    .line 219
    invoke-static/range {v22 .. v22}, Ll/ᩳܳۢ;->ۖ(Ljava/lang/String;)I
    move-result v0
    if-eq v0, v5, :cond_78d
    const-string v2, "᩵ۚۛ"
    const/4 v6, 0x1
    invoke-static {v2, v6}, Ll/ܽ᩵;->ᩳ᩹֨(Ljava/lang/Object;I)C
    move-result v6
    move/from16 v47, v0
    const/4 v0, 0x2
    invoke-static {v2, v0}, Ll/ۡ۫;->۠ۢ᩶(Ljava/lang/Object;I)C
    move-result v0
    mul-int v6, v6, v0
    xor-int v0, v6, v63
    const/4 v6, 0x0
    invoke-static {v2, v6}, Ll/ܽ᩵;->ᩳ᩹֨(Ljava/lang/Object;I)C
    move-result v2
    add-int/2addr v2, v0
    move/from16 v38, v3
    move/from16 v68, v7
    move-object/from16 v7, v29
    move/from16 v3, v44
    move/from16 v0, v45
    move-object/from16 v6, v46
    move/from16 v29, v5
    move-object/from16 v5, v43
    move/from16 v43, v47
    goto/16 :goto_a47
    :cond_78d
    move-object/from16 v0, v86
    goto/16 :goto_9a2
    move/from16 v45, v0
    move/from16 v44, v3
    move-object/from16 v46, v6
    move/from16 v3, v38
    move/from16 v38, v43
    move-object/from16 v43, v5
    move/from16 v5, v29
    move-object/from16 v29, v7
    move/from16 v7, v68
    move-object/from16 v83, v18
    move-object/from16 v18, v4
    move/from16 v4, v28
    move-object/from16 v28, v83
    const/4 v0, 0x0
    move-object/from16 v34, v0
    move/from16 v17, v16
    :goto_7b0
    const-string v0, "۬ۧۨ"
    const/4 v2, 0x1
    invoke-static {v0, v2}, Ll/ܽ᩵;->ᩳ᩹֨(Ljava/lang/Object;I)C
    move-result v2
    const/4 v6, 0x2
    invoke-static {v0, v6}, Ll/ۡ۫;->۠ۢ᩶(Ljava/lang/Object;I)C
    move-result v6
    mul-int v2, v2, v6
    xor-int v2, v2, v62
    const/4 v6, 0x0
    goto/16 :goto_8ac
    move/from16 v45, v0
    move/from16 v44, v3
    move-object/from16 v46, v6
    move/from16 v3, v38
    move/from16 v38, v43
    move-object/from16 v43, v5
    move/from16 v5, v29
    move-object/from16 v29, v7
    move/from16 v7, v68
    move-object/from16 v83, v18
    move-object/from16 v18, v4
    move/from16 v4, v28
    move-object/from16 v28, v83
    if-eqz v87, :cond_817
    const-string v0, "ۖۢ᩶"
    invoke-static {v0}, Ll/ۤ֨;->۬ۚᩴ(Ljava/lang/Object;)I
    move-result v0
    xor-int v2, v0, v63
    goto/16 :goto_8dc
    move/from16 v45, v0
    move/from16 v44, v3
    move-object/from16 v46, v6
    move/from16 v3, v38
    move/from16 v38, v43
    move-object/from16 v43, v5
    move/from16 v5, v29
    move-object/from16 v29, v7
    move/from16 v7, v68
    move-object/from16 v83, v18
    move-object/from16 v18, v4
    move/from16 v4, v28
    move-object/from16 v28, v83
    .line 249
    sget-object v0, Lbin/mt/plus/ShortcutActivity;->۠ܶۧ:[S
    const/16 v2, 0x48
    const/4 v6, 0x3
    invoke-static {v0, v2, v6, v7}, Ll/ۤ֫;->᩻᩸ۘ([SIII)Ljava/lang/String;
    move-result-object v0
    invoke-static {v0}, Ll/ۤ֨;->۬ۚᩴ(Ljava/lang/Object;)I
    move-result v0
    const v2, 0x7e6f59d4
    xor-int/2addr v0, v2
    .line 254
    invoke-static {v0}, Ll/ۘ᩺;->ۛۘܿ(I)V
    :cond_817
    move-object/from16 v0, v86
    move/from16 v47, v3
    goto/16 :goto_a1f
    return-void
    move/from16 v45, v0
    move/from16 v44, v3
    move-object/from16 v46, v6
    move/from16 v3, v38
    move/from16 v38, v43
    move-object/from16 v43, v5
    move/from16 v5, v29
    move-object/from16 v29, v7
    move/from16 v7, v68
    move-object/from16 v83, v18
    move-object/from16 v18, v4
    move/from16 v4, v28
    move-object/from16 v28, v83
    .line 161
    invoke-static/range {v26 .. v26}, Ll/ᩳܳۢ;->ۖ(Ljava/lang/String;)I
    move-result v0
    if-eq v0, v5, :goto_863
    const-string v2, "֫᩷᩶"
    const/4 v6, 0x1
    invoke-static {v2, v6}, Ll/ܽ᩵;->ᩳ᩹֨(Ljava/lang/Object;I)C
    move-result v6
    xor-int v6, v6, v62
    move/from16 v47, v0
    const/4 v0, 0x0
    invoke-static {v2, v0}, Ll/ۡ۫;->۠ۢ᩶(Ljava/lang/Object;I)C
    move-result v0
    mul-int v6, v6, v0
    const/4 v0, 0x2
    invoke-static {v2, v0}, Ll/ۡ۫;->۠ۢ᩶(Ljava/lang/Object;I)C
    move-result v0
    sub-int v2, v6, v0
    move/from16 v68, v7
    move-object/from16 v7, v29
    move/from16 v0, v45
    move-object/from16 v6, v46
    move/from16 v30, v47
    goto/16 :goto_8e4
    :goto_863
    const-string v0, "۫ۖܽ"
    invoke-static {v0}, Ll/ۙۘ;->ۙᩴ۫(Ljava/lang/Object;)I
    move-result v0
    xor-int v2, v0, v62
    goto/16 :goto_8dc
    move/from16 v45, v0
    move/from16 v44, v3
    move-object/from16 v46, v6
    move/from16 v3, v38
    move/from16 v38, v43
    move-object/from16 v43, v5
    move/from16 v5, v29
    move-object/from16 v29, v7
    move/from16 v7, v68
    move-object/from16 v83, v18
    move-object/from16 v18, v4
    move/from16 v4, v28
    move-object/from16 v28, v83
    if-eqz v27, :cond_898
    const-string v0, "۟ۙۚ"
    const/4 v2, 0x0
    invoke-static {v0, v2}, Ll/ۡ۫;->۠ۢ᩶(Ljava/lang/Object;I)C
    move-result v2
    mul-int/lit16 v2, v2, 0x3c1
    const/4 v6, 0x1
    invoke-static {v0, v6}, Ll/ܽ᩵;->ᩳ᩹֨(Ljava/lang/Object;I)C
    move-result v6
    goto :goto_8a6
    :cond_898
    const-string v0, "ܽ֡ܰ"
    const/4 v2, 0x0
    invoke-static {v0, v2}, Ll/ܽ᩵;->ᩳ᩹֨(Ljava/lang/Object;I)C
    move-result v2
    mul-int/lit16 v2, v2, 0x3c1
    const/4 v6, 0x1
    invoke-static {v0, v6}, Ll/ۡ۫;->۠ۢ᩶(Ljava/lang/Object;I)C
    move-result v6
    :goto_8a6
    mul-int/lit8 v6, v6, 0x1f
    add-int/2addr v2, v6
    xor-int v2, v2, v63
    const/4 v6, 0x2
    :goto_8ac
    invoke-static {v0, v6}, Ll/ۡ۫;->۠ۢ᩶(Ljava/lang/Object;I)C
    move-result v0
    add-int/2addr v2, v0
    goto :goto_8dc
    move/from16 v45, v0
    move/from16 v44, v3
    move-object/from16 v46, v6
    move/from16 v3, v38
    move/from16 v38, v43
    move-object/from16 v0, v86
    move-object/from16 v43, v5
    move/from16 v5, v29
    move-object/from16 v29, v7
    move/from16 v7, v68
    move-object/from16 v83, v18
    move-object/from16 v18, v4
    move/from16 v4, v28
    move-object/from16 v28, v83
    .line 193
    invoke-static {v0, v1}, Ll/֨᩺;->ۜ(Ll/۠ᩴۡ;Ljava/util/ArrayList;)Z
    move-result v2
    if-nez v2, :cond_8f0
    const-string v2, "ۗ᩸ܶ"
    invoke-static {v2}, Ll/ۤ֨;->۬ۚᩴ(Ljava/lang/Object;)I
    move-result v2
    xor-int v2, v2, v62
    :goto_8dc
    move/from16 v68, v7
    move-object/from16 v7, v29
    move/from16 v0, v45
    move-object/from16 v6, v46
    :goto_8e4
    move/from16 v29, v5
    move-object/from16 v5, v43
    move/from16 v43, v38
    move/from16 v38, v3
    move/from16 v3, v44
    goto/16 :goto_a47
    :cond_8f0
    move/from16 v47, v3
    move/from16 v48, v4
    move-object/from16 v6, v23
    move-object/from16 v2, v24
    goto/16 :goto_b09
    move/from16 v45, v0
    move/from16 v44, v3
    move-object/from16 v46, v6
    move/from16 v3, v38
    move/from16 v38, v43
    move-object/from16 v0, v86
    move-object/from16 v43, v5
    move/from16 v5, v29
    move-object/from16 v29, v7
    move/from16 v7, v68
    move-object/from16 v83, v18
    move-object/from16 v18, v4
    move/from16 v4, v28
    move-object/from16 v28, v83
    .line 200
    invoke-static {v1}, Ll/ۙۘ;->ۙܰۤ(Ljava/lang/Object;)V
    move/from16 v47, v3
    move/from16 v48, v4
    move-object/from16 v6, v23
    move-object/from16 v0, v24
    move/from16 v3, v82
    move-object/from16 v24, v1
    move-object/from16 v1, v81
    goto/16 :goto_e54
    move/from16 v45, v0
    move/from16 v44, v3
    move-object/from16 v46, v6
    move/from16 v3, v38
    move/from16 v38, v43
    move-object/from16 v0, v86
    move-object/from16 v43, v5
    move/from16 v5, v29
    move-object/from16 v29, v7
    move/from16 v7, v68
    move-object/from16 v83, v18
    move-object/from16 v18, v4
    move/from16 v4, v28
    move-object/from16 v28, v83
    .line 212
    invoke-static/range {v21 .. v21}, Ll/ᩳܳۢ;->ۖ(Ljava/lang/String;)I
    move-result v2
    if-eq v2, v5, :goto_9a2
    const-string v4, "ۗ۟۟"
    invoke-static {v4}, Ll/ۤ֨;->۬ۚᩴ(Ljava/lang/Object;)I
    move-result v4
    xor-int v4, v4, v62
    move/from16 v68, v7
    move-object/from16 v7, v29
    move/from16 v0, v45
    move-object/from16 v6, v46
    move/from16 v29, v5
    move-object/from16 v5, v43
    move/from16 v43, v38
    move/from16 v38, v3
    move/from16 v3, v44
    move-object/from16 v83, v28
    move/from16 v28, v2
    move v2, v4
    goto/16 :goto_a4b
    move/from16 v45, v0
    move/from16 v44, v3
    move-object/from16 v46, v6
    move/from16 v3, v38
    move/from16 v38, v43
    move-object/from16 v0, v86
    move-object/from16 v43, v5
    move/from16 v5, v29
    move-object/from16 v29, v7
    move/from16 v7, v68
    move-object/from16 v83, v18
    move-object/from16 v18, v4
    move/from16 v4, v28
    move-object/from16 v28, v83
    if-eqz v22, :goto_9a2
    const-string v2, "ᩳܶᩴ"
    const/4 v6, 0x0
    invoke-static {v2, v6}, Ll/ܽ᩵;->ᩳ᩹֨(Ljava/lang/Object;I)C
    move-result v6
    mul-int/lit16 v6, v6, 0x3c1
    move/from16 v47, v3
    const/4 v3, 0x1
    invoke-static {v2, v3}, Ll/ܽ᩵;->ᩳ᩹֨(Ljava/lang/Object;I)C
    move-result v3
    mul-int/lit8 v3, v3, 0x1f
    add-int/2addr v6, v3
    xor-int v3, v6, v63
    const/4 v6, 0x2
    goto/16 :goto_a1a
    :goto_9a2
    move/from16 v47, v3
    const-string v2, "ۘᩴۘ"
    invoke-static {v2}, Ll/ۤ֨;->۬ۚᩴ(Ljava/lang/Object;)I
    move-result v2
    xor-int v2, v2, v62
    goto/16 :goto_a35
    move/from16 v45, v0
    move/from16 v44, v3
    move-object/from16 v46, v6
    move/from16 v47, v38
    move/from16 v38, v43
    move-object/from16 v0, v86
    move-object/from16 v43, v5
    move/from16 v5, v29
    move-object/from16 v29, v7
    move/from16 v7, v68
    move-object/from16 v83, v18
    move-object/from16 v18, v4
    move/from16 v4, v28
    move-object/from16 v28, v83
    .line 247
    invoke-static {v0, v1}, Ll/֨᩺;->ۖ(Ll/۠ᩴۡ;Ljava/util/ArrayList;)Z
    move-result v2
    if-nez v2, :cond_9e1
    const-string v2, "ۚۤᩴ"
    const/4 v3, 0x1
    invoke-static {v2, v3}, Ll/ܽ᩵;->ᩳ᩹֨(Ljava/lang/Object;I)C
    move-result v3
    const/4 v6, 0x2
    invoke-static {v2, v6}, Ll/ۡ۫;->۠ۢ᩶(Ljava/lang/Object;I)C
    move-result v6
    mul-int v3, v3, v6
    xor-int v3, v3, v63
    goto :goto_a2f
    :cond_9e1
    move/from16 v48, v4
    move-object/from16 v6, v23
    move-object/from16 v2, v24
    move-object/from16 v24, v1
    goto/16 :goto_cbc
    move/from16 v45, v0
    move/from16 v44, v3
    move-object/from16 v46, v6
    move/from16 v47, v38
    move/from16 v38, v43
    move-object/from16 v0, v86
    move-object/from16 v43, v5
    move/from16 v5, v29
    move-object/from16 v29, v7
    move/from16 v7, v68
    move-object/from16 v83, v18
    move-object/from16 v18, v4
    move/from16 v4, v28
    move-object/from16 v28, v83
    if-eqz v87, :goto_a1f
    const-string v2, "ۡ֫۠"
    const/4 v3, 0x1
    invoke-static {v2, v3}, Ll/ۡ۫;->۠ۢ᩶(Ljava/lang/Object;I)C
    move-result v3
    const/4 v6, 0x2
    invoke-static {v2, v6}, Ll/ܽ᩵;->ᩳ᩹֨(Ljava/lang/Object;I)C
    move-result v6
    mul-int v3, v3, v6
    xor-int v3, v3, v63
    const/4 v6, 0x0
    :goto_a1a
    invoke-static {v2, v6}, Ll/ܽ᩵;->ᩳ᩹֨(Ljava/lang/Object;I)C
    move-result v2
    goto :goto_a34
    :goto_a1f
    const-string v2, "᩷ܿۤ"
    const/4 v3, 0x1
    invoke-static {v2, v3}, Ll/ۡ۫;->۠ۢ᩶(Ljava/lang/Object;I)C
    move-result v3
    const/4 v6, 0x2
    invoke-static {v2, v6}, Ll/ۡ۫;->۠ۢ᩶(Ljava/lang/Object;I)C
    move-result v6
    mul-int v3, v3, v6
    xor-int v3, v3, v62
    :goto_a2f
    const/4 v6, 0x0
    invoke-static {v2, v6}, Ll/ۡ۫;->۠ۢ᩶(Ljava/lang/Object;I)C
    move-result v2
    :goto_a34
    add-int/2addr v2, v3
    :goto_a35
    move/from16 v68, v7
    move-object/from16 v7, v29
    move/from16 v3, v44
    move/from16 v0, v45
    move-object/from16 v6, v46
    move/from16 v29, v5
    move-object/from16 v5, v43
    move/from16 v43, v38
    move/from16 v38, v47
    :goto_a47
    move-object/from16 v83, v28
    move/from16 v28, v4
    :goto_a4b
    move-object/from16 v4, v18
    move-object/from16 v18, v83
    goto/16 :goto_d6
    move/from16 v45, v0
    move/from16 v44, v3
    move-object/from16 v46, v6
    move/from16 v47, v38
    move/from16 v38, v43
    move-object/from16 v0, v86
    move-object/from16 v43, v5
    move/from16 v5, v29
    move-object/from16 v29, v7
    move/from16 v7, v68
    move-object/from16 v83, v18
    move-object/from16 v18, v4
    move/from16 v4, v28
    move-object/from16 v28, v83
    .line 154
    invoke-static/range {v25 .. v25}, Ll/ܽ֫;->᩺֨ۢ(Ljava/lang/Object;)Ljava/lang/Object;
    move-result-object v2
    move-object v9, v2
    check-cast v9, Ll/ۢ᩺;
    .line 155
    invoke-virtual {v9}, Ll/ۢ᩺;->ۜ()Landroid/content/Intent;
    move-result-object v14
    move-object/from16 v2, v24
    .line 156
    invoke-static {v14, v2}, Ll/ܽۘ;->֫֫ۨ(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/String;
    move-result-object v3
    move-object/from16 v6, v23
    .line 157
    invoke-static {v14, v6}, Ll/ۙ֫;->ܶܳᩴ(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/String;
    move-result-object v23
    if-eqz v3, :cond_aaa
    const-string v0, "ۛᩳ۟"
    move-object/from16 v24, v3
    const/4 v3, 0x1
    invoke-static {v0, v3}, Ll/ܽ᩵;->ᩳ᩹֨(Ljava/lang/Object;I)C
    move-result v3
    move/from16 v48, v4
    const/4 v4, 0x2
    invoke-static {v0, v4}, Ll/ۡ۫;->۠ۢ᩶(Ljava/lang/Object;I)C
    move-result v4
    mul-int v3, v3, v4
    xor-int v3, v3, v62
    const/4 v4, 0x0
    invoke-static {v0, v4}, Ll/ܽ᩵;->ᩳ᩹֨(Ljava/lang/Object;I)C
    move-result v0
    add-int/2addr v0, v3
    move-object/from16 v23, v6
    move/from16 v68, v7
    move-object/from16 v4, v18
    move-object/from16 v26, v24
    goto/16 :goto_de8
    :cond_aaa
    move/from16 v48, v4
    const-string v0, "᩷ܺۜ"
    const/4 v3, 0x1
    invoke-static {v0, v3}, Ll/ۡ۫;->۠ۢ᩶(Ljava/lang/Object;I)C
    move-result v3
    const/4 v4, 0x2
    invoke-static {v0, v4}, Ll/ܽ᩵;->ᩳ᩹֨(Ljava/lang/Object;I)C
    move-result v4
    mul-int v3, v3, v4
    xor-int v3, v3, v63
    const/4 v4, 0x0
    invoke-static {v0, v4}, Ll/ۡ۫;->۠ۢ᩶(Ljava/lang/Object;I)C
    move-result v0
    add-int/2addr v0, v3
    move-object/from16 v24, v2
    move/from16 v68, v7
    move-object/from16 v4, v18
    move-object/from16 v27, v23
    move-object/from16 v18, v28
    move-object/from16 v7, v29
    move/from16 v3, v44
    move/from16 v28, v48
    :goto_ad2
    move v2, v0
    move/from16 v29, v5
    move-object/from16 v23, v6
    move-object/from16 v5, v43
    move/from16 v0, v45
    goto/16 :goto_1620
    move/from16 v45, v0
    move/from16 v44, v3
    move-object/from16 v46, v6
    move-object/from16 v6, v23
    move-object/from16 v2, v24
    move/from16 v48, v28
    move/from16 v47, v38
    move/from16 v38, v43
    move-object/from16 v43, v5
    move-object/from16 v28, v18
    move/from16 v5, v29
    move-object/from16 v18, v4
    move-object/from16 v29, v7
    move/from16 v7, v68
    .line 192
    invoke-static {v1}, Ll/ۤۙ;->ܽܶۡ(Ljava/lang/Object;)Z
    move-result v0
    if-nez v0, :goto_b09
    const-string v0, "᩷᩹᩷"
    const/4 v3, 0x1
    invoke-static {v0, v3}, Ll/ۡ۫;->۠ۢ᩶(Ljava/lang/Object;I)C
    move-result v3
    xor-int v3, v3, v62
    goto :goto_b12
    :goto_b09
    const-string v0, "᩷ۘ۬"
    const/4 v3, 0x1
    invoke-static {v0, v3}, Ll/ۡ۫;->۠ۢ᩶(Ljava/lang/Object;I)C
    move-result v3
    xor-int v3, v3, v63
    :goto_b12
    const/4 v4, 0x0
    invoke-static {v0, v4}, Ll/ܽ᩵;->ᩳ᩹֨(Ljava/lang/Object;I)C
    move-result v4
    mul-int v3, v3, v4
    const/4 v4, 0x2
    invoke-static {v0, v4}, Ll/ܽ᩵;->ᩳ᩹֨(Ljava/lang/Object;I)C
    move-result v0
    sub-int v0, v3, v0
    move-object/from16 v24, v2
    move-object/from16 v23, v6
    move/from16 v68, v7
    move-object/from16 v4, v18
    move-object/from16 v18, v28
    move-object/from16 v7, v29
    move/from16 v3, v44
    move-object/from16 v6, v46
    move/from16 v28, v48
    move v2, v0
    move/from16 v29, v5
    move-object/from16 v5, v43
    move/from16 v0, v45
    goto/16 :goto_1622
    move/from16 v45, v0
    move/from16 v44, v3
    move-object/from16 v46, v6
    move-object/from16 v6, v23
    move-object/from16 v2, v24
    move/from16 v48, v28
    move/from16 v38, v43
    move-object/from16 v43, v5
    move-object/from16 v28, v18
    move/from16 v5, v29
    move-object/from16 v18, v4
    move-object/from16 v29, v7
    move/from16 v7, v68
    .line 208
    invoke-virtual {v11}, Ll/ۢ᩺;->᩸()Ljava/lang/CharSequence;
    move-result-object v20
    .line 209
    invoke-static {v13, v2}, Ll/ۙ֫;->ܶܳᩴ(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/String;
    move-result-object v0
    .line 210
    invoke-static {v13, v6}, Ll/ۙ֫;->ܶܳᩴ(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/String;
    move-result-object v3
    if-eqz v0, :cond_b88
    const-string/jumbo v3, "᩹֨᩵"
    const/4 v4, 0x0
    invoke-static {v3, v4}, Ll/ۡ۫;->۠ۢ᩶(Ljava/lang/Object;I)C
    move-result v4
    mul-int/lit16 v4, v4, 0x3c1
    move-object/from16 v24, v0
    const/4 v0, 0x1
    invoke-static {v3, v0}, Ll/ܽ᩵;->ᩳ᩹֨(Ljava/lang/Object;I)C
    move-result v0
    mul-int/lit8 v0, v0, 0x1f
    add-int/2addr v4, v0
    xor-int v0, v4, v63
    const/4 v4, 0x2
    invoke-static {v3, v4}, Ll/ܽ᩵;->ᩳ᩹֨(Ljava/lang/Object;I)C
    move-result v3
    add-int/2addr v0, v3
    move-object/from16 v23, v6
    move/from16 v68, v7
    move-object/from16 v4, v18
    move-object/from16 v21, v24
    goto :goto_bad
    :cond_b88
    const-string v0, "ۛܶۗ"
    const/4 v4, 0x0
    invoke-static {v0, v4}, Ll/ܽ᩵;->ᩳ᩹֨(Ljava/lang/Object;I)C
    move-result v4
    mul-int/lit16 v4, v4, 0x3c1
    move-object/from16 v24, v1
    const/4 v1, 0x1
    invoke-static {v0, v1}, Ll/ܽ᩵;->ᩳ᩹֨(Ljava/lang/Object;I)C
    move-result v1
    mul-int/lit8 v1, v1, 0x1f
    add-int/2addr v4, v1
    xor-int v1, v4, v62
    const/4 v4, 0x2
    invoke-static {v0, v4}, Ll/ܽ᩵;->ᩳ᩹֨(Ljava/lang/Object;I)C
    move-result v0
    add-int/2addr v0, v1
    move-object/from16 v22, v3
    move-object/from16 v23, v6
    move/from16 v68, v7
    move-object/from16 v4, v18
    move-object/from16 v1, v24
    :goto_bad
    move-object/from16 v18, v28
    move-object/from16 v7, v29
    move/from16 v3, v44
    move-object/from16 v6, v46
    move/from16 v28, v48
    move-object/from16 v24, v2
    move/from16 v29, v5
    move-object/from16 v5, v43
    move v2, v0
    move/from16 v43, v38
    move/from16 v0, v45
    const/16 v38, 0x1
    goto/16 :goto_d6
    move/from16 v45, v0
    move/from16 v44, v3
    move-object/from16 v46, v6
    move-object/from16 v6, v23
    move-object/from16 v2, v24
    move/from16 v48, v28
    move/from16 v47, v38
    move/from16 v38, v43
    move-object/from16 v24, v1
    move-object/from16 v43, v5
    move-object/from16 v28, v18
    move/from16 v5, v29
    move-object/from16 v18, v4
    move-object/from16 v29, v7
    move/from16 v7, v68
    .line 204
    invoke-static/range {v19 .. v19}, Ll/᩶ۤ;->ۚۧ۫(Ljava/lang/Object;)Ljava/lang/Object;
    move-result-object v0
    check-cast v0, Ll/ۢ᩺;
    .line 205
    invoke-virtual {v0}, Ll/ۢ᩺;->ۖ()Ljava/lang/String;
    move-result-object v1
    .line 206
    invoke-virtual {v0}, Ll/ۢ᩺;->ۜ()Landroid/content/Intent;
    move-result-object v3
    .line 240
    sget v4, Ll/ۘ;->ۢۤᩳ:I
    if-ltz v4, :cond_c12
    move-object/from16 v50, v2
    move-object/from16 v58, v71
    move/from16 v59, v72
    move/from16 v60, v73
    move-object/from16 v52, v74
    move/from16 v56, v75
    move-object/from16 v53, v76
    move/from16 v54, v77
    move/from16 v55, v78
    move-object/from16 v4, v79
    move/from16 v49, v80
    move-object/from16 v23, v81
    move/from16 v3, v82
    goto/16 :goto_117b
    :cond_c12
    const-string v4, "ۢܽܶ"
    const/4 v11, 0x1
    invoke-static {v4, v11}, Ll/ۡ۫;->۠ۢ᩶(Ljava/lang/Object;I)C
    move-result v11
    const/4 v13, 0x2
    invoke-static {v4, v13}, Ll/ܽ᩵;->ᩳ᩹֨(Ljava/lang/Object;I)C
    move-result v13
    mul-int v11, v11, v13
    xor-int v11, v11, v62
    const/4 v13, 0x0
    invoke-static {v4, v13}, Ll/ܽ᩵;->ᩳ᩹֨(Ljava/lang/Object;I)C
    move-result v4
    add-int/2addr v4, v11
    move-object v11, v0
    move-object v13, v3
    move-object/from16 v23, v6
    move/from16 v68, v7
    move-object/from16 v7, v29
    move/from16 v3, v44
    move/from16 v0, v45
    move-object/from16 v6, v46
    move/from16 v28, v48
    move/from16 v29, v5
    move-object/from16 v5, v43
    move/from16 v43, v38
    move/from16 v38, v47
    move-object/from16 v83, v18
    move-object/from16 v18, v1
    move-object/from16 v1, v24
    move-object/from16 v24, v2
    move v2, v4
    move-object/from16 v4, v83
    goto/16 :goto_d6
    move/from16 v45, v0
    move/from16 v44, v3
    move-object/from16 v46, v6
    move-object/from16 v6, v23
    move-object/from16 v2, v24
    move/from16 v48, v28
    move/from16 v47, v38
    move/from16 v38, v43
    move-object/from16 v24, v1
    move-object/from16 v43, v5
    move-object/from16 v28, v18
    move/from16 v5, v29
    move-object/from16 v18, v4
    move-object/from16 v29, v7
    move/from16 v7, v68
    .line 241
    sget-object v0, Lbin/mt/plus/ShortcutActivity;->۠ܶۧ:[S
    const/16 v1, 0x45
    const/4 v3, 0x3
    invoke-static {v0, v1, v3, v7}, Ll/ۘ;->᩹۫ۢ([SIII)Ljava/lang/String;
    move-result-object v0
    invoke-static {v0}, Ll/ۤ֨;->۬ۚᩴ(Ljava/lang/Object;)I
    move-result v0
    const v1, 0x7d500627
    xor-int/2addr v0, v1
    if-eqz v16, :goto_cbc
    const-string v1, "ܰۘܳ"
    const/4 v3, 0x0
    invoke-static {v1, v3}, Ll/ۡ۫;->۠ۢ᩶(Ljava/lang/Object;I)C
    move-result v3
    mul-int/lit16 v3, v3, 0x3c1
    const/4 v4, 0x1
    invoke-static {v1, v4}, Ll/ۡ۫;->۠ۢ᩶(Ljava/lang/Object;I)C
    move-result v4
    mul-int/lit8 v4, v4, 0x1f
    add-int/2addr v3, v4
    xor-int v3, v3, v62
    const/4 v4, 0x2
    invoke-static {v1, v4}, Ll/ܽ᩵;->ᩳ᩹֨(Ljava/lang/Object;I)C
    move-result v1
    add-int/2addr v1, v3
    move/from16 v33, v0
    move-object/from16 v23, v6
    move/from16 v68, v7
    move-object/from16 v4, v18
    move-object/from16 v18, v28
    move-object/from16 v7, v29
    move/from16 v3, v44
    move/from16 v0, v45
    move-object/from16 v6, v46
    move/from16 v28, v48
    move/from16 v29, v5
    move-object/from16 v5, v43
    move/from16 v43, v38
    move/from16 v38, v47
    move-object/from16 v83, v2
    move v2, v1
    move-object/from16 v1, v24
    move-object/from16 v24, v83
    goto/16 :goto_d6
    :goto_cbc
    const-string v0, "᩵۟ܳ"
    const/4 v1, 0x0
    invoke-static {v0, v1}, Ll/ۡ۫;->۠ۢ᩶(Ljava/lang/Object;I)C
    move-result v1
    mul-int/lit16 v1, v1, 0x3c1
    const/4 v3, 0x1
    invoke-static {v0, v3}, Ll/ܽ᩵;->ᩳ᩹֨(Ljava/lang/Object;I)C
    move-result v3
    goto :goto_cfd
    move/from16 v45, v0
    move/from16 v44, v3
    move-object/from16 v46, v6
    move-object/from16 v6, v23
    move-object/from16 v2, v24
    move/from16 v48, v28
    move/from16 v47, v38
    move/from16 v38, v43
    move-object/from16 v24, v1
    move-object/from16 v43, v5
    move-object/from16 v28, v18
    move/from16 v5, v29
    move-object/from16 v18, v4
    move-object/from16 v29, v7
    move/from16 v7, v68
    .line 154
    invoke-static/range {v25 .. v25}, Ll/ۤۚ;->ۙܶۨ(Ljava/lang/Object;)Z
    move-result v0
    if-eqz v0, :cond_d04
    const-string v0, "֡ܰۧ"
    const/4 v1, 0x0
    invoke-static {v0, v1}, Ll/ܽ᩵;->ᩳ᩹֨(Ljava/lang/Object;I)C
    move-result v1
    mul-int/lit16 v1, v1, 0x3c1
    const/4 v3, 0x1
    invoke-static {v0, v3}, Ll/ۡ۫;->۠ۢ᩶(Ljava/lang/Object;I)C
    move-result v3
    :goto_cfd
    mul-int/lit8 v3, v3, 0x1f
    add-int/2addr v1, v3
    xor-int v1, v1, v63
    const/4 v3, 0x2
    goto :goto_d5a
    :cond_d04
    const-string v0, "ۧ֨ܶ"
    const/4 v1, 0x1
    invoke-static {v0, v1}, Ll/ۡ۫;->۠ۢ᩶(Ljava/lang/Object;I)C
    move-result v1
    xor-int v1, v1, v62
    const/4 v3, 0x0
    invoke-static {v0, v3}, Ll/ۡ۫;->۠ۢ᩶(Ljava/lang/Object;I)C
    move-result v3
    mul-int v1, v1, v3
    const/4 v3, 0x2
    invoke-static {v0, v3}, Ll/ۡ۫;->۠ۢ᩶(Ljava/lang/Object;I)C
    move-result v0
    goto/16 :goto_dde
    move/from16 v45, v0
    move/from16 v44, v3
    move-object/from16 v46, v6
    move-object/from16 v6, v23
    move-object/from16 v2, v24
    move/from16 v48, v28
    move/from16 v47, v38
    move/from16 v38, v43
    move-object/from16 v24, v1
    move-object/from16 v43, v5
    move-object/from16 v28, v18
    move/from16 v5, v29
    move-object/from16 v18, v4
    move-object/from16 v29, v7
    move/from16 v7, v68
    .line 204
    invoke-static/range {v19 .. v19}, Ll/ۤۚ;->ۙܶۨ(Ljava/lang/Object;)Z
    move-result v0
    if-eqz v0, :cond_d49
    const-string v0, "ۖۨܺ"
    invoke-static {v0}, Ll/ۤ֨;->۬ۚᩴ(Ljava/lang/Object;)I
    move-result v0
    xor-int v0, v0, v63
    goto/16 :goto_de0
    :cond_d49
    const-string v0, "᩷۫᩻"
    const/4 v1, 0x1
    invoke-static {v0, v1}, Ll/ۡ۫;->۠ۢ᩶(Ljava/lang/Object;I)C
    move-result v1
    const/4 v3, 0x2
    invoke-static {v0, v3}, Ll/ܽ᩵;->ᩳ᩹֨(Ljava/lang/Object;I)C
    move-result v3
    mul-int v1, v1, v3
    xor-int v1, v1, v62
    const/4 v3, 0x0
    :goto_d5a
    invoke-static {v0, v3}, Ll/ܽ᩵;->ᩳ᩹֨(Ljava/lang/Object;I)C
    move-result v0
    goto :goto_d9c
    move/from16 v45, v0
    move/from16 v44, v3
    move-object/from16 v46, v6
    move-object/from16 v6, v23
    move-object/from16 v2, v24
    move/from16 v48, v28
    move/from16 v47, v38
    move/from16 v38, v43
    move-object/from16 v24, v1
    move-object/from16 v43, v5
    move-object/from16 v28, v18
    move/from16 v5, v29
    move-object/from16 v18, v4
    move-object/from16 v29, v7
    move/from16 v7, v68
    .line 153
    invoke-static/range {v86 .. v86}, Ll/֨᩺;->ۖ(Ll/۠ᩴۡ;)Ljava/util/List;
    move-result-object v0
    .line 154
    invoke-static {v0}, Ll/᩹;->ܽ᩹᩷(Ljava/lang/Object;)Ljava/util/Iterator;
    move-result-object v0
    move-object/from16 v25, v0
    :goto_d87
    const-string v0, "ۢۡ֫"
    const/4 v1, 0x1
    invoke-static {v0, v1}, Ll/ۡ۫;->۠ۢ᩶(Ljava/lang/Object;I)C
    move-result v1
    const/4 v3, 0x2
    invoke-static {v0, v3}, Ll/ۡ۫;->۠ۢ᩶(Ljava/lang/Object;I)C
    move-result v3
    mul-int v1, v1, v3
    xor-int v1, v1, v63
    const/4 v3, 0x0
    invoke-static {v0, v3}, Ll/ۡ۫;->۠ۢ᩶(Ljava/lang/Object;I)C
    move-result v0
    :goto_d9c
    add-int/2addr v0, v1
    goto :goto_de0
    move/from16 v45, v0
    move/from16 v44, v3
    move-object/from16 v46, v6
    move-object/from16 v6, v23
    move-object/from16 v2, v24
    move/from16 v48, v28
    move/from16 v47, v38
    move/from16 v38, v43
    move-object/from16 v24, v1
    move-object/from16 v43, v5
    move-object/from16 v28, v18
    move/from16 v5, v29
    move-object/from16 v18, v4
    move-object/from16 v29, v7
    move/from16 v7, v68
    .line 203
    invoke-static/range {v86 .. v86}, Ll/֨᩺;->ۖ(Landroid/content/Context;)Ljava/util/ArrayList;
    move-result-object v0
    .line 204
    invoke-static {v0}, Ll/ۛܰ;->ۖۘ᩶(Ljava/lang/Object;)Ljava/util/Iterator;
    move-result-object v0
    const/4 v1, 0x0
    move-object/from16 v19, v0
    const/16 v16, 0x0
    :goto_dc9
    const-string v0, "ۨܽۤ"
    const/4 v1, 0x1
    invoke-static {v0, v1}, Ll/ۡ۫;->۠ۢ᩶(Ljava/lang/Object;I)C
    move-result v1
    xor-int v1, v1, v62
    const/4 v3, 0x0
    invoke-static {v0, v3}, Ll/ۡ۫;->۠ۢ᩶(Ljava/lang/Object;I)C
    move-result v3
    mul-int v1, v1, v3
    const/4 v3, 0x2
    invoke-static {v0, v3}, Ll/ܽ᩵;->ᩳ᩹֨(Ljava/lang/Object;I)C
    move-result v0
    :goto_dde
    sub-int v0, v1, v0
    :goto_de0
    move-object/from16 v23, v6
    move/from16 v68, v7
    move-object/from16 v4, v18
    move-object/from16 v1, v24
    :goto_de8
    move-object/from16 v18, v28
    move-object/from16 v7, v29
    move/from16 v3, v44
    move-object/from16 v6, v46
    move/from16 v28, v48
    goto/16 :goto_f14
    move/from16 v45, v0
    move-object/from16 v24, v1
    move/from16 v44, v3
    move-object/from16 v46, v6
    move-object/from16 v29, v7
    move-object/from16 v6, v23
    move/from16 v48, v28
    move/from16 v47, v38
    move/from16 v38, v43
    move/from16 v7, v68
    move-object/from16 v43, v5
    move-object/from16 v28, v18
    move-object/from16 v18, v4
    const/16 v0, 0xf
    move-object/from16 v1, v81
    move/from16 v3, v82
    .line 152
    invoke-static {v1, v3, v0, v7}, Ll/ۚۙ;->֫ۖۛ([SIII)Ljava/lang/String;
    move-result-object v0
    const/4 v4, 0x0
    if-eqz v65, :cond_e53
    const-string v5, "ܰۖ۠"
    const/4 v12, 0x0
    invoke-static {v5, v12}, Ll/ܽ᩵;->ᩳ᩹֨(Ljava/lang/Object;I)C
    move-result v12
    mul-int/lit16 v12, v12, 0x3c1
    const/4 v2, 0x1
    invoke-static {v5, v2}, Ll/ۡ۫;->۠ۢ᩶(Ljava/lang/Object;I)C
    move-result v2
    mul-int/lit8 v2, v2, 0x1f
    add-int/2addr v12, v2
    xor-int v2, v12, v63
    const/4 v12, 0x2
    invoke-static {v5, v12}, Ll/ܽ᩵;->ᩳ᩹֨(Ljava/lang/Object;I)C
    move-result v5
    add-int/2addr v2, v5
    move-object/from16 v81, v1
    move/from16 v82, v3
    move-object/from16 v23, v6
    move/from16 v68, v7
    move-object/from16 v4, v18
    move-object/from16 v1, v24
    move-object/from16 v18, v28
    move-object/from16 v7, v29
    move-object/from16 v5, v43
    move/from16 v3, v44
    move-object/from16 v6, v46
    move/from16 v28, v48
    const/4 v12, 0x0
    const/16 v29, -0x1
    move-object/from16 v24, v0
    goto/16 :goto_f1b
    :cond_e53
    const/4 v5, -0x1
    :goto_e54
    const-string v2, "ܽ֨ܶ"
    const/4 v4, 0x0
    invoke-static {v2, v4}, Ll/ۡ۫;->۠ۢ᩶(Ljava/lang/Object;I)C
    move-result v4
    mul-int/lit16 v4, v4, 0x3c1
    move-object/from16 v23, v0
    const/4 v0, 0x1
    invoke-static {v2, v0}, Ll/ۡ۫;->۠ۢ᩶(Ljava/lang/Object;I)C
    move-result v0
    mul-int/lit8 v0, v0, 0x1f
    add-int/2addr v4, v0
    xor-int v0, v4, v63
    const/4 v4, 0x2
    invoke-static {v2, v4}, Ll/ܽ᩵;->ᩳ᩹֨(Ljava/lang/Object;I)C
    move-result v2
    add-int/2addr v2, v0
    move-object/from16 v81, v1
    move/from16 v82, v3
    move/from16 v68, v7
    move-object/from16 v4, v18
    move-object/from16 v1, v24
    move-object/from16 v18, v28
    move-object/from16 v7, v29
    move/from16 v3, v44
    move/from16 v0, v45
    move/from16 v28, v48
    move/from16 v29, v5
    move-object/from16 v24, v23
    move-object/from16 v5, v43
    move-object/from16 v23, v6
    move/from16 v43, v38
    move-object/from16 v6, v46
    goto/16 :goto_1624
    move/from16 v45, v0
    move/from16 v44, v3
    move-object/from16 v46, v6
    move-object/from16 v6, v23
    move-object/from16 v2, v24
    move/from16 v48, v28
    move/from16 v47, v38
    move/from16 v38, v43
    move/from16 v3, v82
    move-object/from16 v24, v1
    move-object/from16 v43, v5
    move-object/from16 v28, v18
    move/from16 v5, v29
    move-object/from16 v1, v81
    move-object/from16 v18, v4
    move-object/from16 v29, v7
    move/from16 v7, v68
    const/16 v0, 0xf
    move-object/from16 v23, v1
    move-object/from16 v4, v79
    move/from16 v1, v80
    invoke-static {v4, v1, v0, v7}, Ll/ۢۨ;->ۖܺ۫([SIII)Ljava/lang/String;
    move-result-object v0
    sget-object v81, Lbin/mt/plus/ShortcutActivity;->۠ܶۧ:[S
    const/16 v82, 0x36
    .line 219
    invoke-static {}, Ll/᩶ۤ;->᩺֨ۡ()I
    move-result v49
    if-ltz v49, :cond_ee3
    move/from16 v49, v1
    move-object/from16 v50, v2
    move-object/from16 v64, v69
    move/from16 v66, v70
    move-object/from16 v58, v71
    move/from16 v59, v72
    move/from16 v60, v73
    move-object/from16 v52, v74
    move/from16 v56, v75
    move-object/from16 v53, v76
    move/from16 v54, v77
    move/from16 v55, v78
    goto/16 :goto_1306
    :cond_ee3
    const-string v3, "ܰ֡ۙ"
    const/4 v6, 0x0
    invoke-static {v3, v6}, Ll/ۡ۫;->۠ۢ᩶(Ljava/lang/Object;I)C
    move-result v6
    mul-int/lit16 v6, v6, 0x3c1
    move-object/from16 v49, v0
    const/4 v0, 0x1
    invoke-static {v3, v0}, Ll/ۡ۫;->۠ۢ᩶(Ljava/lang/Object;I)C
    move-result v0
    mul-int/lit8 v0, v0, 0x1f
    add-int/2addr v6, v0
    xor-int v0, v6, v62
    const/4 v6, 0x2
    invoke-static {v3, v6}, Ll/ܽ᩵;->ᩳ᩹֨(Ljava/lang/Object;I)C
    move-result v3
    add-int/2addr v0, v3
    move/from16 v80, v1
    move-object/from16 v79, v4
    move/from16 v68, v7
    move-object/from16 v4, v18
    move-object/from16 v1, v24
    move-object/from16 v18, v28
    move-object/from16 v7, v29
    move/from16 v3, v44
    move-object/from16 v6, v46
    move/from16 v28, v48
    move-object/from16 v23, v49
    :goto_f14
    move-object/from16 v24, v2
    move/from16 v29, v5
    move-object/from16 v5, v43
    move v2, v0
    :goto_f1b
    move/from16 v43, v38
    move/from16 v0, v45
    goto/16 :goto_1624
    move/from16 v45, v0
    move/from16 v44, v3
    move-object/from16 v46, v6
    move-object/from16 v6, v23
    move-object/from16 v50, v24
    move/from16 v48, v28
    move/from16 v47, v38
    move/from16 v38, v43
    move-object/from16 v0, v76
    move/from16 v2, v78
    move/from16 v49, v80
    move-object/from16 v23, v81
    move/from16 v3, v82
    move-object/from16 v24, v1
    move-object/from16 v43, v5
    move-object/from16 v28, v18
    move/from16 v5, v29
    move/from16 v1, v77
    move-object/from16 v18, v4
    move-object/from16 v29, v7
    move/from16 v7, v68
    move-object/from16 v4, v79
    .line 152
    invoke-static {v0, v1, v2, v7}, Ll/ᩴᩴ;->֡֨᩵([SIII)Ljava/lang/String;
    move-result-object v52
    sget-object v79, Lbin/mt/plus/ShortcutActivity;->۠ܶۧ:[S
    const/16 v80, 0x27
    .line 58
    sget v53, Ll/ۘᩳ;->ܰ֡۫:I
    if-ltz v53, :cond_f98
    move-object/from16 v53, v0
    :goto_f5b
    const-string v0, "᩵ۜ֫"
    move/from16 v54, v1
    const/4 v1, 0x1
    invoke-static {v0, v1}, Ll/ۡ۫;->۠ۢ᩶(Ljava/lang/Object;I)C
    move-result v1
    move/from16 v55, v2
    const/4 v2, 0x2
    invoke-static {v0, v2}, Ll/ܽ᩵;->ᩳ᩹֨(Ljava/lang/Object;I)C
    move-result v2
    mul-int v1, v1, v2
    xor-int v1, v1, v63
    const/4 v2, 0x0
    invoke-static {v0, v2}, Ll/ܽ᩵;->ᩳ᩹֨(Ljava/lang/Object;I)C
    move-result v0
    add-int v2, v1, v0
    move/from16 v82, v3
    move-object/from16 v79, v4
    move/from16 v68, v7
    move-object/from16 v4, v18
    move-object/from16 v81, v23
    move-object/from16 v1, v24
    move-object/from16 v18, v28
    move-object/from16 v7, v29
    move/from16 v3, v44
    move/from16 v0, v45
    move/from16 v28, v48
    move/from16 v80, v49
    move-object/from16 v24, v50
    move-object/from16 v76, v53
    move/from16 v77, v54
    move/from16 v78, v55
    goto/16 :goto_161a
    :cond_f98
    move-object/from16 v53, v0
    move/from16 v54, v1
    move/from16 v55, v2
    const-string v0, "ۙ᩹ۡ"
    const/4 v1, 0x1
    invoke-static {v0, v1}, Ll/ۡ۫;->۠ۢ᩶(Ljava/lang/Object;I)C
    move-result v1
    xor-int v1, v1, v62
    const/4 v2, 0x0
    invoke-static {v0, v2}, Ll/ܽ᩵;->ᩳ᩹֨(Ljava/lang/Object;I)C
    move-result v2
    mul-int v1, v1, v2
    const/4 v2, 0x2
    invoke-static {v0, v2}, Ll/ۡ۫;->۠ۢ᩶(Ljava/lang/Object;I)C
    move-result v0
    sub-int v2, v1, v0
    move/from16 v82, v3
    move/from16 v68, v7
    move-object/from16 v4, v18
    move-object/from16 v81, v23
    move-object/from16 v1, v24
    move-object/from16 v18, v28
    move-object/from16 v7, v29
    move/from16 v3, v44
    move/from16 v0, v45
    move/from16 v28, v48
    move-object/from16 v24, v50
    move-object/from16 v76, v53
    move/from16 v77, v54
    move/from16 v78, v55
    move/from16 v29, v5
    move-object/from16 v23, v6
    move-object/from16 v5, v43
    move-object/from16 v6, v52
    goto/16 :goto_1622
    move/from16 v45, v0
    move/from16 v44, v3
    move-object/from16 v46, v6
    move-object/from16 v6, v23
    move-object/from16 v50, v24
    move/from16 v48, v28
    move/from16 v47, v38
    move/from16 v38, v43
    move-object/from16 v53, v76
    move/from16 v54, v77
    move/from16 v55, v78
    move/from16 v49, v80
    move-object/from16 v23, v81
    move/from16 v3, v82
    move-object/from16 v24, v1
    move-object/from16 v43, v5
    move-object/from16 v28, v18
    move/from16 v5, v29
    move-object/from16 v18, v4
    move-object/from16 v29, v7
    move/from16 v7, v68
    move-object/from16 v4, v79
    const/16 v0, 0x9
    move-object/from16 v1, v74
    move/from16 v2, v75
    .line 152
    invoke-static {v1, v2, v0, v7}, Ll/ۢۨ;->ۖܺ۫([SIII)Ljava/lang/String;
    move-result-object v0
    sget-object v76, Lbin/mt/plus/ShortcutActivity;->۠ܶۧ:[S
    const/16 v77, 0x1c
    const/16 v78, 0xb
    sget v52, Ll/ܰۙ;->ۘۢ֫:I
    if-gtz v52, :cond_105d
    :goto_101b
    const-string/jumbo v0, "᩺۬ۜ"
    move-object/from16 v52, v1
    const/4 v1, 0x1
    invoke-static {v0, v1}, Ll/ܽ᩵;->ᩳ᩹֨(Ljava/lang/Object;I)C
    move-result v1
    move/from16 v56, v2
    const/4 v2, 0x2
    invoke-static {v0, v2}, Ll/ܽ᩵;->ᩳ᩹֨(Ljava/lang/Object;I)C
    move-result v2
    mul-int v1, v1, v2
    xor-int v1, v1, v62
    const/4 v2, 0x0
    invoke-static {v0, v2}, Ll/ۡ۫;->۠ۢ᩶(Ljava/lang/Object;I)C
    move-result v0
    add-int v2, v1, v0
    move/from16 v82, v3
    move-object/from16 v79, v4
    move/from16 v68, v7
    move-object/from16 v4, v18
    move-object/from16 v81, v23
    move-object/from16 v1, v24
    move-object/from16 v18, v28
    move-object/from16 v7, v29
    move/from16 v3, v44
    move/from16 v0, v45
    move/from16 v28, v48
    move/from16 v80, v49
    move-object/from16 v24, v50
    move-object/from16 v74, v52
    move-object/from16 v76, v53
    move/from16 v77, v54
    move/from16 v78, v55
    move/from16 v75, v56
    goto/16 :goto_161a
    :cond_105d
    move-object/from16 v52, v1
    move/from16 v56, v2
    const-string v1, "ۙۛۢ"
    const/4 v2, 0x1
    invoke-static {v1, v2}, Ll/ܽ᩵;->ᩳ᩹֨(Ljava/lang/Object;I)C
    move-result v2
    move-object/from16 v57, v0
    const/4 v0, 0x2
    invoke-static {v1, v0}, Ll/ܽ᩵;->ᩳ᩹֨(Ljava/lang/Object;I)C
    move-result v0
    mul-int v2, v2, v0
    xor-int v0, v2, v63
    const/4 v2, 0x0
    invoke-static {v1, v2}, Ll/ۡ۫;->۠ۢ᩶(Ljava/lang/Object;I)C
    move-result v1
    add-int v2, v0, v1
    move/from16 v82, v3
    move-object/from16 v79, v4
    move/from16 v68, v7
    move-object/from16 v4, v18
    move-object/from16 v81, v23
    move-object/from16 v1, v24
    move-object/from16 v18, v28
    move-object/from16 v7, v29
    move/from16 v43, v38
    move/from16 v3, v44
    move/from16 v0, v45
    move/from16 v38, v47
    move/from16 v28, v48
    move/from16 v80, v49
    move-object/from16 v24, v50
    move-object/from16 v74, v52
    move/from16 v75, v56
    move/from16 v29, v5
    move-object/from16 v23, v6
    move-object/from16 v6, v46
    move-object/from16 v5, v57
    goto/16 :goto_d6
    move/from16 v45, v0
    move/from16 v44, v3
    move-object/from16 v46, v6
    move-object/from16 v6, v23
    move-object/from16 v50, v24
    move/from16 v48, v28
    move/from16 v47, v38
    move/from16 v38, v43
    move-object/from16 v0, v71
    move/from16 v2, v73
    move-object/from16 v52, v74
    move/from16 v56, v75
    move-object/from16 v53, v76
    move/from16 v54, v77
    move/from16 v55, v78
    move/from16 v49, v80
    move-object/from16 v23, v81
    move/from16 v3, v82
    move-object/from16 v24, v1
    move-object/from16 v43, v5
    move-object/from16 v28, v18
    move/from16 v5, v29
    move/from16 v1, v72
    move-object/from16 v18, v4
    move-object/from16 v29, v7
    move/from16 v7, v68
    move-object/from16 v4, v79
    invoke-static {v0, v1, v2, v7}, Ll/ۡ۫;->᩶ۚۧ([SIII)Ljava/lang/String;
    move-result-object v57
    sget-object v74, Lbin/mt/plus/ShortcutActivity;->۠ܶۧ:[S
    const/16 v75, 0x13
    .line 247
    sget v58, Ll/ᩴᩴ;->᩻᩵֡:I
    if-ltz v58, :cond_10f4
    move-object/from16 v58, v0
    move/from16 v59, v1
    move/from16 v60, v2
    move-object/from16 v64, v69
    move/from16 v66, v70
    goto/16 :goto_1306
    :cond_10f4
    move-object/from16 v58, v0
    const-string v0, "ܺۙۘ"
    move/from16 v59, v1
    const/4 v1, 0x1
    invoke-static {v0, v1}, Ll/ܽ᩵;->ᩳ᩹֨(Ljava/lang/Object;I)C
    move-result v1
    xor-int v1, v1, v63
    move/from16 v60, v2
    const/4 v2, 0x0
    invoke-static {v0, v2}, Ll/ܽ᩵;->ᩳ᩹֨(Ljava/lang/Object;I)C
    move-result v2
    mul-int v1, v1, v2
    const/4 v2, 0x2
    invoke-static {v0, v2}, Ll/ܽ᩵;->ᩳ᩹֨(Ljava/lang/Object;I)C
    move-result v0
    sub-int v2, v1, v0
    move/from16 v82, v3
    move-object/from16 v79, v4
    move/from16 v68, v7
    move-object/from16 v81, v23
    move-object/from16 v1, v24
    move-object/from16 v18, v28
    move-object/from16 v7, v29
    move/from16 v3, v44
    move/from16 v0, v45
    move/from16 v28, v48
    move/from16 v80, v49
    move-object/from16 v24, v50
    move-object/from16 v76, v53
    move/from16 v77, v54
    move/from16 v78, v55
    move-object/from16 v4, v57
    :goto_1131
    move-object/from16 v71, v58
    move/from16 v72, v59
    move/from16 v73, v60
    goto/16 :goto_161a
    move/from16 v45, v0
    move/from16 v44, v3
    move-object/from16 v46, v6
    move-object/from16 v6, v23
    move-object/from16 v50, v24
    move/from16 v48, v28
    move/from16 v47, v38
    move/from16 v38, v43
    move-object/from16 v58, v71
    move/from16 v59, v72
    move/from16 v60, v73
    move-object/from16 v52, v74
    move/from16 v56, v75
    move-object/from16 v53, v76
    move/from16 v54, v77
    move/from16 v55, v78
    move/from16 v49, v80
    move-object/from16 v23, v81
    move/from16 v3, v82
    move-object/from16 v24, v1
    move-object/from16 v43, v5
    move-object/from16 v28, v18
    move/from16 v5, v29
    move-object/from16 v18, v4
    move-object/from16 v29, v7
    move/from16 v7, v68
    move-object/from16 v4, v79
    xor-int v0, v31, v32
    .line 152
    sget-object v71, Lbin/mt/plus/ShortcutActivity;->۠ܶۧ:[S
    const/16 v72, 0xe
    const/16 v73, 0x5
    .line 33
    sget-boolean v1, Ll/ۤ֨;->ۢ᩵۠:Z
    if-eqz v1, :cond_11a8
    :goto_117b
    const-string v0, "ܿᩴ۫"
    invoke-static {v0}, Ll/ۙۘ;->ۙᩴ۫(Ljava/lang/Object;)I
    move-result v0
    xor-int v2, v0, v62
    move/from16 v82, v3
    move-object/from16 v79, v4
    move/from16 v68, v7
    move-object/from16 v4, v18
    move-object/from16 v81, v23
    move-object/from16 v1, v24
    move-object/from16 v18, v28
    move-object/from16 v7, v29
    move/from16 v3, v44
    move/from16 v0, v45
    move/from16 v28, v48
    move/from16 v80, v49
    move-object/from16 v24, v50
    move-object/from16 v74, v52
    move-object/from16 v76, v53
    move/from16 v77, v54
    move/from16 v78, v55
    move/from16 v75, v56
    goto :goto_1131
    :cond_11a8
    const-string v1, "ܰۡ֡"
    const/4 v2, 0x1
    invoke-static {v1, v2}, Ll/ܽ᩵;->ᩳ᩹֨(Ljava/lang/Object;I)C
    move-result v2
    xor-int v2, v2, v62
    move/from16 v57, v0
    const/4 v0, 0x0
    invoke-static {v1, v0}, Ll/ܽ᩵;->ᩳ᩹֨(Ljava/lang/Object;I)C
    move-result v0
    mul-int v2, v2, v0
    const/4 v0, 0x2
    invoke-static {v1, v0}, Ll/ۡ۫;->۠ۢ᩶(Ljava/lang/Object;I)C
    move-result v0
    sub-int/2addr v2, v0
    move/from16 v82, v3
    move-object/from16 v79, v4
    move/from16 v68, v7
    move-object/from16 v4, v18
    move-object/from16 v81, v23
    move-object/from16 v1, v24
    move-object/from16 v18, v28
    move-object/from16 v7, v29
    move/from16 v0, v45
    move/from16 v28, v48
    move/from16 v80, v49
    move-object/from16 v24, v50
    move-object/from16 v74, v52
    move-object/from16 v76, v53
    move/from16 v77, v54
    move/from16 v78, v55
    move/from16 v75, v56
    move/from16 v3, v57
    goto/16 :goto_161a
    move/from16 v45, v0
    move/from16 v44, v3
    move-object/from16 v46, v6
    move-object/from16 v6, v23
    move-object/from16 v50, v24
    move/from16 v48, v28
    move/from16 v47, v38
    move/from16 v38, v43
    move-object/from16 v58, v71
    move/from16 v59, v72
    move/from16 v60, v73
    move-object/from16 v52, v74
    move/from16 v56, v75
    move-object/from16 v53, v76
    move/from16 v54, v77
    move/from16 v55, v78
    move/from16 v49, v80
    move-object/from16 v23, v81
    move/from16 v3, v82
    move-object/from16 v24, v1
    move-object/from16 v43, v5
    move-object/from16 v28, v18
    move/from16 v5, v29
    move-object/from16 v18, v4
    move-object/from16 v29, v7
    move/from16 v7, v68
    move-object/from16 v4, v79
    const/4 v0, 0x3
    move-object/from16 v1, v69
    move/from16 v2, v70
    .line 152
    invoke-static {v1, v2, v0, v7}, Ll/ۤۛ;->ܳ᩺۫([SIII)Ljava/lang/String;
    move-result-object v0
    invoke-static {v0}, Ll/ۙۘ;->ۙᩴ۫(Ljava/lang/Object;)I
    move-result v0
    const v57, 0x7ed98637
    .line 154
    invoke-static {}, Ll/ۛܶ;->ܶۖۚ()Z
    move-result v61
    if-eqz v61, :cond_1269
    :goto_1232
    const-string/jumbo v0, "᩺᩺֡"
    invoke-static {v0}, Ll/ۙۘ;->ۙᩴ۫(Ljava/lang/Object;)I
    move-result v0
    xor-int v0, v0, v63
    move-object/from16 v69, v1
    move/from16 v70, v2
    move/from16 v82, v3
    move-object/from16 v79, v4
    move/from16 v68, v7
    move-object/from16 v4, v18
    move-object/from16 v81, v23
    move-object/from16 v1, v24
    move-object/from16 v18, v28
    move-object/from16 v7, v29
    move/from16 v3, v44
    move/from16 v28, v48
    move/from16 v80, v49
    move-object/from16 v24, v50
    move-object/from16 v74, v52
    move-object/from16 v76, v53
    move/from16 v77, v54
    move/from16 v78, v55
    move/from16 v75, v56
    move-object/from16 v71, v58
    move/from16 v72, v59
    move/from16 v73, v60
    goto/16 :goto_ad2
    :cond_1269
    move/from16 v61, v0
    const-string v0, "ܰ᩷᩸"
    move-object/from16 v64, v1
    const/4 v1, 0x1
    invoke-static {v0, v1}, Ll/ۡ۫;->۠ۢ᩶(Ljava/lang/Object;I)C
    move-result v1
    move/from16 v66, v2
    const/4 v2, 0x2
    invoke-static {v0, v2}, Ll/ܽ᩵;->ᩳ᩹֨(Ljava/lang/Object;I)C
    move-result v2
    mul-int v1, v1, v2
    xor-int v1, v1, v63
    const/4 v2, 0x0
    invoke-static {v0, v2}, Ll/ܽ᩵;->ᩳ᩹֨(Ljava/lang/Object;I)C
    move-result v0
    add-int v2, v1, v0
    move/from16 v82, v3
    move-object/from16 v79, v4
    move/from16 v68, v7
    move-object/from16 v4, v18
    move-object/from16 v81, v23
    move-object/from16 v1, v24
    move-object/from16 v18, v28
    move-object/from16 v7, v29
    move/from16 v3, v44
    move/from16 v0, v45
    move/from16 v28, v48
    move/from16 v80, v49
    move-object/from16 v24, v50
    move-object/from16 v74, v52
    move-object/from16 v76, v53
    move/from16 v77, v54
    move/from16 v78, v55
    move/from16 v75, v56
    move-object/from16 v71, v58
    move/from16 v72, v59
    move/from16 v73, v60
    move/from16 v31, v61
    move-object/from16 v69, v64
    move/from16 v70, v66
    const v32, 0x7ed98637
    goto/16 :goto_161a
    move/from16 v45, v0
    move/from16 v44, v3
    move-object/from16 v46, v6
    move-object/from16 v6, v23
    move-object/from16 v50, v24
    move/from16 v48, v28
    move/from16 v47, v38
    move/from16 v38, v43
    move-object/from16 v64, v69
    move/from16 v66, v70
    move-object/from16 v58, v71
    move/from16 v59, v72
    move/from16 v60, v73
    move-object/from16 v52, v74
    move/from16 v56, v75
    move-object/from16 v53, v76
    move/from16 v54, v77
    move/from16 v55, v78
    move/from16 v49, v80
    move-object/from16 v23, v81
    move/from16 v3, v82
    move-object/from16 v24, v1
    move-object/from16 v43, v5
    move-object/from16 v28, v18
    move/from16 v5, v29
    move-object/from16 v18, v4
    move-object/from16 v29, v7
    move/from16 v7, v68
    move-object/from16 v4, v79
    .line 151
    new-instance v1, Ljava/util/ArrayList;
    invoke-direct {v1}, Ljava/util/ArrayList;-><init>()V
    .line 152
    invoke-static {}, Lbin/mt/plus/ShortcutActivity;->᩵()Z
    move-result v2
    sget-object v69, Lbin/mt/plus/ShortcutActivity;->۠ܶۧ:[S
    const/16 v70, 0xb
    .line 236
    sget v0, Ll/ۘ;->ۢۤᩳ:I
    if-ltz v0, :cond_1325
    :goto_1306
    const-string v0, "֨ܿ᩸"
    const/4 v1, 0x1
    invoke-static {v0, v1}, Ll/ܽ᩵;->ᩳ᩹֨(Ljava/lang/Object;I)C
    move-result v1
    const/4 v2, 0x2
    invoke-static {v0, v2}, Ll/ܽ᩵;->ᩳ᩹֨(Ljava/lang/Object;I)C
    move-result v2
    mul-int v1, v1, v2
    xor-int v1, v1, v62
    const/4 v2, 0x0
    invoke-static {v0, v2}, Ll/ܽ᩵;->ᩳ᩹֨(Ljava/lang/Object;I)C
    move-result v0
    add-int v2, v1, v0
    move/from16 v82, v3
    move-object/from16 v79, v4
    move/from16 v68, v7
    goto/16 :goto_1405
    :cond_1325
    const-string v0, "۟ۚۜ"
    move-object/from16 v57, v1
    const/4 v1, 0x0
    invoke-static {v0, v1}, Ll/ܽ᩵;->ᩳ᩹֨(Ljava/lang/Object;I)C
    move-result v1
    mul-int/lit16 v1, v1, 0x3c1
    move/from16 v61, v2
    const/4 v2, 0x1
    invoke-static {v0, v2}, Ll/ܽ᩵;->ᩳ᩹֨(Ljava/lang/Object;I)C
    move-result v2
    mul-int/lit8 v2, v2, 0x1f
    add-int/2addr v1, v2
    xor-int v1, v1, v62
    const/4 v2, 0x2
    invoke-static {v0, v2}, Ll/ܽ᩵;->ᩳ᩹֨(Ljava/lang/Object;I)C
    move-result v0
    add-int v2, v1, v0
    move/from16 v82, v3
    move-object/from16 v79, v4
    move/from16 v68, v7
    move-object/from16 v4, v18
    move-object/from16 v81, v23
    move-object/from16 v18, v28
    move-object/from16 v7, v29
    move/from16 v3, v44
    move/from16 v0, v45
    move/from16 v28, v48
    move/from16 v80, v49
    move-object/from16 v24, v50
    move-object/from16 v74, v52
    move-object/from16 v76, v53
    move/from16 v77, v54
    move/from16 v78, v55
    move/from16 v75, v56
    move-object/from16 v1, v57
    move-object/from16 v71, v58
    move/from16 v72, v59
    move/from16 v73, v60
    move/from16 v65, v61
    goto/16 :goto_161a
    move/from16 v45, v0
    move/from16 v44, v3
    move-object/from16 v46, v6
    move-object/from16 v6, v23
    move-object/from16 v50, v24
    move/from16 v48, v28
    move/from16 v47, v38
    move/from16 v38, v43
    move-object/from16 v64, v69
    move/from16 v66, v70
    move-object/from16 v58, v71
    move/from16 v59, v72
    move/from16 v60, v73
    move-object/from16 v52, v74
    move/from16 v56, v75
    move-object/from16 v53, v76
    move/from16 v54, v77
    move/from16 v55, v78
    move/from16 v49, v80
    move-object/from16 v23, v81
    move/from16 v3, v82
    move-object/from16 v24, v1
    move-object/from16 v43, v5
    move-object/from16 v28, v18
    move/from16 v5, v29
    move-object/from16 v18, v4
    move-object/from16 v29, v7
    move-object/from16 v4, v79
    const/16 v0, 0x7418
    const/16 v68, 0x7418
    goto :goto_13ea
    move/from16 v45, v0
    move/from16 v44, v3
    move-object/from16 v46, v6
    move-object/from16 v6, v23
    move-object/from16 v50, v24
    move/from16 v48, v28
    move/from16 v47, v38
    move/from16 v38, v43
    move-object/from16 v64, v69
    move/from16 v66, v70
    move-object/from16 v58, v71
    move/from16 v59, v72
    move/from16 v60, v73
    move-object/from16 v52, v74
    move/from16 v56, v75
    move-object/from16 v53, v76
    move/from16 v54, v77
    move/from16 v55, v78
    move/from16 v49, v80
    move-object/from16 v23, v81
    move/from16 v3, v82
    move-object/from16 v24, v1
    move-object/from16 v43, v5
    move-object/from16 v28, v18
    move/from16 v5, v29
    move-object/from16 v18, v4
    move-object/from16 v29, v7
    move-object/from16 v4, v79
    const/16 v0, 0x68
    const/16 v68, 0x68
    :goto_13ea
    const-string v0, "۬ܿۗ"
    const/4 v1, 0x1
    invoke-static {v0, v1}, Ll/ܽ᩵;->ᩳ᩹֨(Ljava/lang/Object;I)C
    move-result v1
    const/4 v2, 0x2
    invoke-static {v0, v2}, Ll/ۡ۫;->۠ۢ᩶(Ljava/lang/Object;I)C
    move-result v2
    mul-int v1, v1, v2
    xor-int v1, v1, v62
    const/4 v2, 0x0
    invoke-static {v0, v2}, Ll/ܽ᩵;->ᩳ᩹֨(Ljava/lang/Object;I)C
    move-result v0
    add-int v2, v1, v0
    move/from16 v82, v3
    move-object/from16 v79, v4
    :goto_1405
    move-object/from16 v4, v18
    move-object/from16 v81, v23
    move-object/from16 v1, v24
    move-object/from16 v18, v28
    move-object/from16 v7, v29
    move/from16 v3, v44
    move/from16 v0, v45
    move/from16 v28, v48
    move/from16 v80, v49
    move-object/from16 v24, v50
    move-object/from16 v74, v52
    move-object/from16 v76, v53
    move/from16 v77, v54
    move/from16 v78, v55
    move/from16 v75, v56
    goto/16 :goto_14c3
    move/from16 v45, v0
    move/from16 v44, v3
    move-object/from16 v46, v6
    move-object/from16 v6, v23
    move-object/from16 v50, v24
    move/from16 v48, v28
    move/from16 v47, v38
    move/from16 v38, v43
    move-object/from16 v64, v69
    move/from16 v66, v70
    move-object/from16 v58, v71
    move/from16 v59, v72
    move/from16 v60, v73
    move-object/from16 v52, v74
    move/from16 v56, v75
    move-object/from16 v53, v76
    move/from16 v54, v77
    move/from16 v55, v78
    move/from16 v49, v80
    move-object/from16 v23, v81
    move/from16 v3, v82
    move-object/from16 v24, v1
    move-object/from16 v43, v5
    move-object/from16 v28, v18
    move/from16 v5, v29
    move-object/from16 v18, v4
    move-object/from16 v29, v7
    move/from16 v7, v68
    move-object/from16 v4, v79
    add-int v0, v39, v41
    add-int/2addr v0, v0
    move/from16 v1, v67
    add-int/lit16 v2, v1, 0x2e28
    mul-int v2, v2, v2
    sub-int/2addr v2, v0
    if-lez v2, :cond_1484
    const-string v0, "ۢ᩷ۖ"
    const/4 v2, 0x1
    invoke-static {v0, v2}, Ll/ۡ۫;->۠ۢ᩶(Ljava/lang/Object;I)C
    move-result v2
    xor-int v2, v2, v63
    move/from16 v57, v1
    const/4 v1, 0x0
    invoke-static {v0, v1}, Ll/ۡ۫;->۠ۢ᩶(Ljava/lang/Object;I)C
    move-result v1
    mul-int v2, v2, v1
    const/4 v1, 0x2
    invoke-static {v0, v1}, Ll/ܽ᩵;->ᩳ᩹֨(Ljava/lang/Object;I)C
    move-result v0
    sub-int/2addr v2, v0
    goto :goto_149d
    :cond_1484
    move/from16 v57, v1
    const-string v0, "ܶۚܽ"
    const/4 v1, 0x1
    invoke-static {v0, v1}, Ll/ۡ۫;->۠ۢ᩶(Ljava/lang/Object;I)C
    move-result v1
    xor-int v1, v1, v63
    :goto_148f
    const/4 v2, 0x0
    invoke-static {v0, v2}, Ll/ۡ۫;->۠ۢ᩶(Ljava/lang/Object;I)C
    move-result v2
    mul-int v1, v1, v2
    const/4 v2, 0x2
    invoke-static {v0, v2}, Ll/ۡ۫;->۠ۢ᩶(Ljava/lang/Object;I)C
    move-result v0
    :goto_149b
    sub-int v2, v1, v0
    :goto_149d
    move/from16 v82, v3
    move-object/from16 v79, v4
    move/from16 v68, v7
    move-object/from16 v4, v18
    move-object/from16 v81, v23
    move-object/from16 v1, v24
    move-object/from16 v18, v28
    move-object/from16 v7, v29
    move/from16 v3, v44
    move/from16 v0, v45
    move/from16 v28, v48
    move/from16 v80, v49
    move-object/from16 v24, v50
    move-object/from16 v74, v52
    move-object/from16 v76, v53
    move/from16 v77, v54
    move/from16 v78, v55
    move/from16 v75, v56
    move/from16 v67, v57
    :goto_14c3
    move-object/from16 v71, v58
    move/from16 v72, v59
    move/from16 v73, v60
    move-object/from16 v69, v64
    move/from16 v70, v66
    goto/16 :goto_161a
    move/from16 v45, v0
    move/from16 v44, v3
    move-object/from16 v46, v6
    move-object/from16 v6, v23
    move-object/from16 v50, v24
    move/from16 v48, v28
    move/from16 v47, v38
    move/from16 v38, v43
    move/from16 v57, v67
    move-object/from16 v64, v69
    move/from16 v66, v70
    move-object/from16 v58, v71
    move/from16 v59, v72
    move/from16 v60, v73
    move-object/from16 v52, v74
    move/from16 v56, v75
    move-object/from16 v53, v76
    move/from16 v54, v77
    move/from16 v55, v78
    move/from16 v49, v80
    move-object/from16 v23, v81
    move/from16 v3, v82
    move-object/from16 v24, v1
    move-object/from16 v43, v5
    move-object/from16 v28, v18
    move/from16 v5, v29
    move-object/from16 v18, v4
    move-object/from16 v29, v7
    move/from16 v7, v68
    move-object/from16 v4, v79
    aget-short v67, v36, v37
    mul-int v0, v67, v67
    .line 171
    sget v2, Ll/ܽ᩵;->᩻ۗ֨:I
    if-ltz v2, :cond_151e
    :goto_1513
    const-string v0, "ۤܺۢ"
    const/4 v1, 0x1
    invoke-static {v0, v1}, Ll/ܽ᩵;->ᩳ᩹֨(Ljava/lang/Object;I)C
    move-result v1
    xor-int v1, v1, v62
    goto/16 :goto_148f
    :cond_151e
    const-string v2, "ۖۢ᩹"
    const/4 v1, 0x1
    invoke-static {v2, v1}, Ll/ܽ᩵;->ᩳ᩹֨(Ljava/lang/Object;I)C
    move-result v1
    move/from16 v68, v0
    const/4 v0, 0x2
    invoke-static {v2, v0}, Ll/ۡ۫;->۠ۢ᩶(Ljava/lang/Object;I)C
    move-result v0
    mul-int v1, v1, v0
    xor-int v0, v1, v62
    const/4 v1, 0x0
    invoke-static {v2, v1}, Ll/ۡ۫;->۠ۢ᩶(Ljava/lang/Object;I)C
    move-result v1
    add-int v2, v0, v1
    move/from16 v82, v3
    move-object/from16 v79, v4
    move-object/from16 v4, v18
    move-object/from16 v81, v23
    move-object/from16 v1, v24
    move-object/from16 v18, v28
    move/from16 v3, v44
    move/from16 v0, v45
    move/from16 v28, v48
    move/from16 v80, v49
    move-object/from16 v24, v50
    move-object/from16 v74, v52
    move-object/from16 v76, v53
    move/from16 v77, v54
    move/from16 v78, v55
    move/from16 v75, v56
    move-object/from16 v71, v58
    move/from16 v72, v59
    move/from16 v73, v60
    move-object/from16 v69, v64
    move/from16 v70, v66
    move/from16 v39, v68
    const v41, 0x8526640
    move-object/from16 v23, v6
    move/from16 v68, v7
    move-object/from16 v7, v29
    move-object/from16 v6, v46
    move/from16 v29, v5
    move-object/from16 v5, v43
    goto/16 :goto_1622
    move/from16 v45, v0
    move/from16 v44, v3
    move-object/from16 v46, v6
    move-object/from16 v6, v23
    move-object/from16 v50, v24
    move/from16 v48, v28
    move/from16 v47, v38
    move/from16 v38, v43
    move/from16 v57, v67
    move-object/from16 v64, v69
    move/from16 v66, v70
    move-object/from16 v58, v71
    move/from16 v59, v72
    move/from16 v60, v73
    move-object/from16 v52, v74
    move/from16 v56, v75
    move-object/from16 v53, v76
    move/from16 v54, v77
    move/from16 v55, v78
    move/from16 v49, v80
    move-object/from16 v23, v81
    move/from16 v3, v82
    move-object/from16 v24, v1
    move-object/from16 v43, v5
    move-object/from16 v28, v18
    move/from16 v5, v29
    move-object/from16 v18, v4
    move-object/from16 v29, v7
    move/from16 v7, v68
    move-object/from16 v4, v79
    sget-object v0, Lbin/mt/plus/ShortcutActivity;->۠ܶۧ:[S
    sget v2, Ll/᩺ܳ;->ۖۤܳ:I
    if-gtz v2, :cond_15cd
    :goto_15b6
    const-string v0, "۬֡ۧ"
    const/4 v1, 0x1
    invoke-static {v0, v1}, Ll/ۡ۫;->۠ۢ᩶(Ljava/lang/Object;I)C
    move-result v1
    xor-int v1, v1, v62
    const/4 v2, 0x0
    invoke-static {v0, v2}, Ll/ܽ᩵;->ᩳ᩹֨(Ljava/lang/Object;I)C
    move-result v2
    mul-int v1, v1, v2
    const/4 v2, 0x2
    invoke-static {v0, v2}, Ll/ܽ᩵;->ᩳ᩹֨(Ljava/lang/Object;I)C
    move-result v0
    goto/16 :goto_149b
    :cond_15cd
    const-string v2, "ۗ֫ۖ"
    const/4 v1, 0x1
    invoke-static {v2, v1}, Ll/ܽ᩵;->ᩳ᩹֨(Ljava/lang/Object;I)C
    move-result v1
    move-object/from16 v37, v0
    const/4 v0, 0x2
    invoke-static {v2, v0}, Ll/ܽ᩵;->ᩳ᩹֨(Ljava/lang/Object;I)C
    move-result v0
    mul-int v1, v1, v0
    xor-int v0, v1, v63
    const/4 v1, 0x0
    invoke-static {v2, v1}, Ll/ۡ۫;->۠ۢ᩶(Ljava/lang/Object;I)C
    move-result v1
    add-int v2, v0, v1
    move/from16 v82, v3
    move-object/from16 v79, v4
    move/from16 v68, v7
    move-object/from16 v4, v18
    move-object/from16 v81, v23
    move-object/from16 v1, v24
    move-object/from16 v18, v28
    move-object/from16 v7, v29
    move-object/from16 v36, v37
    move/from16 v3, v44
    move/from16 v0, v45
    move/from16 v28, v48
    move/from16 v80, v49
    move-object/from16 v24, v50
    move-object/from16 v74, v52
    move-object/from16 v76, v53
    move/from16 v77, v54
    move/from16 v78, v55
    move/from16 v75, v56
    move/from16 v67, v57
    move-object/from16 v71, v58
    move/from16 v72, v59
    move/from16 v73, v60
    move-object/from16 v69, v64
    move/from16 v70, v66
    const/16 v37, 0xa
    :goto_161a
    move/from16 v29, v5
    move-object/from16 v23, v6
    move-object/from16 v5, v43
    :goto_1620
    move-object/from16 v6, v46
    :goto_1622
    move/from16 v43, v38
    :goto_1624
    move/from16 v38, v47
    goto/16 :goto_d6
    :cond_1628
    .sparse-switch
        -98440750 -> :sswitch_7dc
        -25471098 -> :sswitch_dbb
        -21108667 -> :sswitch_4f8
        -17737715 -> :sswitch_132
        -17712981 -> :sswitch_310
        -17692677 -> :sswitch_25f
        -17675380 -> :sswitch_a07
        -17122641 -> :sswitch_fd0
        -16983404 -> :sswitch_c45
        -16943218 -> :sswitch_1d9
        -16839067 -> :sswitch_3b5
        -12575626 -> :sswitch_12
        -11991002 -> :sswitch_b77
        -11931542 -> :sswitch_134f
        -11900858 -> :sswitch_748
        -6701483 -> :sswitch_205
        -6579059 -> :sswitch_2d9
        -6547629 -> :sswitch_223
        -3411078 -> :sswitch_a65
        -3256879 -> :sswitch_747
        -3253861 -> :sswitch_11e5
        -3113718 -> :sswitch_4ac
        -1985744 -> :sswitch_81
        -1965832 -> :sswitch_458
        -1912896 -> :sswitch_404
        -1886829 -> :sswitch_5d5
        -1886470 -> :sswitch_6bb
        -1828527 -> :sswitch_8d8
        -1822375 -> :sswitch_291
        -1818762 -> :sswitch_1ec
        -1803326 -> :sswitch_d1e
        -1765868 -> :sswitch_513
        -1752716 -> :sswitch_1d1
        -1750625 -> :sswitch_1110
        -1749574 -> :sswitch_896
        -1747909 -> :sswitch_346
        -1747535 -> :sswitch_629
        -1737377 -> :sswitch_149e
        -1728829 -> :sswitch_420
        1444572 -> :sswitch_97b
        1738092 -> :sswitch_af0
        1739800 -> :sswitch_23b
        1743598 -> :sswitch_4f4
        1745788 -> :sswitch_541
        1754582 -> :sswitch_3cb
        1756471 -> :sswitch_399
        1757187 -> :sswitch_231
        1823678 -> :sswitch_c89
        1826759 -> :sswitch_cc8
        1827048 -> :sswitch_594
        2244794 -> :sswitch_45e
        2343187 -> :sswitch_1f8
        2416407 -> :sswitch_12d8
        2419898 -> :sswitch_f05
        2434597 -> :sswitch_33f
        2540557 -> :sswitch_13f9
        2554693 -> :sswitch_713
        2555301 -> :sswitch_16b
        2557297 -> :sswitch_bf5
        3085871 -> :sswitch_480
        3093355 -> :sswitch_e4b
        3093452 -> :sswitch_2f4
        3255443 -> :sswitch_797
        6561173 -> :sswitch_36f
        6563530 -> :sswitch_853
        6565157 -> :sswitch_915
        6571373 -> :sswitch_66b
        6574777 -> :sswitch_3e
        6725029 -> :sswitch_fb
        8859928 -> :sswitch_824
        11590448 -> :sswitch_129b
        11651121 -> :sswitch_1e0
        11946862 -> :sswitch_6ed
        12506365 -> :sswitch_20e
        44577338 -> :sswitch_1c1
        44590712 -> :sswitch_2b3
        45901765 -> :sswitch_433
        45909308 -> :sswitch_1063
    .end sparse-switch
.end method

.method public static Lbin/mt/plus/ShortcutActivity;->᩵()Z
    .registers 7
    const/4 v0, 0x0
    sget v1, Ll/ܰۡ;->ۢᩳۛ:I
    sget v2, Ll/᩻ᩴ;->ۤ᩹ۜ:I
    const-string v3, "ۨۤ᩶"
    :goto_7
    invoke-static {v3}, Ll/ۤ֨;->۬ۚᩴ(Ljava/lang/Object;)I
    move-result v3
    :goto_b
    xor-int/2addr v3, v2
    :goto_c
    sparse-switch v3, :cond_188
    .line 262
    invoke-static {}, Ll/ܽ᩶;->ۖܶ᩹()I
    invoke-static {}, Ll/ۤ֫;->֡ۖۛ()I
    move-result v3
    if-nez v3, :cond_bf
    goto/16 :goto_12c
    .line 259
    invoke-static {}, Ll/ᩴᩳ;->ۛܰܶ()I
    sget-boolean v3, Ll/ۛܰ;->ۗ᩻֨:Z
    if-nez v3, :cond_87
    goto/16 :goto_12c
    .line 263
    invoke-static {}, Ll/ۘ;->۬ۖ۬()I
    sget v3, Ll/ᩴ᩵;->۟᩹᩵:I
    if-nez v3, :cond_2c
    goto/16 :goto_12c
    :cond_2c
    const-string v3, "ۤ᩹֫"
    goto/16 :goto_157
    .line 260
    invoke-static {}, Ll/֫;->֨᩶᩸()I
    invoke-static {}, Ll/ܰۡ;->᩷۫֡()I
    goto/16 :goto_12c
    invoke-static {}, Ll/ۤ֫;->֡ۖۛ()I
    const/4 v0, 0x0
    return v0
    invoke-static {v0}, Ll/ۛܳ;->᩷֡ܽ(Z)Ljava/lang/Boolean;
    move-result-object v3
    sput-object v3, Lbin/mt/plus/ShortcutActivity;->ۘۖ:Ljava/lang/Boolean;
    goto/16 :goto_16d
    sget v3, Ll/֨֡;->ܿܿ᩺:I
    if-ltz v3, :cond_4b
    goto/16 :goto_100
    :cond_4b
    const-string v3, "ܶ۠ܺ"
    const/4 v4, 0x0
    invoke-static {v3, v4}, Ll/ܽ᩵;->ᩳ᩹֨(Ljava/lang/Object;I)C
    move-result v4
    mul-int/lit16 v4, v4, 0x3c1
    const/4 v5, 0x1
    invoke-static {v3, v5}, Ll/ܽ᩵;->ᩳ᩹֨(Ljava/lang/Object;I)C
    move-result v5
    mul-int/lit8 v5, v5, 0x1f
    add-int/2addr v4, v5
    xor-int/2addr v4, v2
    goto/16 :goto_167
    invoke-static {}, Ll/ۤ֨;->֫ܽ۫()Z
    move-result v3
    if-eqz v3, :cond_67
    goto/16 :goto_100
    :cond_67
    const-string v3, "۫ܰۢ"
    const/4 v4, 0x0
    invoke-static {v3, v4}, Ll/ܽ᩵;->ᩳ᩹֨(Ljava/lang/Object;I)C
    move-result v4
    mul-int/lit16 v4, v4, 0x3c1
    const/4 v5, 0x1
    invoke-static {v3, v5}, Ll/ܽ᩵;->ᩳ᩹֨(Ljava/lang/Object;I)C
    move-result v5
    goto :goto_b3
    sget v3, Ll/ۘ;->ۢۤᩳ:I
    if-ltz v3, :cond_7c
    goto/16 :goto_100
    :cond_7c
    const-string v3, "ۧ᩶ᩴ"
    invoke-static {v3}, Ll/ۙۘ;->ۙᩴ۫(Ljava/lang/Object;)I
    move-result v3
    goto :goto_e3
    .line 263
    sget-boolean v3, Ll/ۛܳ;->ۡ֨ᩴ:Z
    if-eqz v3, :cond_90
    :cond_87
    const-string v3, "ܶۖܺ"
    const/4 v4, 0x1
    invoke-static {v3, v4}, Ll/ܽ᩵;->ᩳ᩹֨(Ljava/lang/Object;I)C
    move-result v4
    xor-int/2addr v4, v1
    goto :goto_c7
    :cond_90
    const-string v3, "ܶۚۗ"
    const/4 v4, 0x0
    invoke-static {v3, v4}, Ll/ۡ۫;->۠ۢ᩶(Ljava/lang/Object;I)C
    move-result v4
    mul-int/lit16 v4, v4, 0x3c1
    const/4 v5, 0x1
    invoke-static {v3, v5}, Ll/ۡ۫;->۠ۢ᩶(Ljava/lang/Object;I)C
    move-result v5
    goto/16 :goto_17b
    sget v3, Ll/۬ۨ;->۫ۜۖ:I
    if-ltz v3, :cond_a5
    goto :cond_bf
    :cond_a5
    const-string v3, "ۖ۫ܰ"
    const/4 v4, 0x0
    invoke-static {v3, v4}, Ll/ܽ᩵;->ᩳ᩹֨(Ljava/lang/Object;I)C
    move-result v4
    mul-int/lit16 v4, v4, 0x3c1
    const/4 v5, 0x1
    invoke-static {v3, v5}, Ll/ۡ۫;->۠ۢ᩶(Ljava/lang/Object;I)C
    move-result v5
    :goto_b3
    mul-int/lit8 v5, v5, 0x1f
    add-int/2addr v4, v5
    xor-int/2addr v4, v2
    goto/16 :goto_17f
    .line 261
    invoke-static {}, Ll/ۘ᩺;->ۡᩴᩳ()Z
    move-result v3
    if-eqz v3, :cond_d4
    :cond_bf
    const-string v3, "ۤۧ᩸"
    const/4 v4, 0x1
    invoke-static {v3, v4}, Ll/ۡ۫;->۠ۢ᩶(Ljava/lang/Object;I)C
    move-result v4
    xor-int/2addr v4, v2
    :goto_c7
    const/4 v5, 0x0
    invoke-static {v3, v5}, Ll/ܽ᩵;->ᩳ᩹֨(Ljava/lang/Object;I)C
    move-result v5
    mul-int v4, v4, v5
    const/4 v5, 0x2
    invoke-static {v3, v5}, Ll/ۡ۫;->۠ۢ᩶(Ljava/lang/Object;I)C
    move-result v3
    goto :goto_11c
    :cond_d4
    const-string v3, "ܽ۠ۢ"
    goto/16 :goto_7
    sget-boolean v3, Ll/ۛܶ;->ۙ᩵᩶:Z
    if-nez v3, :cond_dd
    goto :goto_12c
    :cond_dd
    const-string v3, "ܳ᩷ۗ"
    invoke-static {v3}, Ll/ۤ֨;->۬ۚᩴ(Ljava/lang/Object;)I
    move-result v3
    :goto_e3
    xor-int/2addr v3, v1
    goto/16 :goto_c
    .line 259
    sget v3, Ll/ۤۚ;->ۖۡۢ:I
    if-ltz v3, :cond_eb
    goto :goto_12c
    :cond_eb
    const-string v3, "᩶᩸ۗ"
    const/4 v4, 0x1
    invoke-static {v3, v4}, Ll/ܽ᩵;->ᩳ᩹֨(Ljava/lang/Object;I)C
    move-result v4
    const/4 v5, 0x2
    invoke-static {v3, v5}, Ll/ܽ᩵;->ᩳ᩹֨(Ljava/lang/Object;I)C
    move-result v5
    mul-int v4, v4, v5
    xor-int/2addr v4, v2
    const/4 v5, 0x0
    goto :goto_168
    sget v3, Ll/ۤ۟;->ۤᩴۚ:I
    if-ltz v3, :cond_108
    :goto_100
    const-string v3, "᩶֡ᩳ"
    invoke-static {v3}, Ll/ۙۘ;->ۙᩴ۫(Ljava/lang/Object;)I
    move-result v3
    goto/16 :goto_b
    :cond_108
    const-string v3, "ۜܽ֨"
    :goto_10a
    const/4 v4, 0x1
    invoke-static {v3, v4}, Ll/ۡ۫;->۠ۢ᩶(Ljava/lang/Object;I)C
    move-result v4
    xor-int/2addr v4, v1
    const/4 v5, 0x0
    invoke-static {v3, v5}, Ll/ۡ۫;->۠ۢ᩶(Ljava/lang/Object;I)C
    move-result v5
    mul-int v4, v4, v5
    const/4 v5, 0x2
    invoke-static {v3, v5}, Ll/ܽ᩵;->ᩳ᩹֨(Ljava/lang/Object;I)C
    move-result v3
    :goto_11c
    sub-int v3, v4, v3
    goto/16 :goto_c
    .line 260
    invoke-static {}, Ll/ۡ۫;->۠ۚۧ()Landroid/app/Application;
    move-result-object v3
    invoke-static {v3}, Ll/֨᩺;->ۢ(Landroid/content/Context;)Z
    move-result v3
    sget-boolean v4, Ll/ᩴ;->ܳ᩺ܳ:Z
    if-eqz v4, :cond_12f
    :goto_12c
    const-string v3, "ۧ᩹ܰ"
    goto :goto_10a
    :cond_12f
    const-string v0, "֨ۢܽ"
    const/4 v4, 0x1
    invoke-static {v0, v4}, Ll/ܽ᩵;->ᩳ᩹֨(Ljava/lang/Object;I)C
    move-result v4
    xor-int/2addr v4, v2
    const/4 v5, 0x0
    invoke-static {v0, v5}, Ll/ۡ۫;->۠ۢ᩶(Ljava/lang/Object;I)C
    move-result v5
    mul-int v4, v4, v5
    const/4 v5, 0x2
    invoke-static {v0, v5}, Ll/ۡ۫;->۠ۢ᩶(Ljava/lang/Object;I)C
    move-result v0
    sub-int v0, v4, v0
    move v6, v3
    move v3, v0
    move v0, v6
    goto/16 :goto_c
    .line 262
    sget-object v0, Lbin/mt/plus/ShortcutActivity;->ۘۖ:Ljava/lang/Boolean;
    invoke-static {v0}, Ll/ܳܺ;->ܿ᩻֡(Ljava/lang/Object;)Z
    move-result v0
    return v0
    .line 259
    sget-object v3, Lbin/mt/plus/ShortcutActivity;->ۘۖ:Ljava/lang/Boolean;
    if-nez v3, :goto_16d
    const-string v3, "ܳ֫۬"
    :goto_157
    const/4 v4, 0x0
    invoke-static {v3, v4}, Ll/ۡ۫;->۠ۢ᩶(Ljava/lang/Object;I)C
    move-result v4
    mul-int/lit16 v4, v4, 0x3c1
    const/4 v5, 0x1
    invoke-static {v3, v5}, Ll/ܽ᩵;->ᩳ᩹֨(Ljava/lang/Object;I)C
    move-result v5
    mul-int/lit8 v5, v5, 0x1f
    add-int/2addr v4, v5
    xor-int/2addr v4, v1
    :goto_167
    const/4 v5, 0x2
    :goto_168
    invoke-static {v3, v5}, Ll/ۡ۫;->۠ۢ᩶(Ljava/lang/Object;I)C
    move-result v3
    goto :goto_184
    :goto_16d
    const-string v3, "ۛۢۨ"
    const/4 v4, 0x0
    invoke-static {v3, v4}, Ll/ۡ۫;->۠ۢ᩶(Ljava/lang/Object;I)C
    move-result v4
    mul-int/lit16 v4, v4, 0x3c1
    const/4 v5, 0x1
    invoke-static {v3, v5}, Ll/ܽ᩵;->ᩳ᩹֨(Ljava/lang/Object;I)C
    move-result v5
    :goto_17b
    mul-int/lit8 v5, v5, 0x1f
    add-int/2addr v4, v5
    xor-int/2addr v4, v1
    :goto_17f
    const/4 v5, 0x2
    invoke-static {v3, v5}, Ll/ܽ᩵;->ᩳ᩹֨(Ljava/lang/Object;I)C
    move-result v3
    :goto_184
    add-int/2addr v3, v4
    goto/16 :goto_c
    nop
    :cond_188
    .sparse-switch
        1311041 -> :cond_2c
        1728804 -> :sswitch_77
        1741007 -> :sswitch_13e
        1767334 -> :sswitch_39
        1768133 -> :sswitch_145
        1815970 -> :sswitch_114
        1820707 -> :sswitch_31
        1836377 -> :sswitch_6a
        1843648 -> :sswitch_94
        1912699 -> :sswitch_53
        1988909 -> :sswitch_ad
        6568919 -> :sswitch_e
        11880301 -> :sswitch_cc
        12180171 -> :sswitch_f0
        14220396 -> :sswitch_da
        14308342 -> :sswitch_17
        14824936 -> :sswitch_24
    .end sparse-switch
.end method

.method public static Lbin/mt/plus/ShortcutActivity;->᩸(Ljava/lang/String;)V
    .registers 2
    .line 292
    sget-object v0, Lbin/mt/plus/ShortcutActivity;->ܽۖ:Ll/۠᩺۟;
    invoke-static {v0, v1}, Ll/᩻᩺;->ܺۖܰ(Ljava/lang/Object;Ljava/lang/Object;)Ll/۠᩺۟;
    move-result-object v1
    invoke-static {v1}, Ll/ۙ֫;->ᩴۨᩳ(Ljava/lang/Object;)Z
    return-void
.end method

.method public final Lbin/mt/plus/ShortcutActivity;->onCreate(Landroid/os/Bundle;)V
    .registers 41
    move-object/from16 v0, v39
    const/4 v4, 0x0
    const/4 v5, 0x0
    const/4 v6, 0x0
    const/4 v7, 0x0
    const/4 v8, 0x0
    const/4 v9, 0x0
    const/4 v10, 0x0
    const/4 v11, 0x0
    const/4 v12, 0x0
    const/4 v13, 0x0
    const/4 v14, 0x0
    const/4 v15, 0x0
    const/16 v16, 0x0
    const/16 v17, 0x0
    const/16 v18, 0x0
    const/16 v19, 0x0
    const/16 v20, 0x0
    const/16 v21, 0x0
    const/16 v22, 0x0
    const/16 v23, 0x0
    const/16 v24, 0x0
    const/16 v25, 0x0
    const/16 v26, 0x0
    const/16 v27, 0x0
    const/16 v28, 0x0
    const/16 v29, 0x0
    const/16 v30, 0x0
    const/16 v31, 0x0
    sget v32, Ll/᩻᩺;->۟ۘ۫:I
    sget v33, Ll/ۚۙ;->ܽ۟֡:I
    const-string v1, "ۛۛ᩵"
    const/4 v2, 0x1
    invoke-static {v1, v2}, Ll/ܽ᩵;->ᩳ᩹֨(Ljava/lang/Object;I)C
    move-result v2
    xor-int v2, v2, v33
    const/4 v3, 0x0
    invoke-static {v1, v3}, Ll/ۡ۫;->۠ۢ᩶(Ljava/lang/Object;I)C
    move-result v3
    mul-int v2, v2, v3
    const/4 v3, 0x2
    invoke-static {v1, v3}, Ll/ܽ᩵;->ᩳ᩹֨(Ljava/lang/Object;I)C
    move-result v1
    sub-int/2addr v2, v1
    move-object v8, v7
    const/4 v1, 0x0
    const/4 v3, 0x0
    const/4 v4, 0x0
    const/4 v5, 0x0
    const/4 v6, 0x0
    const/4 v7, 0x0
    const/4 v9, 0x0
    const/4 v10, 0x0
    const/4 v11, 0x0
    const/4 v12, 0x0
    const/4 v13, 0x0
    const/4 v14, 0x0
    const/4 v15, 0x0
    const/16 v16, 0x0
    const/16 v17, 0x0
    const/16 v18, 0x0
    const/16 v19, 0x0
    const/16 v20, 0x0
    const/16 v21, 0x0
    const/16 v22, 0x0
    const/16 v23, 0x0
    const/16 v24, 0x0
    const/16 v25, 0x0
    const/16 v26, 0x0
    const/16 v27, 0x0
    const/16 v28, 0x0
    const/16 v29, 0x0
    const/16 v30, 0x0
    const/16 v31, 0x0
    const/16 v34, 0x0
    :goto_78
    sparse-switch v2, :cond_828
    move-object/from16 v36, v3
    move/from16 v35, v6
    move/from16 v37, v11
    if-eqz v17, :cond_330
    const-string/jumbo v2, "᩻ۡ᩵"
    const/4 v3, 0x1
    invoke-static {v2, v3}, Ll/ۡ۫;->۠ۢ᩶(Ljava/lang/Object;I)C
    move-result v3
    const/4 v6, 0x2
    invoke-static {v2, v6}, Ll/ܽ᩵;->ᩳ᩹֨(Ljava/lang/Object;I)C
    move-result v6
    mul-int v3, v3, v6
    xor-int v3, v3, v33
    goto/16 :goto_2cc
    :try_start_0096
    .line 83
    invoke-virtual {v1}, Landroid/content/Intent;->getExtras()Landroid/os/Bundle;
    move-result-object v2
    invoke-static {v0, v2, v9}, Lbin/mt/plus/Main;->ۖ(Landroid/app/Activity;Landroid/os/Bundle;Z)V
    :try_end_0096
    :try_end_0096
    move-object/from16 v36, v1
    move/from16 v35, v6
    move/from16 v37, v11
    goto/16 :goto_7a2
    :try_start_00a5
    .line 88
    new-instance v2, Landroid/content/Intent;
    invoke-direct {v2, v0, v8}, Landroid/content/Intent;-><init>(Landroid/content/Context;Ljava/lang/Class;)V
    .line 89
    invoke-static {v2, v10}, Ll/ۤ֫;->᩸֫ܿ(Ljava/lang/Object;I)Landroid/content/Intent;
    .line 90
    invoke-static {v2, v7}, Ll/ᩴ;->֨᩷ۜ(Ljava/lang/Object;I)Landroid/content/Intent;
    :try_end_00a5
    :try_end_00a5
    move/from16 v35, v6
    :try_start_00b2
    sget-object v6, Lbin/mt/plus/ShortcutActivity;->۠ܶۧ:[S
    :try_end_00b2
    :try_end_00b2
    move-object/from16 v36, v3
    const/16 v3, 0x162
    move/from16 v37, v11
    const/16 v11, 0x1a
    :try_start_00bc
    invoke-static {v6, v3, v11, v5}, Ll/᩹;->ܿۧۗ([SIII)Ljava/lang/String;
    move-result-object v3
    .line 91
    invoke-virtual {v2, v3}, Landroid/content/Intent;->setAction(Ljava/lang/String;)Landroid/content/Intent;
    .line 92
    new-instance v3, Ljava/io/File;
    invoke-direct {v3, v4}, Ljava/io/File;-><init>(Ljava/lang/String;)V
    invoke-static {v3}, Landroid/net/Uri;->fromFile(Ljava/io/File;)Landroid/net/Uri;
    move-result-object v3
    invoke-virtual {v2, v3}, Landroid/content/Intent;->setData(Landroid/net/Uri;)Landroid/content/Intent;
    sget-object v3, Lbin/mt/plus/ShortcutActivity;->۠ܶۧ:[S
    const/16 v6, 0x17c
    const/16 v11, 0x8
    invoke-static {v3, v6, v11, v5}, Ll/ܽ֫;->᩺۬ۜ([SIII)Ljava/lang/String;
    move-result-object v3
    .line 93
    invoke-virtual {v2, v3, v9}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Z)Landroid/content/Intent;
    .line 94
    invoke-static {v0, v2}, Ll/ۚۘ;->ۡۖ᩺(Ljava/lang/Object;Ljava/lang/Object;)V
    :try_end_00bc
    :try_end_00bc
    goto/16 :cond_330
    move-object/from16 v36, v3
    move/from16 v37, v11
    goto/16 :cond_330
    move/from16 v35, v6
    move/from16 v37, v11
    goto/16 :goto_7a0
    move-object/from16 v36, v3
    move/from16 v35, v6
    move/from16 v37, v11
    if-nez v31, :cond_330
    const-string/jumbo v2, "᩻ᩳ᩺"
    const/4 v3, 0x1
    invoke-static {v2, v3}, Ll/ܽ᩵;->ᩳ᩹֨(Ljava/lang/Object;I)C
    move-result v3
    xor-int v3, v3, v32
    goto/16 :goto_2a4
    move-object/from16 v36, v3
    move/from16 v35, v6
    move/from16 v37, v11
    if-nez v30, :cond_330
    const-string v2, "۬ۚ᩸"
    const/4 v3, 0x0
    invoke-static {v2, v3}, Ll/ۡ۫;->۠ۢ᩶(Ljava/lang/Object;I)C
    move-result v3
    mul-int/lit16 v3, v3, 0x3c1
    const/4 v6, 0x1
    invoke-static {v2, v6}, Ll/ܽ᩵;->ᩳ᩹֨(Ljava/lang/Object;I)C
    move-result v6
    mul-int/lit8 v6, v6, 0x1f
    add-int/2addr v3, v6
    xor-int v3, v3, v32
    goto/16 :goto_324
    move-object/from16 v36, v3
    move/from16 v35, v6
    move/from16 v37, v11
    :try_start_0124
    .line 98
    new-instance v2, Landroid/content/Intent;
    invoke-direct {v2, v0, v8}, Landroid/content/Intent;-><init>(Landroid/content/Context;Ljava/lang/Class;)V
    .line 99
    invoke-static {v2, v10}, Ll/ۤ֫;->᩸֫ܿ(Ljava/lang/Object;I)Landroid/content/Intent;
    .line 100
    invoke-static {v2, v7}, Ll/ᩴ;->֨᩷ۜ(Ljava/lang/Object;I)Landroid/content/Intent;
    .line 101
    invoke-static {v0, v2}, Ll/ۚۘ;->ۡۖ᩺(Ljava/lang/Object;Ljava/lang/Object;)V
    goto/16 :cond_330
    move-object/from16 v36, v3
    move/from16 v35, v6
    move/from16 v37, v11
    .line 123
    new-instance v2, Landroid/content/Intent;
    const-class v3, Ll/ۨ᩺᩻;
    invoke-direct {v2, v0, v3}, Landroid/content/Intent;-><init>(Landroid/content/Context;Ljava/lang/Class;)V
    .line 124
    invoke-static {v2, v10}, Ll/ᩴ;->֨᩷ۜ(Ljava/lang/Object;I)Landroid/content/Intent;
    .line 125
    invoke-static {v0, v2}, Ll/ۤܿ;->ᩴܶۧ(Ljava/lang/Object;Ljava/lang/Object;)V
    goto/16 :cond_330
    move-object/from16 v36, v3
    move/from16 v35, v6
    move/from16 v37, v11
    .line 128
    new-instance v2, Landroid/content/Intent;
    const-class v3, Ll/֡ۖ֨;
    invoke-direct {v2, v0, v3}, Landroid/content/Intent;-><init>(Landroid/content/Context;Ljava/lang/Class;)V
    .line 129
    invoke-static {v2, v10}, Ll/ᩴ;->֨᩷ۜ(Ljava/lang/Object;I)Landroid/content/Intent;
    .line 130
    invoke-static {v0, v2}, Ll/ۚۘ;->ۡۖ᩺(Ljava/lang/Object;Ljava/lang/Object;)V
    goto/16 :cond_330
    move-object/from16 v36, v3
    move/from16 v35, v6
    move/from16 v37, v11
    .line 118
    new-instance v2, Landroid/content/Intent;
    const-class v3, Ll/֫ۙۡ;
    invoke-direct {v2, v0, v3}, Landroid/content/Intent;-><init>(Landroid/content/Context;Ljava/lang/Class;)V
    .line 119
    invoke-static {v2, v10}, Ll/ۤ֫;->᩸֫ܿ(Ljava/lang/Object;I)Landroid/content/Intent;
    .line 120
    invoke-static {v0, v2}, Ll/ۚۘ;->ۡۖ᩺(Ljava/lang/Object;Ljava/lang/Object;)V
    goto/16 :cond_330
    move-object/from16 v36, v3
    move/from16 v35, v6
    move/from16 v37, v11
    .line 113
    new-instance v2, Landroid/content/Intent;
    const-class v3, Ll/ۤᩴ᩻;
    invoke-direct {v2, v0, v3}, Landroid/content/Intent;-><init>(Landroid/content/Context;Ljava/lang/Class;)V
    .line 114
    invoke-static {v2, v10}, Ll/ۤ֫;->᩸֫ܿ(Ljava/lang/Object;I)Landroid/content/Intent;
    .line 115
    invoke-static {v0, v2}, Ll/ۚۘ;->ۡۖ᩺(Ljava/lang/Object;Ljava/lang/Object;)V
    goto/16 :cond_330
    move-object/from16 v36, v3
    move/from16 v35, v6
    move/from16 v37, v11
    .line 139
    new-instance v2, Ljava/lang/RuntimeException;
    invoke-direct {v2}, Ljava/lang/RuntimeException;-><init>()V
    throw v2
    move-object/from16 v36, v3
    move/from16 v35, v6
    move/from16 v37, v11
    .line 82
    invoke-static {v4}, Ll/֨ۖ;->ۨۡᩳ(Ljava/lang/Object;)Z
    move-result v31
    :try_end_0124
    :try_end_0124
    const-string v2, "ܰᩴۢ"
    const/4 v3, 0x1
    invoke-static {v2, v3}, Ll/ܽ᩵;->ᩳ᩹֨(Ljava/lang/Object;I)C
    move-result v3
    xor-int v3, v3, v33
    const/4 v6, 0x0
    invoke-static {v2, v6}, Ll/ۡ۫;->۠ۢ᩶(Ljava/lang/Object;I)C
    move-result v6
    mul-int v3, v3, v6
    const/4 v6, 0x2
    invoke-static {v2, v6}, Ll/ۡ۫;->۠ۢ᩶(Ljava/lang/Object;I)C
    move-result v2
    goto/16 :goto_2b0
    move-object/from16 v36, v3
    move/from16 v35, v6
    move/from16 v37, v11
    :try_start_01bb
    .line 110
    invoke-virtual {v1}, Landroid/content/Intent;->getExtras()Landroid/os/Bundle;
    move-result-object v2
    invoke-static {v0, v2, v9}, Lbin/mt/plus/Main;->ۖ(Landroid/app/Activity;Landroid/os/Bundle;Z)V
    goto/16 :cond_330
    move-object/from16 v36, v3
    move/from16 v35, v6
    move/from16 v37, v11
    .line 87
    invoke-static {v4}, Ll/ۤۚ;->۟ܶۙ(Ljava/lang/Object;)Z
    move-result v30
    :try_end_01bb
    :try_end_01bb
    const-string v2, "᩷ۘܿ"
    const/4 v3, 0x1
    invoke-static {v2, v3}, Ll/ܽ᩵;->ᩳ᩹֨(Ljava/lang/Object;I)C
    move-result v3
    const/4 v6, 0x2
    invoke-static {v2, v6}, Ll/ܽ᩵;->ᩳ᩹֨(Ljava/lang/Object;I)C
    move-result v6
    goto/16 :goto_2c8
    move-object/from16 v36, v3
    move/from16 v35, v6
    move/from16 v37, v11
    :try_start_01e2
    .line 104
    new-instance v2, Landroid/content/Intent;
    const-class v3, Ll/ܶܰۡ;
    invoke-direct {v2, v0, v3}, Landroid/content/Intent;-><init>(Landroid/content/Context;Ljava/lang/Class;)V
    .line 105
    invoke-static {v2, v10}, Ll/ᩴ;->֨᩷ۜ(Ljava/lang/Object;I)Landroid/content/Intent;
    .line 106
    invoke-static {v0, v2}, Ll/ۚۘ;->ۡۖ᩺(Ljava/lang/Object;Ljava/lang/Object;)V
    :try_end_01e2
    :try_end_01e2
    goto/16 :cond_330
    move-object/from16 v36, v3
    move/from16 v35, v6
    move/from16 v37, v11
    if-eqz v29, :cond_330
    const-string v2, "᩸ۢ۫"
    const/4 v3, 0x1
    invoke-static {v2, v3}, Ll/ܽ᩵;->ᩳ᩹֨(Ljava/lang/Object;I)C
    move-result v3
    xor-int v3, v3, v33
    goto/16 :goto_264
    move-object/from16 v36, v3
    move/from16 v35, v6
    move/from16 v37, v11
    if-eqz v28, :cond_330
    const-string v2, "ۨ᩻ᩳ"
    const/4 v3, 0x1
    invoke-static {v2, v3}, Ll/ۡ۫;->۠ۢ᩶(Ljava/lang/Object;I)C
    move-result v3
    goto/16 :goto_2dd
    move-object/from16 v36, v3
    move/from16 v35, v6
    move/from16 v37, v11
    if-eqz v27, :cond_330
    goto/16 :goto_2d6
    move-object/from16 v36, v3
    move/from16 v35, v6
    move/from16 v37, v11
    if-nez v26, :cond_29a
    goto/16 :cond_330
    move-object/from16 v36, v3
    move/from16 v35, v6
    move/from16 v37, v11
    if-eqz v25, :cond_330
    const-string v2, "ۨ֡ᩴ"
    goto/16 :goto_29d
    move-object/from16 v36, v3
    move/from16 v35, v6
    move/from16 v37, v11
    if-nez v24, :cond_29a
    goto/16 :cond_330
    move-object/from16 v36, v3
    move/from16 v35, v6
    move/from16 v37, v11
    if-nez v23, :cond_29a
    goto/16 :cond_330
    move-object/from16 v36, v3
    move/from16 v35, v6
    move/from16 v37, v11
    if-eqz v22, :cond_330
    goto/16 :goto_2bc
    move-object/from16 v36, v3
    move/from16 v35, v6
    move/from16 v37, v11
    if-eqz v21, :cond_330
    const-string v2, "۠ۤܽ"
    const/4 v3, 0x1
    invoke-static {v2, v3}, Ll/ۡ۫;->۠ۢ᩶(Ljava/lang/Object;I)C
    move-result v3
    xor-int v3, v3, v32
    :goto_264
    const/4 v6, 0x0
    invoke-static {v2, v6}, Ll/ܽ᩵;->ᩳ᩹֨(Ljava/lang/Object;I)C
    move-result v6
    goto :goto_2a9
    move-object/from16 v36, v3
    move/from16 v35, v6
    move/from16 v37, v11
    if-eqz v20, :cond_330
    goto :goto_2bc
    move-object/from16 v36, v3
    move/from16 v35, v6
    move/from16 v37, v11
    if-nez v19, :cond_29a
    goto/16 :cond_330
    move-object/from16 v36, v3
    move/from16 v35, v6
    move/from16 v37, v11
    if-nez v18, :cond_29a
    goto/16 :cond_330
    move-object/from16 v36, v3
    move/from16 v35, v6
    move/from16 v37, v11
    if-eqz v16, :cond_330
    goto :goto_2bc
    move-object/from16 v36, v3
    move/from16 v35, v6
    move/from16 v37, v11
    if-nez v15, :cond_29a
    goto/16 :cond_330
    :cond_29a
    const-string/jumbo v2, "᩹᩵ᩴ"
    :goto_29d
    const/4 v3, 0x1
    invoke-static {v2, v3}, Ll/ۡ۫;->۠ۢ᩶(Ljava/lang/Object;I)C
    move-result v3
    xor-int v3, v3, v33
    :goto_2a4
    const/4 v6, 0x0
    invoke-static {v2, v6}, Ll/ۡ۫;->۠ۢ᩶(Ljava/lang/Object;I)C
    move-result v6
    :goto_2a9
    mul-int v3, v3, v6
    const/4 v6, 0x2
    invoke-static {v2, v6}, Ll/ܽ᩵;->ᩳ᩹֨(Ljava/lang/Object;I)C
    move-result v2
    :goto_2b0
    sub-int v2, v3, v2
    goto/16 :goto_32a
    move-object/from16 v36, v3
    move/from16 v35, v6
    move/from16 v37, v11
    if-eqz v14, :cond_330
    :goto_2bc
    const-string v2, "ۧۧܳ"
    const/4 v3, 0x1
    invoke-static {v2, v3}, Ll/ܽ᩵;->ᩳ᩹֨(Ljava/lang/Object;I)C
    move-result v3
    const/4 v6, 0x2
    invoke-static {v2, v6}, Ll/ۡ۫;->۠ۢ᩶(Ljava/lang/Object;I)C
    move-result v6
    :goto_2c8
    mul-int v3, v3, v6
    xor-int v3, v3, v32
    :goto_2cc
    const/4 v6, 0x0
    goto :goto_304
    move-object/from16 v36, v3
    move/from16 v35, v6
    move/from16 v37, v11
    if-eqz v13, :cond_330
    :goto_2d6
    const-string v2, "֨ۚ۟"
    const/4 v3, 0x1
    invoke-static {v2, v3}, Ll/ܽ᩵;->ᩳ᩹֨(Ljava/lang/Object;I)C
    move-result v3
    :goto_2dd
    const/4 v6, 0x2
    invoke-static {v2, v6}, Ll/ۡ۫;->۠ۢ᩶(Ljava/lang/Object;I)C
    move-result v6
    mul-int v3, v3, v6
    xor-int v3, v3, v32
    const/4 v6, 0x0
    goto :goto_325
    move-object/from16 v36, v3
    move/from16 v35, v6
    move/from16 v37, v11
    if-eqz v12, :cond_330
    const-string v2, "֫ܶܿ"
    const/4 v3, 0x0
    invoke-static {v2, v3}, Ll/ܽ᩵;->ᩳ᩹֨(Ljava/lang/Object;I)C
    move-result v3
    mul-int/lit16 v3, v3, 0x3c1
    const/4 v6, 0x1
    invoke-static {v2, v6}, Ll/ۡ۫;->۠ۢ᩶(Ljava/lang/Object;I)C
    move-result v6
    mul-int/lit8 v6, v6, 0x1f
    add-int/2addr v3, v6
    xor-int v3, v3, v33
    const/4 v6, 0x2
    :goto_304
    invoke-static {v2, v6}, Ll/ۡ۫;->۠ۢ᩶(Ljava/lang/Object;I)C
    move-result v2
    goto :goto_329
    move-object/from16 v36, v3
    move/from16 v35, v6
    move/from16 v37, v11
    if-eqz v37, :cond_330
    const-string v2, "֨ܰۗ"
    const/4 v3, 0x0
    invoke-static {v2, v3}, Ll/ܽ᩵;->ᩳ᩹֨(Ljava/lang/Object;I)C
    move-result v3
    mul-int/lit16 v3, v3, 0x3c1
    const/4 v6, 0x1
    invoke-static {v2, v6}, Ll/ܽ᩵;->ᩳ᩹֨(Ljava/lang/Object;I)C
    move-result v6
    mul-int/lit8 v6, v6, 0x1f
    add-int/2addr v3, v6
    xor-int v3, v3, v33
    :goto_324
    const/4 v6, 0x2
    :goto_325
    invoke-static {v2, v6}, Ll/ܽ᩵;->ᩳ᩹֨(Ljava/lang/Object;I)C
    move-result v2
    :goto_329
    add-int/2addr v2, v3
    :goto_32a
    move/from16 v6, v35
    move-object/from16 v3, v36
    goto/16 :goto_824
    :cond_330
    move-object/from16 v3, v36
    goto/16 :goto_7a0
    move-object/from16 v36, v3
    move/from16 v35, v6
    move/from16 v37, v11
    :try_start_033a
    .line 77
    sget-object v2, Lbin/mt/plus/ShortcutActivity;->۠ܶۧ:[S
    const/16 v3, 0x152
    const/16 v6, 0x10
    invoke-static {v2, v3, v6, v5}, Ll/ۙ᩻;->ۙ᩸᩶([SIII)Ljava/lang/String;
    move-result-object v2
    :try_end_033a
    :try_end_033a
    move-object/from16 v3, v36
    :try_start_0346
    invoke-static {v3, v2}, Ll/ܽۘ;->۫᩺ᩳ(Ljava/lang/Object;Ljava/lang/Object;)Z
    move-result v29
    const-string v2, "֨ۢ֡"
    goto/16 :goto_54c
    move/from16 v35, v6
    move/from16 v37, v11
    .line 101
    sget-object v2, Lbin/mt/plus/ShortcutActivity;->۠ܶۧ:[S
    const/16 v6, 0x142
    const/16 v11, 0x10
    invoke-static {v2, v6, v11, v5}, Ll/ۗۤ;->ܿۧۡ([SIII)Ljava/lang/String;
    move-result-object v2
    .line 77
    invoke-static {v3, v2}, Ll/ܽۘ;->۫᩺ᩳ(Ljava/lang/Object;Ljava/lang/Object;)Z
    move-result v28
    const-string/jumbo v2, "᩺ۤܰ"
    goto/16 :goto_3f1
    move/from16 v35, v6
    move/from16 v37, v11
    .line 125
    sget-object v2, Lbin/mt/plus/ShortcutActivity;->۠ܶۧ:[S
    const/16 v6, 0x132
    const/16 v11, 0x10
    invoke-static {v2, v6, v11, v5}, Ll/᩶ۤ;->۠ۚ᩶([SIII)Ljava/lang/String;
    move-result-object v2
    .line 77
    invoke-static {v3, v2}, Ll/ۙ֫;->᩺۠ۖ(Ljava/lang/Object;Ljava/lang/Object;)Z
    move-result v27
    const-string v2, "۫ۡۨ"
    goto/16 :goto_4cc
    move/from16 v35, v6
    move/from16 v37, v11
    sget-object v2, Lbin/mt/plus/ShortcutActivity;->۠ܶۧ:[S
    const/16 v6, 0x120
    const/16 v11, 0x12
    invoke-static {v2, v6, v11, v5}, Ll/ᩴᩳ;->᩻֨ᩴ([SIII)Ljava/lang/String;
    move-result-object v2
    invoke-static {v3, v2}, Ll/ܽۘ;->۫᩺ᩳ(Ljava/lang/Object;Ljava/lang/Object;)Z
    move-result v26
    :try_end_0346
    :try_end_0346
    const-string v2, "᩸ᩴ᩵"
    const/4 v6, 0x1
    invoke-static {v2, v6}, Ll/ܽ᩵;->ᩳ᩹֨(Ljava/lang/Object;I)C
    move-result v6
    goto/16 :goto_515
    move/from16 v35, v6
    move/from16 v37, v11
    :try_start_039a
    sget-object v2, Lbin/mt/plus/ShortcutActivity;->۠ܶۧ:[S
    const/16 v6, 0x113
    const/16 v11, 0xd
    invoke-static {v2, v6, v11, v5}, Ll/ۤ֨;->ۜۢۢ([SIII)Ljava/lang/String;
    move-result-object v2
    invoke-static {v3, v2}, Ll/ܽۘ;->۫᩺ᩳ(Ljava/lang/Object;Ljava/lang/Object;)Z
    move-result v25
    :try_end_039a
    :try_end_039a
    const-string v2, "ۧۨ֡"
    const/4 v6, 0x1
    invoke-static {v2, v6}, Ll/ۡ۫;->۠ۢ᩶(Ljava/lang/Object;I)C
    move-result v6
    xor-int v6, v6, v32
    const/4 v11, 0x0
    invoke-static {v2, v11}, Ll/ܽ᩵;->ᩳ᩹֨(Ljava/lang/Object;I)C
    move-result v11
    mul-int v6, v6, v11
    const/4 v11, 0x2
    invoke-static {v2, v11}, Ll/ۡ۫;->۠ۢ᩶(Ljava/lang/Object;I)C
    move-result v2
    goto/16 :goto_4b5
    move/from16 v35, v6
    move/from16 v37, v11
    :try_start_03c3
    .line 130
    sget-object v2, Lbin/mt/plus/ShortcutActivity;->۠ܶۧ:[S
    const/16 v6, 0x108
    const/16 v11, 0xb
    invoke-static {v2, v6, v11, v5}, Ll/ܳܺ;->۬ܽۤ([SIII)Ljava/lang/String;
    move-result-object v2
    .line 77
    invoke-static {v3, v2}, Ll/ۙ֫;->᩺۠ۖ(Ljava/lang/Object;Ljava/lang/Object;)Z
    move-result v24
    :try_end_03c3
    :try_end_03c3
    const-string v2, "ܿ᩷ۖ"
    const/4 v6, 0x1
    invoke-static {v2, v6}, Ll/ܽ᩵;->ᩳ᩹֨(Ljava/lang/Object;I)C
    move-result v6
    xor-int v6, v6, v32
    goto/16 :goto_4a9
    move/from16 v35, v6
    move/from16 v37, v11
    :try_start_03e0
    sget-object v2, Lbin/mt/plus/ShortcutActivity;->۠ܶۧ:[S
    const/16 v6, 0xf8
    const/16 v11, 0x10
    invoke-static {v2, v6, v11, v5}, Ll/ۗۤ;->ܿۧۡ([SIII)Ljava/lang/String;
    move-result-object v2
    invoke-static {v3, v2}, Ll/ܽۘ;->۫᩺ᩳ(Ljava/lang/Object;Ljava/lang/Object;)Z
    move-result v23
    :try_end_03e0
    :try_end_03e0
    const-string/jumbo v2, "᩹᩶᩻"
    :goto_3f1
    invoke-static {v2}, Ll/ۤ֨;->۬ۚᩴ(Ljava/lang/Object;)I
    move-result v2
    xor-int v2, v2, v33
    goto/16 :goto_749
    move/from16 v35, v6
    move/from16 v37, v11
    :try_start_03fd
    sget-object v2, Lbin/mt/plus/ShortcutActivity;->۠ܶۧ:[S
    const/16 v6, 0xf4
    const/4 v11, 0x4
    invoke-static {v2, v6, v11, v5}, Ll/ۤ֨;->ۜۢۢ([SIII)Ljava/lang/String;
    move-result-object v2
    invoke-static {v3, v2}, Ll/ܽۘ;->۫᩺ᩳ(Ljava/lang/Object;Ljava/lang/Object;)Z
    move-result v22
    const-string v2, "᩵֨ܶ"
    goto :goto_445
    move/from16 v35, v6
    move/from16 v37, v11
    sget-object v2, Lbin/mt/plus/ShortcutActivity;->۠ܶۧ:[S
    const/16 v6, 0xe2
    const/16 v11, 0x12
    invoke-static {v2, v6, v11, v5}, Ll/ܳܺ;->۬ܽۤ([SIII)Ljava/lang/String;
    move-result-object v2
    invoke-static {v3, v2}, Ll/ۙ֫;->᩺۠ۖ(Ljava/lang/Object;Ljava/lang/Object;)Z
    move-result v21
    :try_end_03fd
    :try_end_03fd
    const-string v2, "ۡ᩻ܶ"
    const/4 v6, 0x1
    invoke-static {v2, v6}, Ll/ۡ۫;->۠ۢ᩶(Ljava/lang/Object;I)C
    move-result v6
    const/4 v11, 0x2
    invoke-static {v2, v11}, Ll/ܽ᩵;->ᩳ᩹֨(Ljava/lang/Object;I)C
    move-result v11
    mul-int v6, v6, v11
    xor-int v6, v6, v33
    goto/16 :goto_55a
    move/from16 v35, v6
    move/from16 v37, v11
    :try_start_0435
    .line 120
    sget-object v2, Lbin/mt/plus/ShortcutActivity;->۠ܶۧ:[S
    const/16 v6, 0xd4
    const/16 v11, 0xe
    invoke-static {v2, v6, v11, v5}, Ll/ᩴ;->ܶۘۘ([SIII)Ljava/lang/String;
    move-result-object v2
    .line 77
    invoke-static {v3, v2}, Ll/ۙ֫;->᩺۠ۖ(Ljava/lang/Object;Ljava/lang/Object;)Z
    move-result v20
    :try_end_0435
    :try_end_0435
    const-string v2, "᩷ۘ֫"
    :goto_445
    const/4 v6, 0x0
    invoke-static {v2, v6}, Ll/ۡ۫;->۠ۢ᩶(Ljava/lang/Object;I)C
    move-result v6
    mul-int/lit16 v6, v6, 0x3c1
    const/4 v11, 0x1
    invoke-static {v2, v11}, Ll/ۡ۫;->۠ۢ᩶(Ljava/lang/Object;I)C
    move-result v11
    mul-int/lit8 v11, v11, 0x1f
    add-int/2addr v6, v11
    xor-int v6, v6, v32
    const/4 v11, 0x2
    goto/16 :goto_55b
    move/from16 v35, v6
    move/from16 v37, v11
    :try_start_045d
    sget-object v2, Lbin/mt/plus/ShortcutActivity;->۠ܶۧ:[S
    const/16 v6, 0xc0
    const/16 v11, 0x14
    invoke-static {v2, v6, v11, v5}, Ll/ۗ۬;->ۛܰ᩸([SIII)Ljava/lang/String;
    move-result-object v2
    invoke-static {v3, v2}, Ll/ܽۘ;->۫᩺ᩳ(Ljava/lang/Object;Ljava/lang/Object;)Z
    move-result v19
    :try_end_045d
    :try_end_045d
    const-string v2, "ܶ۬ۢ"
    const/4 v6, 0x1
    invoke-static {v2, v6}, Ll/ۡ۫;->۠ۢ᩶(Ljava/lang/Object;I)C
    move-result v6
    const/4 v11, 0x2
    invoke-static {v2, v11}, Ll/ܽ᩵;->ᩳ᩹֨(Ljava/lang/Object;I)C
    move-result v11
    goto/16 :goto_51a
    move/from16 v35, v6
    move/from16 v37, v11
    :try_start_047d
    sget-object v2, Lbin/mt/plus/ShortcutActivity;->۠ܶۧ:[S
    const/16 v6, 0xae
    const/16 v11, 0x12
    invoke-static {v2, v6, v11, v5}, Ll/ۢۨ;->ۖܺ۫([SIII)Ljava/lang/String;
    move-result-object v2
    invoke-static {v3, v2}, Ll/ۙ֫;->᩺۠ۖ(Ljava/lang/Object;Ljava/lang/Object;)Z
    move-result v18
    const-string v2, "ۚ᩸ܶ"
    goto :goto_4cc
    move/from16 v35, v6
    move/from16 v37, v11
    sget-object v2, Lbin/mt/plus/ShortcutActivity;->۠ܶۧ:[S
    const/16 v6, 0xa1
    const/16 v11, 0xd
    invoke-static {v2, v6, v11, v5}, Ll/ᩴ᩵;->۫ۜܿ([SIII)Ljava/lang/String;
    move-result-object v2
    invoke-static {v3, v2}, Ll/ܽۘ;->۫᩺ᩳ(Ljava/lang/Object;Ljava/lang/Object;)Z
    move-result v17
    :try_end_047d
    :try_end_047d
    const-string v2, "ܿ۬ۢ"
    const/4 v6, 0x1
    invoke-static {v2, v6}, Ll/ܽ᩵;->ᩳ᩹֨(Ljava/lang/Object;I)C
    move-result v6
    xor-int v6, v6, v33
    :goto_4a9
    const/4 v11, 0x0
    invoke-static {v2, v11}, Ll/ܽ᩵;->ᩳ᩹֨(Ljava/lang/Object;I)C
    move-result v11
    mul-int v6, v6, v11
    const/4 v11, 0x2
    invoke-static {v2, v11}, Ll/ܽ᩵;->ᩳ᩹֨(Ljava/lang/Object;I)C
    move-result v2
    :goto_4b5
    sub-int v2, v6, v2
    goto/16 :goto_749
    move/from16 v35, v6
    move/from16 v37, v11
    :try_start_04bd
    .line 115
    sget-object v2, Lbin/mt/plus/ShortcutActivity;->۠ܶۧ:[S
    const/16 v6, 0x9b
    const/4 v11, 0x6
    invoke-static {v2, v6, v11, v5}, Ll/᩻᩷;->ۧۧ᩹([SIII)Ljava/lang/String;
    move-result-object v2
    .line 77
    invoke-static {v3, v2}, Ll/ܽۘ;->۫᩺ᩳ(Ljava/lang/Object;Ljava/lang/Object;)Z
    move-result v16
    :try_end_04bd
    :try_end_04bd
    const-string v2, "ۨۚۘ"
    :goto_4cc
    invoke-static {v2}, Ll/ۤ֨;->۬ۚᩴ(Ljava/lang/Object;)I
    move-result v2
    xor-int v2, v2, v32
    goto/16 :goto_749
    move/from16 v35, v6
    move/from16 v37, v11
    :try_start_04d8
    sget-object v2, Lbin/mt/plus/ShortcutActivity;->۠ܶۧ:[S
    const/16 v6, 0x8a
    const/16 v11, 0x11
    invoke-static {v2, v6, v11, v5}, Ll/ۤۛ;->ܳ᩺۫([SIII)Ljava/lang/String;
    move-result-object v2
    invoke-static {v3, v2}, Ll/ܽۘ;->۫᩺ᩳ(Ljava/lang/Object;Ljava/lang/Object;)Z
    move-result v15
    :try_end_04d8
    :try_end_04d8
    const-string v2, "ۢܳܶ"
    const/4 v6, 0x0
    invoke-static {v2, v6}, Ll/ܽ᩵;->ᩳ᩹֨(Ljava/lang/Object;I)C
    move-result v6
    mul-int/lit16 v6, v6, 0x3c1
    const/4 v11, 0x1
    invoke-static {v2, v11}, Ll/ۡ۫;->۠ۢ᩶(Ljava/lang/Object;I)C
    move-result v11
    mul-int/lit8 v11, v11, 0x1f
    add-int/2addr v6, v11
    xor-int v6, v6, v33
    const/4 v11, 0x2
    goto :goto_51f
    move/from16 v35, v6
    move/from16 v37, v11
    :try_start_04ff
    .line 139
    sget-object v2, Lbin/mt/plus/ShortcutActivity;->۠ܶۧ:[S
    const/16 v6, 0x7e
    const/16 v11, 0xc
    invoke-static {v2, v6, v11, v5}, Ll/ۙ᩻;->ۙ᩸᩶([SIII)Ljava/lang/String;
    move-result-object v2
    .line 77
    invoke-static {v3, v2}, Ll/ۙ֫;->᩺۠ۖ(Ljava/lang/Object;Ljava/lang/Object;)Z
    move-result v14
    :try_end_04ff
    :try_end_04ff
    const-string/jumbo v2, "᩹ۛۛ"
    const/4 v6, 0x1
    invoke-static {v2, v6}, Ll/ۡ۫;->۠ۢ᩶(Ljava/lang/Object;I)C
    move-result v6
    :goto_515
    const/4 v11, 0x2
    invoke-static {v2, v11}, Ll/ۡ۫;->۠ۢ᩶(Ljava/lang/Object;I)C
    move-result v11
    :goto_51a
    mul-int v6, v6, v11
    xor-int v6, v6, v33
    const/4 v11, 0x0
    :goto_51f
    invoke-static {v2, v11}, Ll/ۡ۫;->۠ۢ᩶(Ljava/lang/Object;I)C
    move-result v2
    goto :goto_55f
    move/from16 v35, v6
    move/from16 v37, v11
    :try_start_0528
    .line 83
    sget-object v2, Lbin/mt/plus/ShortcutActivity;->۠ܶۧ:[S
    const/16 v6, 0x77
    const/4 v11, 0x7
    invoke-static {v2, v6, v11, v5}, Ll/֫;->ܺ۠ᩳ([SIII)Ljava/lang/String;
    move-result-object v2
    .line 77
    invoke-static {v3, v2}, Ll/ܽۘ;->۫᩺ᩳ(Ljava/lang/Object;Ljava/lang/Object;)Z
    move-result v13
    const-string v2, "֨᩵ܳ"
    goto :goto_54c
    move/from16 v35, v6
    move/from16 v37, v11
    .line 110
    sget-object v2, Lbin/mt/plus/ShortcutActivity;->۠ܶۧ:[S
    const/16 v6, 0x6e
    const/16 v11, 0x9
    invoke-static {v2, v6, v11, v5}, Ll/ܽۜ;->᩸ۗۗ([SIII)Ljava/lang/String;
    move-result-object v2
    .line 77
    invoke-static {v3, v2}, Ll/ܽۘ;->۫᩺ᩳ(Ljava/lang/Object;Ljava/lang/Object;)Z
    move-result v12
    :try_end_0528
    :try_end_0528
    const-string v2, "ۜ᩹᩹"
    :goto_54c
    const/4 v6, 0x1
    invoke-static {v2, v6}, Ll/ܽ᩵;->ᩳ᩹֨(Ljava/lang/Object;I)C
    move-result v6
    const/4 v11, 0x2
    invoke-static {v2, v11}, Ll/ܽ᩵;->ᩳ᩹֨(Ljava/lang/Object;I)C
    move-result v11
    mul-int v6, v6, v11
    xor-int v6, v6, v32
    :goto_55a
    const/4 v11, 0x0
    :goto_55b
    invoke-static {v2, v11}, Ll/ܽ᩵;->ᩳ᩹֨(Ljava/lang/Object;I)C
    move-result v2
    :goto_55f
    add-int/2addr v2, v6
    goto/16 :goto_749
    move/from16 v35, v6
    move/from16 v37, v11
    :try_start_0566
    .line 94
    sget-object v2, Lbin/mt/plus/ShortcutActivity;->۠ܶۧ:[S
    const/16 v6, 0x5e
    const/16 v11, 0x10
    invoke-static {v2, v6, v11, v5}, Ll/ܽۘ;->᩵ܰۖ([SIII)Ljava/lang/String;
    move-result-object v2
    .line 77
    invoke-static {v3, v2}, Ll/ܽۘ;->۫᩺ᩳ(Ljava/lang/Object;Ljava/lang/Object;)Z
    move-result v11
    :try_end_0566
    :try_end_0566
    const-string v2, "ۘۗۡ"
    const/4 v6, 0x0
    invoke-static {v2, v6}, Ll/ܽ᩵;->ᩳ᩹֨(Ljava/lang/Object;I)C
    move-result v6
    mul-int/lit16 v6, v6, 0x3c1
    const/4 v0, 0x1
    invoke-static {v2, v0}, Ll/ۡ۫;->۠ۢ᩶(Ljava/lang/Object;I)C
    move-result v0
    mul-int/lit8 v0, v0, 0x1f
    add-int/2addr v6, v0
    xor-int v0, v6, v33
    const/4 v6, 0x2
    invoke-static {v2, v6}, Ll/ۡ۫;->۠ۢ᩶(Ljava/lang/Object;I)C
    move-result v2
    add-int/2addr v2, v0
    move-object/from16 v0, v39
    move/from16 v6, v35
    goto/16 :goto_78
    return-void
    move/from16 v35, v6
    move/from16 v37, v11
    const/high16 v6, 0x400
    const-class v0, Ll/᩶֨۟;
    const/4 v2, 0x1
    const/high16 v11, 0x1000
    sparse-switch v35, :cond_922
    goto/16 :goto_7a0
    const-string v2, "۫᩷ܰ"
    const/4 v7, 0x0
    invoke-static {v2, v7}, Ll/ۡ۫;->۠ۢ᩶(Ljava/lang/Object;I)C
    move-result v7
    mul-int/lit16 v7, v7, 0x3c1
    const/4 v8, 0x1
    invoke-static {v2, v8}, Ll/ܽ᩵;->ᩳ᩹֨(Ljava/lang/Object;I)C
    move-result v8
    mul-int/lit8 v8, v8, 0x1f
    add-int/2addr v7, v8
    xor-int v7, v7, v33
    const/4 v8, 0x2
    invoke-static {v2, v8}, Ll/ܽ᩵;->ᩳ᩹֨(Ljava/lang/Object;I)C
    move-result v2
    add-int/2addr v2, v7
    const/high16 v7, 0x400
    const/high16 v10, 0x1000
    move-object v8, v0
    move/from16 v6, v35
    move/from16 v11, v37
    goto/16 :goto_6cc
    const-string v0, "ۢۨۧ"
    invoke-static {v0}, Ll/ۤ֨;->۬ۚᩴ(Ljava/lang/Object;)I
    move-result v0
    xor-int v2, v0, v32
    goto/16 :goto_6e7
    const-string v0, "۟᩵ܰ"
    const/4 v6, 0x0
    invoke-static {v0, v6}, Ll/ܽ᩵;->ᩳ᩹֨(Ljava/lang/Object;I)C
    move-result v6
    mul-int/lit16 v6, v6, 0x3c1
    const/4 v9, 0x1
    invoke-static {v0, v9}, Ll/ܽ᩵;->ᩳ᩹֨(Ljava/lang/Object;I)C
    move-result v9
    mul-int/lit8 v9, v9, 0x1f
    add-int/2addr v6, v9
    xor-int v6, v6, v32
    const/4 v9, 0x2
    invoke-static {v0, v9}, Ll/ۡ۫;->۠ۢ᩶(Ljava/lang/Object;I)C
    move-result v0
    goto/16 :goto_6a3
    const-string v0, "֨֡᩵"
    goto/16 :goto_6f3
    const-string v0, "ܰ᩸᩷"
    invoke-static {v0}, Ll/ۤ֨;->۬ۚᩴ(Ljava/lang/Object;)I
    move-result v0
    xor-int v2, v0, v33
    goto/16 :goto_6e7
    const-string v0, "۠ܿ۫"
    goto :goto_659
    const-string v0, "۠ᩴ֡"
    invoke-static {v0}, Ll/ۤ֨;->۬ۚᩴ(Ljava/lang/Object;)I
    move-result v0
    goto :goto_65d
    const-string v0, "᩵֫ܺ"
    const/4 v6, 0x1
    invoke-static {v0, v6}, Ll/ۡ۫;->۠ۢ᩶(Ljava/lang/Object;I)C
    move-result v6
    xor-int v6, v6, v33
    goto :goto_62f
    const-string v0, "ۨ۬ۖ"
    const/4 v2, 0x1
    invoke-static {v0, v2}, Ll/ۡ۫;->۠ۢ᩶(Ljava/lang/Object;I)C
    move-result v2
    const/4 v6, 0x2
    invoke-static {v0, v6}, Ll/ۡ۫;->۠ۢ᩶(Ljava/lang/Object;I)C
    move-result v6
    mul-int v2, v2, v6
    xor-int v2, v2, v33
    const/4 v6, 0x0
    invoke-static {v0, v6}, Ll/ܽ᩵;->ᩳ᩹֨(Ljava/lang/Object;I)C
    move-result v0
    add-int/2addr v2, v0
    goto/16 :goto_6e7
    const-string v0, "ۛᩳܺ"
    const/4 v6, 0x1
    invoke-static {v0, v6}, Ll/ۡ۫;->۠ۢ᩶(Ljava/lang/Object;I)C
    move-result v6
    xor-int v6, v6, v32
    :goto_62f
    const/4 v9, 0x0
    invoke-static {v0, v9}, Ll/ܽ᩵;->ᩳ᩹֨(Ljava/lang/Object;I)C
    move-result v9
    mul-int v6, v6, v9
    const/4 v9, 0x2
    invoke-static {v0, v9}, Ll/ܽ᩵;->ᩳ᩹֨(Ljava/lang/Object;I)C
    move-result v0
    sub-int v0, v6, v0
    goto :goto_6a4
    const-string/jumbo v0, "᩹۟᩹"
    const/4 v2, 0x1
    invoke-static {v0, v2}, Ll/ܽ᩵;->ᩳ᩹֨(Ljava/lang/Object;I)C
    move-result v2
    const/4 v6, 0x2
    invoke-static {v0, v6}, Ll/ۡ۫;->۠ۢ᩶(Ljava/lang/Object;I)C
    move-result v6
    mul-int v2, v2, v6
    xor-int v2, v2, v33
    const/4 v6, 0x0
    invoke-static {v0, v6}, Ll/ۡ۫;->۠ۢ᩶(Ljava/lang/Object;I)C
    move-result v0
    add-int/2addr v2, v0
    goto/16 :goto_747
    const-string v0, "ܿ᩵ۨ"
    :goto_659
    invoke-static {v0}, Ll/ۙۘ;->ۙᩴ۫(Ljava/lang/Object;)I
    move-result v0
    :goto_65d
    xor-int v2, v0, v32
    goto/16 :goto_747
    const-string/jumbo v0, "᩻ۖۖ"
    const/4 v2, 0x1
    invoke-static {v0, v2}, Ll/ۡ۫;->۠ۢ᩶(Ljava/lang/Object;I)C
    move-result v2
    xor-int v2, v2, v32
    const/4 v6, 0x0
    invoke-static {v0, v6}, Ll/ۡ۫;->۠ۢ᩶(Ljava/lang/Object;I)C
    move-result v6
    goto/16 :goto_6df
    const-string/jumbo v0, "᩻ۜܳ"
    invoke-static {v0}, Ll/ۙۘ;->ۙᩴ۫(Ljava/lang/Object;)I
    move-result v0
    goto :goto_68b
    const-string v0, "ܽ۬ܰ"
    const/4 v2, 0x1
    invoke-static {v0, v2}, Ll/ܽ᩵;->ᩳ᩹֨(Ljava/lang/Object;I)C
    move-result v2
    xor-int v2, v2, v32
    goto/16 :goto_6fa
    const-string v0, "᩸ܿۗ"
    invoke-static {v0}, Ll/ۤ֨;->۬ۚᩴ(Ljava/lang/Object;)I
    move-result v0
    :goto_68b
    xor-int v0, v0, v33
    goto :goto_6a4
    const-string v0, "ۧۜܿ"
    const/4 v6, 0x1
    invoke-static {v0, v6}, Ll/ܽ᩵;->ᩳ᩹֨(Ljava/lang/Object;I)C
    move-result v6
    const/4 v9, 0x2
    invoke-static {v0, v9}, Ll/ܽ᩵;->ᩳ᩹֨(Ljava/lang/Object;I)C
    move-result v9
    mul-int v6, v6, v9
    xor-int v6, v6, v32
    const/4 v9, 0x0
    invoke-static {v0, v9}, Ll/ܽ᩵;->ᩳ᩹֨(Ljava/lang/Object;I)C
    move-result v0
    :goto_6a3
    add-int/2addr v0, v6
    :goto_6a4
    move v2, v0
    move/from16 v6, v35
    move/from16 v11, v37
    const/4 v9, 0x1
    goto :goto_6cc
    const-string v7, "ۛܳۚ"
    const/4 v8, 0x1
    invoke-static {v7, v8}, Ll/ܽ᩵;->ᩳ᩹֨(Ljava/lang/Object;I)C
    move-result v8
    const/4 v9, 0x2
    invoke-static {v7, v9}, Ll/ۡ۫;->۠ۢ᩶(Ljava/lang/Object;I)C
    move-result v9
    mul-int v8, v8, v9
    xor-int v8, v8, v33
    const/4 v9, 0x0
    invoke-static {v7, v9}, Ll/ܽ᩵;->ᩳ᩹֨(Ljava/lang/Object;I)C
    move-result v7
    add-int/2addr v7, v8
    move-object v8, v0
    move v2, v7
    move/from16 v6, v35
    move/from16 v11, v37
    const/high16 v7, 0x400
    const/4 v9, 0x1
    const/high16 v10, 0x1000
    :goto_6cc
    move-object/from16 v0, v39
    goto/16 :goto_78
    const-string/jumbo v0, "᩻ۘܺ"
    const/4 v2, 0x1
    invoke-static {v0, v2}, Ll/ܽ᩵;->ᩳ᩹֨(Ljava/lang/Object;I)C
    move-result v2
    xor-int v2, v2, v32
    const/4 v6, 0x0
    invoke-static {v0, v6}, Ll/ܽ᩵;->ᩳ᩹֨(Ljava/lang/Object;I)C
    move-result v6
    :goto_6df
    mul-int v2, v2, v6
    const/4 v6, 0x2
    invoke-static {v0, v6}, Ll/ܽ᩵;->ᩳ᩹֨(Ljava/lang/Object;I)C
    move-result v0
    sub-int/2addr v2, v0
    :goto_6e7
    const/high16 v10, 0x1000
    goto :goto_747
    move/from16 v35, v6
    move/from16 v37, v11
    :try_start_06ee
    .line 74
    invoke-static/range {v39 .. v39}, Ll/ۤۙ;->۫ۤܽ(Ljava/lang/Object;)V
    :try_end_06ee
    :try_end_06ee
    const-string v0, "ۧۛ᩹"
    :goto_6f3
    const/4 v2, 0x1
    invoke-static {v0, v2}, Ll/ܽ᩵;->ᩳ᩹֨(Ljava/lang/Object;I)C
    move-result v2
    xor-int v2, v2, v33
    :goto_6fa
    const/4 v6, 0x0
    invoke-static {v0, v6}, Ll/ܽ᩵;->ᩳ᩹֨(Ljava/lang/Object;I)C
    move-result v6
    goto :goto_73f
    move/from16 v35, v6
    move/from16 v37, v11
    :try_start_0704
    .line 77
    invoke-static {v3}, Ll/ۤ֨;->۬ۚᩴ(Ljava/lang/Object;)I
    move-result v6
    :try_end_0704
    :try_end_0704
    const-string v0, "ۡ۫ۖ"
    const/4 v2, 0x1
    invoke-static {v0, v2}, Ll/ܽ᩵;->ᩳ᩹֨(Ljava/lang/Object;I)C
    move-result v2
    const/4 v11, 0x2
    invoke-static {v0, v11}, Ll/ۡ۫;->۠ۢ᩶(Ljava/lang/Object;I)C
    move-result v11
    mul-int v2, v2, v11
    xor-int v2, v2, v32
    const/4 v11, 0x0
    invoke-static {v0, v11}, Ll/ܽ᩵;->ᩳ᩹֨(Ljava/lang/Object;I)C
    move-result v0
    add-int/2addr v2, v0
    move-object/from16 v0, v39
    goto/16 :goto_824
    move/from16 v35, v6
    move/from16 v37, v11
    if-eqz v34, :cond_731
    const-string v0, "᩶᩺֫"
    invoke-static {v0}, Ll/ۤ֨;->۬ۚᩴ(Ljava/lang/Object;)I
    move-result v0
    xor-int v2, v0, v33
    goto :goto_747
    :cond_731
    const-string v0, "ᩴܽۨ"
    const/4 v2, 0x1
    invoke-static {v0, v2}, Ll/ܽ᩵;->ᩳ᩹֨(Ljava/lang/Object;I)C
    move-result v2
    xor-int v2, v2, v33
    const/4 v6, 0x0
    invoke-static {v0, v6}, Ll/ۡ۫;->۠ۢ᩶(Ljava/lang/Object;I)C
    move-result v6
    :goto_73f
    mul-int v2, v2, v6
    const/4 v6, 0x2
    invoke-static {v0, v6}, Ll/ܽ᩵;->ᩳ᩹֨(Ljava/lang/Object;I)C
    move-result v0
    sub-int/2addr v2, v0
    :goto_747
    move-object/from16 v0, v39
    :goto_749
    move/from16 v6, v35
    goto/16 :goto_824
    .line 145
    invoke-static/range {v39 .. v39}, Ll/ۤۙ;->۫ۤܽ(Ljava/lang/Object;)V
    return-void
    move/from16 v35, v6
    move/from16 v37, v11
    :try_start_0755
    .line 70
    invoke-static/range {v39 .. v39}, Ll/ۘ۟;->ۚۤۧ(Ljava/lang/Object;)Landroid/content/Intent;
    move-result-object v0
    sget-object v2, Lbin/mt/plus/ShortcutActivity;->۠ܶۧ:[S
    const/16 v6, 0x51
    const/16 v11, 0x9
    invoke-static {v2, v6, v11, v5}, Ll/᩹;->ܿۧۗ([SIII)Ljava/lang/String;
    move-result-object v2
    .line 71
    invoke-static {v0, v2}, Ll/ܽۘ;->֫֫ۨ(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/String;
    move-result-object v2
    sget-object v6, Lbin/mt/plus/ShortcutActivity;->۠ܶۧ:[S
    :try_end_0755
    :try_end_0755
    const/16 v11, 0x5a
    move-object/from16 v36, v1
    const/4 v1, 0x4
    :try_start_076e
    invoke-static {v6, v11, v1, v5}, Ll/ܰۡ;->ܳۧۤ([SIII)Ljava/lang/String;
    move-result-object v1
    .line 72
    invoke-static {v0, v1}, Ll/ܽۘ;->֫֫ۨ(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/String;
    move-result-object v1
    .line 73
    invoke-static {v2}, Ll/ۤۚ;->۟ܶۙ(Ljava/lang/Object;)Z
    move-result v34
    :try_end_076e
    :try_end_076e
    const-string v3, "᩶ۢۧ"
    const/4 v4, 0x1
    invoke-static {v3, v4}, Ll/ۡ۫;->۠ۢ᩶(Ljava/lang/Object;I)C
    move-result v4
    xor-int v4, v4, v32
    const/4 v6, 0x0
    invoke-static {v3, v6}, Ll/ܽ᩵;->ᩳ᩹֨(Ljava/lang/Object;I)C
    move-result v6
    mul-int v4, v4, v6
    const/4 v6, 0x2
    invoke-static {v3, v6}, Ll/ܽ᩵;->ᩳ᩹֨(Ljava/lang/Object;I)C
    move-result v3
    sub-int v3, v4, v3
    move-object v4, v1
    move/from16 v6, v35
    move/from16 v11, v37
    move-object v1, v0
    move-object/from16 v0, v39
    move/from16 v38, v3
    move-object v3, v2
    move/from16 v2, v38
    goto/16 :goto_78
    :goto_7a0
    move-object/from16 v36, v1
    :goto_7a2
    const-string v0, "۫᩵ܳ"
    invoke-static {v0}, Ll/ۙۘ;->ۙᩴ۫(Ljava/lang/Object;)I
    move-result v0
    xor-int v2, v0, v32
    goto/16 :goto_81e
    move-object/from16 v36, v1
    move/from16 v35, v6
    move/from16 v37, v11
    .line 68
    invoke-super/range {v39 .. v40}, Ll/᩻᩻ۖ;->onCreate(Landroid/os/Bundle;)V
    const-string v0, "ᩴܶۚ"
    goto :goto_800
    move-object/from16 v36, v1
    move/from16 v35, v6
    move/from16 v37, v11
    const v0, 0x82cb
    const v5, 0x82cb
    goto :goto_7d1
    move-object/from16 v36, v1
    move/from16 v35, v6
    move/from16 v37, v11
    const v0, 0xd772
    const v5, 0xd772
    :goto_7d1
    const-string v0, "ۨۧۚ"
    const/4 v1, 0x1
    invoke-static {v0, v1}, Ll/ۡ۫;->۠ۢ᩶(Ljava/lang/Object;I)C
    move-result v1
    const/4 v2, 0x2
    invoke-static {v0, v2}, Ll/ۡ۫;->۠ۢ᩶(Ljava/lang/Object;I)C
    move-result v2
    mul-int v1, v1, v2
    xor-int v1, v1, v32
    const/4 v2, 0x0
    invoke-static {v0, v2}, Ll/ܽ᩵;->ᩳ᩹֨(Ljava/lang/Object;I)C
    move-result v0
    goto :goto_81c
    move-object/from16 v36, v1
    move/from16 v35, v6
    move/from16 v37, v11
    sget-object v0, Lbin/mt/plus/ShortcutActivity;->۠ܶۧ:[S
    const/16 v1, 0x50
    aget-short v0, v0, v1
    mul-int/lit8 v1, v0, 0x2
    add-int/lit8 v1, v1, 0x1
    add-int/lit8 v0, v0, 0x1
    mul-int v0, v0, v0
    sub-int/2addr v1, v0
    if-lez v1, :cond_807
    const-string v0, "ܶ᩺ܳ"
    :goto_800
    invoke-static {v0}, Ll/ۙۘ;->ۙᩴ۫(Ljava/lang/Object;)I
    move-result v0
    xor-int v2, v0, v33
    goto :goto_81e
    :cond_807
    const-string v0, "۟᩵ᩴ"
    const/4 v1, 0x1
    invoke-static {v0, v1}, Ll/ۡ۫;->۠ۢ᩶(Ljava/lang/Object;I)C
    move-result v1
    const/4 v2, 0x2
    invoke-static {v0, v2}, Ll/ܽ᩵;->ᩳ᩹֨(Ljava/lang/Object;I)C
    move-result v2
    mul-int v1, v1, v2
    xor-int v1, v1, v32
    const/4 v2, 0x0
    invoke-static {v0, v2}, Ll/ۡ۫;->۠ۢ᩶(Ljava/lang/Object;I)C
    move-result v0
    :goto_81c
    add-int v2, v1, v0
    :goto_81e
    move-object/from16 v0, v39
    move/from16 v6, v35
    move-object/from16 v1, v36
    :goto_824
    move/from16 v11, v37
    goto/16 :goto_78
    :cond_828
    .sparse-switch
        1445053 -> :sswitch_164
        1458474 -> :sswitch_14c
        1745504 -> :sswitch_291
        1749319 -> :sswitch_218
        1751549 -> :sswitch_347
        1752304 -> :goto_2d6
        1755063 -> :sswitch_20f
        1760195 -> :sswitch_19d
        1767995 -> :sswitch_2d
        1898507 -> :sswitch_2ed
        1899401 -> :sswitch_205
        1902364 -> :sswitch_364
        1915450 -> :goto_2bc
        1915928 -> :sswitch_6d5
        1987121 -> :sswitch_740
        1988017 -> :sswitch_31e
        1990915 -> :sswitch_401
        2537307 -> :sswitch_179
        2783998 -> :sswitch_75
        3078976 -> :sswitch_23c
        3088927 -> :sswitch_13d
        3099663 -> :sswitch_734
        3099844 -> :sswitch_51c
        3102142 -> :sswitch_395
        3130108 -> :sswitch_1fb
        3232715 -> :sswitch_4c0
        3257136 -> :sswitch_89
        3261084 -> :sswitch_4ac
        3261819 -> :sswitch_11c
        4259107 -> :sswitch_e6
        4283534 -> :sswitch_1b1
        4499097 -> :sswitch_45c
        6559314 -> :sswitch_1d1
        6564089 -> :sswitch_1f2
        6564934 -> :sswitch_6d9
        6577164 -> :sswitch_441
        6577262 -> :sswitch_483
        6578008 -> :sswitch_18c
        6721785 -> :sswitch_672
        6730080 -> :sswitch_1c7
        9722339 -> :sswitch_303
        9829660 -> :sswitch_3b9
        10260383 -> :sswitch_110
        10397380 -> :sswitch_1bd
        11346322 -> :sswitch_76f
        11423946 -> :sswitch_51b
        11872420 -> :sswitch_d1
        11926470 -> :sswitch_fb
        11933042 -> :sswitch_3e1
        12483974 -> :sswitch_256
        12514381 -> :sswitch_1db
        16098375 -> :sswitch_416
        16111833 -> :sswitch_4ea
        16384539 -> :sswitch_6aa
        37969180 -> :sswitch_1e
        42709236 -> :sswitch_688
        44204853 -> :sswitch_a6
        45438207 -> :sswitch_381
        45864820 -> :sswitch_74d
        45865746 -> :sswitch_1a7
        45904824 -> :sswitch_bc
        45926780 -> :sswitch_270
    .end sparse-switch
    :cond_922
    .sparse-switch
        -2122614245 -> :sswitch_131
        -1912197360 -> :sswitch_10c
        -1263242200 -> :sswitch_ef
        -1212308659 -> :sswitch_e6
        -1119104947 -> :sswitch_db
        -1097461934 -> :sswitch_d3
        -785778927 -> :sswitch_c2
        -667500459 -> :sswitch_b8
        -593404262 -> :sswitch_9f
        -560080238 -> :sswitch_87
        -474293814 -> :sswitch_6f
        3178851 -> :sswitch_65
        24954378 -> :sswitch_5e
        35253639 -> :sswitch_5b
        588746739 -> :sswitch_51
        1041335639 -> :sswitch_4d
        1721154072 -> :sswitch_33
        1841977966 -> :sswitch_29
        2116182360 -> :sswitch_5
    .end sparse-switch
.end method

