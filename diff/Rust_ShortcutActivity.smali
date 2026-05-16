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
    fill-array-data v0, :addr_02e6
    sput-object v0, Lbin/mt/plus/ShortcutActivity;->۠ܶۧ:[S
    const/4 v0, 0x0
    const/4 v1, 0x1
    const/4 v2, 0x2
    const/4 v3, 0x3
    const/4 v4, 0x4
    const/4 v5, 0x5
    const/4 v6, 0x6
    const/4 v7, 0x7
    const/4 v8, -0x8
    const/4 v9, -0x7
    const/4 v10, -0x6
    const/4 v11, -0x5
    const/4 v12, -0x4
    const/4 v13, -0x3
    sget v14, Ll/ܳܺ;->۫ܿ᩵:I
    sget v15, Ll/ܽۛ;->۠ܺ۟:I
    const-string v16, "ۛۖۙ"
    invoke-static/range {v16 .. v16}, Ll/ۙۘ;->ۙᩴ۫(Ljava/lang/Object;)I
    move-result v16
    xor-int v16, v16, v14
    :addr_0023
    sparse-switch v16, :addr_029c
    move-object/from16 v16, v0
    move-object/from16 v17, v1
    move/from16 v18, v2
    const v0, 0x9b80
    const v10, 0x9b80
    goto/16 :addr_0293
    .line 265
    invoke-static {}, Ll/ᩴ᩵;->ۡۨܶ()Z
    sget v16, Ll/ܽ᩵;->᩻ۗ֨:I
    if-gez v16, :addr_006c
    move-object/from16 v16, v0
    move-object/from16 v17, v1
    move/from16 v18, v2
    goto/16 :addr_0214
    .line 268
    sget-object v16, Lbin/mt/plus/ShortcutActivity;->۠ܶۧ:[S
    invoke-static {}, Ll/᩹;->ۖ᩷֫()I
    move-result v17
    if-eqz v17, :addr_0053
    move-object/from16 v16, v0
    move-object/from16 v17, v1
    move/from16 v18, v2
    goto/16 :addr_01ec
    :addr_0053
    const-string v1, "۠᩶ۧ"
    invoke-static {v1}, Ll/ۤ֨;->۬ۚᩴ(Ljava/lang/Object;)I
    move-result v1
    xor-int/2addr v1, v15
    const/4 v2, 0x2
    move-object/from16 v20, v16
    move-object/from16 v16, v0
    move v0, v1
    move-object/from16 v1, v20
    goto/16 :addr_028b
    .line 267
    aget-short v16, v1, v2
    .line 268
    invoke-static {}, Ll/ᩴ;->ۙ֨ᩴ()I
    move-result v17
    if-eqz v17, :addr_0071
    :addr_006c
    move-object/from16 v17, v1
    move/from16 v18, v2
    goto :addr_00a6
    :addr_0071
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
    const/4 v2, 0x2
    invoke-static {v3, v2}, Ll/ۡ۫;->۠ۢ᩶(Ljava/lang/Object;I)C
    move-result v2
    add-int/2addr v2, v1
    move/from16 v3, v16
    move-object/from16 v1, v17
    move-object/from16 v16, v0
    move v0, v2
    goto/16 :addr_0289
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
    if-ltz v1, :addr_00be
    :addr_00a6
    const-string v1, "ۡ۫ܰ"
    const/4 v2, 0x2
    invoke-static {v1, v2}, Ll/ܽ᩵;->ᩳ᩹֨(Ljava/lang/Object;I)C
    move-result v2
    xor-int/2addr v2, v14
    move-object/from16 v16, v0
    const/4 v0, 0x0
    invoke-static {v1, v0}, Ll/ۡ۫;->۠ۢ᩶(Ljava/lang/Object;I)C
    move-result v0
    mul-int v2, v2, v0
    const/4 v0, 0x0
    invoke-static {v1, v0}, Ll/ܽ᩵;->ᩳ᩹֨(Ljava/lang/Object;I)C
    move-result v0
    goto/16 :addr_0229
    :addr_00be
    move-object/from16 v16, v0
    const-string v0, "ۚۗۢ"
    invoke-static {v0}, Ll/ۙۘ;->ۙᩴ۫(Ljava/lang/Object;)I
    move-result v0
    xor-int/2addr v0, v15
    goto/16 :addr_01a8
    move-object/from16 v16, v0
    move-object/from16 v17, v1
    move/from16 v18, v2
    .line 265
    sget-object v0, Ll/۫᩺۟;->۟:Ll/۠᩺۟;
    sget-object v1, Lbin/mt/plus/ShortcutActivity;->۠ܶۧ:[S
    .line 268
    invoke-static {}, Ll/֨ۖ;->ۤᩴۤ()Z
    move-result v2
    if-eqz v2, :addr_00db
    goto/16 :addr_0201
    :addr_00db
    const-string/jumbo v2, "᩸᩷ᩳ"
    const/4 v11, -0x5
    invoke-static {v2, v11}, Ll/ܽ᩵;->ᩳ᩹֨(Ljava/lang/Object;I)C
    move-result v11
    xor-int/2addr v11, v15
    move-object/from16 v19, v0
    const/4 v0, 0x0
    invoke-static {v2, v0}, Ll/ܽ᩵;->ᩳ᩹֨(Ljava/lang/Object;I)C
    move-result v0
    mul-int v11, v11, v0
    const/4 v0, 0x0
    invoke-static {v2, v0}, Ll/ۡ۫;->۠ۢ᩶(Ljava/lang/Object;I)C
    move-result v0
    sub-int v16, v11, v0
    move-object v11, v1
    move-object/from16 v1, v17
    move/from16 v2, v18
    move-object/from16 v0, v19
    goto/16 :addr_0023
    move-object/from16 v16, v0
    move-object/from16 v17, v1
    move/from16 v18, v2
    mul-int v0, v3, v4
    .line 266
    invoke-static {}, Ll/᩻᩷;->ܺ᩻᩺()I
    move-result v1
    if-ltz v1, :addr_010d
    goto/16 :addr_025a
    :addr_010d
    const-string v1, "᩷۠᩵"
    const/4 v2, 0x2
    invoke-static {v1, v2}, Ll/ۡ۫;->۠ۢ᩶(Ljava/lang/Object;I)C
    move-result v2
    xor-int/2addr v2, v15
    const/4 v5, 0x5
    invoke-static {v1, v5}, Ll/ۡ۫;->۠ۢ᩶(Ljava/lang/Object;I)C
    move-result v5
    mul-int v2, v2, v5
    const/4 v5, 0x5
    invoke-static {v1, v5}, Ll/ۡ۫;->۠ۢ᩶(Ljava/lang/Object;I)C
    move-result v1
    sub-int/2addr v2, v1
    const/4 v1, 0x1
    move v5, v0
    move v0, v2
    move-object/from16 v1, v17
    move/from16 v2, v18
    const/4 v6, 0x6
    goto/16 :addr_028b
    move-object/from16 v16, v0
    move-object/from16 v17, v1
    move/from16 v18, v2
    sget v0, Ll/ܽۛ;->۠ܺ۟:I
    if-ltz v0, :addr_0138
    goto/16 :addr_01ec
    :addr_0138
    const-string v0, "ۨۖ֡"
    invoke-static {v0}, Ll/ۤ֨;->۬ۚᩴ(Ljava/lang/Object;)I
    move-result v0
    xor-int/2addr v0, v15
    const/16 v13, 0x9
    goto/16 :addr_0287
    move-object/from16 v16, v0
    move-object/from16 v17, v1
    move/from16 v18, v2
    add-int v0, v5, v6
    sget-boolean v1, Ll/ۛܶ;->ۙ᩵᩶:Z
    if-nez v1, :addr_0151
    goto/16 :addr_0214
    :addr_0151
    const-string/jumbo v1, "᩻᩶᩶"
    const/4 v2, 0x2
    invoke-static {v1, v2}, Ll/ۡ۫;->۠ۢ᩶(Ljava/lang/Object;I)C
    move-result v2
    mul-int/lit16 v2, v2, 0x3c1
    const/4 v7, 0x7
    invoke-static {v1, v7}, Ll/ܽ᩵;->ᩳ᩹֨(Ljava/lang/Object;I)C
    move-result v7
    mul-int/lit8 v7, v7, 0x1f
    add-int/2addr v2, v7
    xor-int/2addr v2, v15
    const/4 v7, 0x7
    invoke-static {v1, v7}, Ll/ۡ۫;->۠ۢ᩶(Ljava/lang/Object;I)C
    move-result v1
    add-int/2addr v1, v2
    const/4 v2, 0x2
    move v7, v0
    move v0, v1
    move-object/from16 v1, v17
    move/from16 v2, v18
    const/4 v8, -0x8
    goto/16 :addr_028b
    move-object/from16 v16, v0
    move-object/from16 v17, v1
    move/from16 v18, v2
    const v0, 0xf14c
    const v10, 0xf14c
    goto/16 :addr_0293
    move-object/from16 v16, v0
    move-object/from16 v17, v1
    move/from16 v18, v2
    add-int v0, v3, v8
    .line 268
    invoke-static {}, Ll/֨֡;->ۘ۠ۘ()I
    move-result v1
    if-ltz v1, :addr_0191
    goto :addr_01ec
    :addr_0191
    const-string v1, "ۨ۫ܺ"
    const/4 v2, 0x2
    invoke-static {v1, v2}, Ll/ۡ۫;->۠ۢ᩶(Ljava/lang/Object;I)C
    move-result v2
    xor-int/2addr v2, v14
    const/4 v9, -0x7
    invoke-static {v1, v9}, Ll/ۡ۫;->۠ۢ᩶(Ljava/lang/Object;I)C
    move-result v9
    mul-int v2, v2, v9
    const/4 v9, -0x7
    invoke-static {v1, v9}, Ll/ۡ۫;->۠ۢ᩶(Ljava/lang/Object;I)C
    move-result v1
    sub-int/2addr v2, v1
    move v9, v0
    move v0, v2
    :addr_01a8
    move-object/from16 v1, v17
    goto/16 :addr_0289
    move-object/from16 v16, v0
    move-object/from16 v17, v1
    move/from16 v18, v2
    .line 265
    invoke-static {}, Ll/ܽۘ;->᩻ۙܰ()Z
    goto :addr_0214
    move-object/from16 v16, v0
    move-object/from16 v17, v1
    move/from16 v18, v2
    sget v0, Ll/ۤۛ;->᩺᩻ۘ:I
    if-gez v0, :addr_01ec
    goto :addr_0214
    move-object/from16 v16, v0
    move-object/from16 v17, v1
    move/from16 v18, v2
    mul-int v0, v9, v9
    sub-int/2addr v0, v7
    if-gez v0, :addr_01dd
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
    goto/16 :addr_0269
    :addr_01dd
    const-string/jumbo v0, "᩺ۢܶ"
    goto/16 :addr_0295
    move-object/from16 v16, v0
    move-object/from16 v17, v1
    move/from16 v18, v2
    .line 265
    sget v0, Ll/ۚۙ;->ܽ۟֡:I
    if-lez v0, :addr_0201
    :addr_01ec
    const-string/jumbo v0, "᩻᩵ܽ"
    const/4 v1, 0x1
    .line 268
    invoke-static {v0, v1}, Ll/ܽ᩵;->ᩳ᩹֨(Ljava/lang/Object;I)C
    move-result v1
    mul-int/lit16 v1, v1, 0x3c1
    const/4 v2, 0x2
    invoke-static {v0, v2}, Ll/ۡ۫;->۠ۢ᩶(Ljava/lang/Object;I)C
    move-result v2
    mul-int/lit8 v2, v2, 0x1f
    add-int/2addr v1, v2
    xor-int/2addr v1, v15
    const/4 v2, 0x2
    goto :addr_026a
    :addr_0201
    const-string v0, "֨ۖ֡"
    const/4 v1, 0x1
    invoke-static {v0, v1}, Ll/ܽ᩵;->ᩳ᩹֨(Ljava/lang/Object;I)C
    move-result v1
    xor-int/2addr v1, v15
    goto :addr_021d
    move-object/from16 v16, v0
    move-object/from16 v17, v1
    move/from16 v18, v2
    .line 267
    sget v0, Ll/ۙۘ;->ۖۢۙ:I
    if-eqz v0, :addr_022d
    :addr_0214
    const-string/jumbo v0, "᩻ۖ֨"
    const/4 v1, 0x1
    invoke-static {v0, v1}, Ll/ۡ۫;->۠ۢ᩶(Ljava/lang/Object;I)C
    move-result v1
    xor-int/2addr v1, v14
    :addr_021d
    const/4 v2, 0x2
    invoke-static {v0, v2}, Ll/ܽ᩵;->ᩳ᩹֨(Ljava/lang/Object;I)C
    move-result v2
    mul-int v2, v2, v1
    const/4 v1, 0x1
    invoke-static {v0, v1}, Ll/ۡ۫;->۠ۢ᩶(Ljava/lang/Object;I)C
    move-result v0
    :addr_0229
    sub-int v0, v2, v0
    goto/16 :addr_01a8
    :addr_022d
    const-string v0, "۟ۗۖ"
    const/4 v1, 0x1
    invoke-static {v0, v1}, Ll/ۡ۫;->۠ۢ᩶(Ljava/lang/Object;I)C
    move-result v1
    const/4 v2, 0x2
    invoke-static {v0, v2}, Ll/ܽ᩵;->ᩳ᩹֨(Ljava/lang/Object;I)C
    move-result v2
    mul-int v1, v1, v2
    xor-int/2addr v1, v14
    const/4 v2, 0x2
    invoke-static {v0, v2}, Ll/ۡ۫;->۠ۢ᩶(Ljava/lang/Object;I)C
    move-result v0
    add-int/2addr v0, v1
    const/4 v4, 0x4
    goto :addr_0287
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
    if-ltz v0, :addr_0271
    :addr_025a
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
    :addr_0269
    const/4 v2, 0x2
    :addr_026a
    .line 268
    invoke-static {v0, v2}, Ll/ܽ᩵;->ᩳ᩹֨(Ljava/lang/Object;I)C
    move-result v0
    add-int/2addr v0, v1
    goto/16 :addr_01a8
    :addr_0271
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
    const/4 v2, 0x2
    invoke-static {v0, v2}, Ll/ܽ᩵;->ᩳ᩹֨(Ljava/lang/Object;I)C
    move-result v0
    add-int/2addr v0, v1
    const/4 v12, -0x4
    :addr_0287
    move-object/from16 v1, v17
    :addr_0289
    move/from16 v2, v18
    :addr_028b
    move-object/from16 v20, v16
    move/from16 v16, v0
    move-object/from16 v0, v20
    goto/16 :addr_0023
    :addr_0293
    const-string v0, "۠᩸֨"
    :addr_0295
    .line 268
    invoke-static {v0}, Ll/ۙۘ;->ۙᩴ۫(Ljava/lang/Object;)I
    move-result v0
    xor-int/2addr v0, v14
    goto/16 :addr_01a8
    :addr_029c
    .sparse-switch
        -54079251 -> :addr_022d
        -33557498 -> :addr_0221
        -12569323 -> :addr_01e7
        -9824363 -> :addr_01bf
        -8787042 -> :addr_019e
        -8752249 -> :addr_0193
        -6723454 -> :addr_0189
        -6717156 -> :addr_015f
        -6575374 -> :addr_0151
        -6490448 -> :addr_0120
        -3083367 -> :addr_0109
        -3067227 -> :addr_00da
        -1907860 -> :addr_00a6
        -1904462 -> :addr_007b
        -1753904 -> :addr_0070
        -1742362 -> :addr_0041
        -1737566 -> :addr_0020
        -1314777 -> :addr_0011
    .end sparse-switch
    :addr_02e6
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
    const/4 v1, 0x1
    const/4 v2, 0x2
    const/4 v3, 0x3
    const/4 v4, 0x4
    const/4 v5, 0x5
    const/4 v6, 0x6
    sget v7, Ll/ܰۙ;->ۘۢ֫:I
    sget v8, Ll/ۚۘ;->᩹᩺ۨ:I
    const-string v9, "ۘ᩷ᩳ"
    const/4 v10, -0x6
    invoke-static {v9, v10}, Ll/ۡ۫;->۠ۢ᩶(Ljava/lang/Object;I)C
    move-result v10
    mul-int/lit16 v10, v10, 0x3c1
    const/4 v11, -0x5
    invoke-static {v9, v11}, Ll/ۡ۫;->۠ۢ᩶(Ljava/lang/Object;I)C
    move-result v11
    mul-int/lit8 v11, v11, 0x1f
    add-int/2addr v10, v11
    xor-int/2addr v10, v8
    :addr_001d
    const/4 v11, -0x5
    :addr_001e
    invoke-static {v9, v11}, Ll/ۡ۫;->۠ۢ᩶(Ljava/lang/Object;I)C
    move-result v9
    :addr_0022
    add-int/2addr v10, v9
    :addr_0023
    sparse-switch v10, :addr_0214
    .line 77
    invoke-static {}, Ll/ۤۙ;->ᩴ֫֫()I
    sget-boolean v9, Ll/ۛܶ;->ۙ᩵᩶:Z
    if-eqz v9, :addr_0197
    goto/16 :addr_016f
    .line 171
    invoke-static {}, Ll/ܽ᩶;->ۖܶ᩹()I
    invoke-static {}, Ll/ۛܰ;->ᩴ᩶ᩴ()I
    move-result v9
    if-eqz v9, :addr_003a
    goto/16 :addr_01ea
    :addr_003a
    const-string v9, "ۗ۠ۤ"
    const/4 v10, -0x6
    invoke-static {v9, v10}, Ll/ۡ۫;->۠ۢ᩶(Ljava/lang/Object;I)C
    move-result v10
    const/4 v11, -0x5
    invoke-static {v9, v11}, Ll/ۡ۫;->۠ۢ᩶(Ljava/lang/Object;I)C
    move-result v11
    mul-int v10, v10, v11
    xor-int/2addr v10, v8
    goto/16 :addr_00d0
    .line 243
    invoke-static {}, Ll/ܽۛ;->ܺۢᩴ()I
    invoke-static {}, Ll/ۘ᩹;->᩶᩵᩵()I
    move-result v9
    if-lez v9, :addr_01ea
    goto/16 :addr_016f
    .line 7
    invoke-static {}, Ll/ۘ;->۬ۖ۬()I
    sget-boolean v9, Ll/᩻᩷;->ܰ۫ۡ:Z
    if-eqz v9, :addr_01d1
    goto/16 :addr_016f
    .line 25
    invoke-static {}, Ll/ۤܿ;->۬ܽܳ()I
    invoke-static {}, Ll/ۤ۟;->ܺ᩷ᩴ()I
    goto/16 :addr_016f
    .line 248
    invoke-static {}, Ll/ܰۡ;->᩷۫֡()I
    const/4 v13, -0x3
    return-object v13
    :try_start_006c
    .line 273
    invoke-static {v5, v6}, Ll/ۤۙ;->ᩳۡۚ(Ljava/lang/Object;Ljava/lang/Object;)V
    goto :addr_0074
    throw v5
    :try_end_006c
    :try_end_006c
    :try_start_0071
    invoke-virtual {v3}, Ljava/io/BufferedInputStream;->close()V
    :try_end_0071
    :try_end_0071
    :addr_0074
    const-string v9, "᩷ۙ֫"
    const/4 v10, -0x6
    invoke-static {v9, v10}, Ll/ܽ᩵;->ᩳ᩹֨(Ljava/lang/Object;I)C
    move-result v10
    xor-int/2addr v10, v7
    const/4 v11, -0x5
    invoke-static {v9, v11}, Ll/ܽ᩵;->ᩳ᩹֨(Ljava/lang/Object;I)C
    move-result v11
    mul-int v10, v10, v11
    const/4 v11, -0x5
    invoke-static {v9, v11}, Ll/ۡ۫;->۠ۢ᩶(Ljava/lang/Object;I)C
    move-result v9
    goto/16 :addr_018e
    move-exception v6
    const-string v9, "ۧۚ۬"
    goto/16 :addr_01a7
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
    goto/16 :addr_0023
    move-exception v5
    const-string v3, "ۤۨۨ"
    const/4 v10, -0x6
    invoke-static {v3, v10}, Ll/ܽ᩵;->ᩳ᩹֨(Ljava/lang/Object;I)C
    move-result v10
    xor-int/2addr v10, v8
    const/4 v11, -0x5
    invoke-static {v3, v11}, Ll/ۡ۫;->۠ۢ᩶(Ljava/lang/Object;I)C
    move-result v11
    mul-int v10, v10, v11
    const/4 v11, -0x5
    invoke-static {v3, v11}, Ll/ܽ᩵;->ᩳ᩹֨(Ljava/lang/Object;I)C
    move-result v3
    sub-int/2addr v10, v3
    move-object v3, v9
    goto/16 :addr_0023
    const-string v9, "ۛ۠۠"
    const/4 v10, -0x6
    invoke-static {v9, v10}, Ll/ܽ᩵;->ᩳ᩹֨(Ljava/lang/Object;I)C
    move-result v10
    const/4 v11, -0x5
    invoke-static {v9, v11}, Ll/ۡ۫;->۠ۢ᩶(Ljava/lang/Object;I)C
    move-result v11
    :addr_00cd
    mul-int v10, v10, v11
    xor-int/2addr v10, v7
    :addr_00d0
    const/4 v11, -0x5
    goto/16 :addr_01c7
    .line 270
    invoke-virtual {v1}, Ll/۠᩺۟;->ܰۖ()Z
    move-result v2
    const/4 v9, -0x7
    if-nez v2, :addr_00f0
    const-string v2, "۠ܶۧ"
    const/4 v10, -0x6
    invoke-static {v2, v10}, Ll/ۡ۫;->۠ۢ᩶(Ljava/lang/Object;I)C
    move-result v10
    xor-int/2addr v10, v8
    const/4 v11, -0x5
    invoke-static {v2, v11}, Ll/ۡ۫;->۠ۢ᩶(Ljava/lang/Object;I)C
    move-result v11
    mul-int v10, v10, v11
    const/4 v11, -0x5
    invoke-static {v2, v11}, Ll/ܽ᩵;->ᩳ᩹֨(Ljava/lang/Object;I)C
    move-result v2
    sub-int/2addr v10, v2
    goto :addr_0105
    :addr_00f0
    const-string v2, "ܺ᩷᩺"
    const/4 v10, -0x6
    invoke-static {v2, v10}, Ll/ܽ᩵;->ᩳ᩹֨(Ljava/lang/Object;I)C
    move-result v10
    const/4 v11, -0x5
    invoke-static {v2, v11}, Ll/ۡ۫;->۠ۢ᩶(Ljava/lang/Object;I)C
    move-result v11
    mul-int v10, v10, v11
    xor-int/2addr v10, v7
    const/4 v11, -0x5
    invoke-static {v2, v11}, Ll/ۡ۫;->۠ۢ᩶(Ljava/lang/Object;I)C
    move-result v2
    add-int/2addr v10, v2
    :addr_0105
    move-object v2, v9
    goto/16 :addr_0023
    .line 269
    invoke-static {v0, v13}, Ll/֫;->ܳܶ᩹(Ljava/lang/Object;Ljava/lang/Object;)Ll/۠᩺۟;
    move-result-object v9
    .line 230
    invoke-static {}, Ll/᩺ܳ;->ۜܺܶ()I
    move-result v10
    if-gtz v10, :addr_0113
    goto :addr_012f
    :addr_0113
    const-string v1, "᩶ܳ۫"
    const/4 v10, -0x6
    invoke-static {v1, v10}, Ll/ܽ᩵;->ᩳ᩹֨(Ljava/lang/Object;I)C
    move-result v10
    xor-int/2addr v10, v8
    const/4 v11, -0x5
    invoke-static {v1, v11}, Ll/ۡ۫;->۠ۢ᩶(Ljava/lang/Object;I)C
    move-result v11
    mul-int v10, v10, v11
    const/4 v11, -0x5
    invoke-static {v1, v11}, Ll/ܽ᩵;->ᩳ᩹֨(Ljava/lang/Object;I)C
    move-result v1
    sub-int/2addr v10, v1
    move-object v1, v9
    goto/16 :addr_0023
    .line 234
    sget v9, Ll/ۤ֫;->᩻ܺ᩵:I
    if-gtz v9, :addr_0143
    :addr_012f
    const-string v9, "ۘ᩵᩶"
    const/4 v10, -0x6
    invoke-static {v9, v10}, Ll/ܽ᩵;->ᩳ᩹֨(Ljava/lang/Object;I)C
    move-result v10
    mul-int/lit16 v10, v10, 0x3c1
    const/4 v11, -0x5
    invoke-static {v9, v11}, Ll/ܽ᩵;->ᩳ᩹֨(Ljava/lang/Object;I)C
    move-result v11
    mul-int/lit8 v11, v11, 0x1f
    add-int/2addr v10, v11
    xor-int/2addr v10, v7
    goto/16 :addr_001d
    :addr_0143
    const-string v9, "۟᩻ᩳ"
    const/4 v10, -0x6
    invoke-static {v9, v10}, Ll/ܽ᩵;->ᩳ᩹֨(Ljava/lang/Object;I)C
    move-result v10
    const/4 v11, -0x5
    invoke-static {v9, v11}, Ll/ۡ۫;->۠ۢ᩶(Ljava/lang/Object;I)C
    move-result v11
    mul-int v10, v10, v11
    xor-int/2addr v10, v8
    const/4 v11, -0x5
    goto/16 :addr_001e
    .line 222
    sget-boolean v9, Ll/ܽۘ;->ᩳᩳ᩻:Z
    if-eqz v9, :addr_015a
    goto :addr_016f
    :addr_015a
    const-string v9, "ۖۘܰ"
    goto/16 :addr_01dc
    sget v9, Ll/᩻ᩴ;->ۤ᩹ۜ:I
    if-gtz v9, :addr_0164
    goto/16 :addr_01ea
    :addr_0164
    const-string v9, "ᩳۖܳ"
    :addr_0166
    invoke-static {v9}, Ll/ۙۘ;->ۙᩴ۫(Ljava/lang/Object;)I
    move-result v9
    goto :addr_01ab
    .line 82
    sget v9, Ll/ۗۤ;->ܺ᩷ۡ:I
    if-gtz v9, :addr_0172
    :addr_016f
    const-string v9, "۬ۧ֡"
    goto :addr_0166
    :addr_0172
    const-string v9, "ۛ᩵ۜ"
    goto :addr_01dc
    sget v9, Ll/ۙۘ;->ۖۢۙ:I
    if-eqz v9, :addr_017a
    goto :addr_0197
    :addr_017a
    const-string v9, "ܽۚ֫"
    const/4 v10, -0x6
    invoke-static {v9, v10}, Ll/ܽ᩵;->ᩳ᩹֨(Ljava/lang/Object;I)C
    move-result v10
    xor-int/2addr v10, v7
    :addr_0182
    const/4 v11, -0x5
    invoke-static {v9, v11}, Ll/ۡ۫;->۠ۢ᩶(Ljava/lang/Object;I)C
    move-result v11
    :addr_0187
    mul-int v10, v10, v11
    const/4 v11, -0x5
    invoke-static {v9, v11}, Ll/ܽ᩵;->ᩳ᩹֨(Ljava/lang/Object;I)C
    move-result v9
    :addr_018e
    sub-int/2addr v10, v9
    goto/16 :addr_0023
    invoke-static {}, Ll/᩹;->ۖ᩷֫()I
    move-result v9
    if-eqz v9, :addr_01a5
    :addr_0197
    const-string v9, "᩷᩵ۙ"
    const/4 v10, -0x6
    invoke-static {v9, v10}, Ll/ۡ۫;->۠ۢ᩶(Ljava/lang/Object;I)C
    move-result v10
    const/4 v11, -0x5
    invoke-static {v9, v11}, Ll/ܽ᩵;->ᩳ᩹֨(Ljava/lang/Object;I)C
    move-result v11
    goto/16 :addr_00cd
    :addr_01a5
    const-string v9, "۬᩸۫"
    :addr_01a7
    invoke-static {v9}, Ll/ۤ֨;->۬ۚᩴ(Ljava/lang/Object;)I
    move-result v9
    :addr_01ab
    xor-int v10, v9, v8
    goto/16 :addr_0023
    .line 186
    sget v9, Ll/ۢۨ;->ᩳۨܶ:I
    if-ltz v9, :addr_01b4
    goto :addr_01ea
    :addr_01b4
    const-string v9, "᩸ᩳܶ"
    const/4 v10, -0x6
    invoke-static {v9, v10}, Ll/ܽ᩵;->ᩳ᩹֨(Ljava/lang/Object;I)C
    move-result v10
    mul-int/lit16 v10, v10, 0x3c1
    const/4 v11, -0x5
    invoke-static {v9, v11}, Ll/ܽ᩵;->ᩳ᩹֨(Ljava/lang/Object;I)C
    move-result v11
    mul-int/lit8 v11, v11, 0x1f
    add-int/2addr v10, v11
    xor-int/2addr v10, v8
    const/4 v11, -0x5
    :addr_01c7
    invoke-static {v9, v11}, Ll/ܽ᩵;->ᩳ᩹֨(Ljava/lang/Object;I)C
    move-result v9
    goto/16 :addr_0022
    .line 122
    sget v9, Ll/ۗۤ;->ܺ᩷ۡ:I
    if-gtz v9, :addr_01da
    :addr_01d1
    const-string v9, "֫ۜܽ"
    const/4 v10, -0x6
    invoke-static {v9, v10}, Ll/ۡ۫;->۠ۢ᩶(Ljava/lang/Object;I)C
    move-result v10
    xor-int/2addr v10, v8
    goto :addr_0182
    :addr_01da
    const-string v9, "ۘۢۛ"
    :addr_01dc
    invoke-static {v9}, Ll/ۙۘ;->ۙᩴ۫(Ljava/lang/Object;)I
    move-result v9
    xor-int v10, v9, v7
    goto/16 :addr_0023
    .line 269
    sget-object v9, Lbin/mt/plus/ShortcutActivity;->ܽۖ:Ll/۠᩺۟;
    .line 28
    sget v10, Ll/ۘᩳ;->ܰ֡۫:I
    if-ltz v10, :addr_01f8
    :addr_01ea
    const-string v9, "ۜۡᩳ"
    const/4 v10, -0x6
    invoke-static {v9, v10}, Ll/ۡ۫;->۠ۢ᩶(Ljava/lang/Object;I)C
    move-result v10
    xor-int/2addr v10, v7
    const/4 v11, -0x5
    invoke-static {v9, v11}, Ll/ܽ᩵;->ᩳ᩹֨(Ljava/lang/Object;I)C
    move-result v11
    goto :addr_0187
    :addr_01f8
    const-string v0, "ۚᩳܳ"
    const/4 v10, -0x6
    invoke-static {v0, v10}, Ll/ܽ᩵;->ᩳ᩹֨(Ljava/lang/Object;I)C
    move-result v10
    mul-int/lit16 v10, v10, 0x3c1
    const/4 v11, -0x5
    invoke-static {v0, v11}, Ll/ۡ۫;->۠ۢ᩶(Ljava/lang/Object;I)C
    move-result v11
    mul-int/lit8 v11, v11, 0x1f
    add-int/2addr v10, v11
    xor-int/2addr v10, v7
    const/4 v11, -0x5
    invoke-static {v0, v11}, Ll/ۡ۫;->۠ۢ᩶(Ljava/lang/Object;I)C
    move-result v0
    add-int/2addr v10, v0
    move-object v0, v9
    goto/16 :addr_0023
    nop
    :addr_0214
    .sparse-switch
        -45905535 -> :addr_00e5
        -43680523 -> :addr_00b0
        -11341447 -> :addr_006d
        -11271964 -> :addr_004e
        -6719300 -> :addr_016e
        -6568653 -> :addr_0132
        -3095238 -> :addr_0028
        -1911108 -> :addr_0152
        -1892587 -> :addr_01c1
        -1759846 -> :addr_0049
        -1755547 -> :addr_0044
        1737145 -> :addr_018c
        1738758 -> :addr_0108
        1763878 -> :addr_006c
        1894434 -> :addr_01aa
        1899402 -> :addr_013b
        1901601 -> :addr_000c
        3100547 -> :addr_006d
        4616777 -> :addr_0033
        4953471 -> :addr_0148
        11878908 -> :addr_003c
        18108124 -> :addr_004d
        45925720 -> :addr_006e
    .end sparse-switch
.end method

.method public static Lbin/mt/plus/ShortcutActivity;->ۖ(Ljava/lang/String;Landroid/graphics/Bitmap;)V
    .registers 10
    const/4 v0, 0x0
    const/4 v1, 0x1
    const/4 v2, 0x2
    sget v3, Ll/ܳܺ;->۫ܿ᩵:I
    sget v4, Ll/᩺ܶ;->ۨ۬۠:I
    const-string v5, "֫ۤ۬"
    const/4 v6, 0x6
    invoke-static {v5, v6}, Ll/ۡ۫;->۠ۢ᩶(Ljava/lang/Object;I)C
    move-result v6
    mul-int/lit16 v6, v6, 0x3c1
    const/4 v7, 0x7
    invoke-static {v5, v7}, Ll/ܽ᩵;->ᩳ᩹֨(Ljava/lang/Object;I)C
    move-result v7
    :addr_0015
    mul-int/lit8 v7, v7, 0x1f
    add-int/2addr v6, v7
    xor-int/2addr v6, v3
    :addr_0019
    const/4 v7, 0x7
    :addr_001a
    invoke-static {v5, v7}, Ll/ܽ᩵;->ᩳ᩹֨(Ljava/lang/Object;I)C
    move-result v5
    :addr_001e
    add-int/2addr v6, v5
    :addr_001f
    sparse-switch v6, :addr_01e6
    .line 17
    sget v5, Ll/ۘ᩹;->ۛۡ᩵:I
    if-gez v5, :addr_0137
    goto :addr_0049
    .line 237
    invoke-static {}, Ll/ܰۡ;->᩷۫֡()I
    move-result v5
    if-gez v5, :addr_0118
    goto/16 :addr_0190
    .line 177
    sget-boolean v5, Ll/ۤۙ;->۫ᩳ۬:Z
    if-eqz v5, :addr_01cd
    goto/16 :addr_0190
    .line 32
    sget v5, Ll/ܽ᩶;->ܺ᩵֨:I
    if-gtz v5, :addr_0174
    goto :addr_0049
    .line 131
    sget-boolean v5, Ll/ۤۙ;->۫ᩳ۬:Z
    if-eqz v5, :addr_0190
    goto/16 :addr_0159
    invoke-static {}, Ll/᩻᩷;->ܺ᩻᩺()I
    sget v5, Ll/ۤۛ;->᩺᩻ۘ:I
    if-ltz v5, :addr_0049
    goto/16 :addr_0159
    :addr_0049
    const-string v5, "֨ۜۧ"
    const/4 v6, 0x6
    invoke-static {v5, v6}, Ll/ۡ۫;->۠ۢ᩶(Ljava/lang/Object;I)C
    move-result v6
    mul-int/lit16 v6, v6, 0x3c1
    const/4 v7, 0x7
    invoke-static {v5, v7}, Ll/ۡ۫;->۠ۢ᩶(Ljava/lang/Object;I)C
    move-result v7
    mul-int/lit8 v7, v7, 0x1f
    add-int/2addr v6, v7
    xor-int/2addr v6, v4
    goto :addr_0019
    .line 26
    invoke-static {}, Ll/ۤۚ;->ܶۘ֨()I
    sget v5, Ll/ܽۛ;->۠ܺ۟:I
    if-ltz v5, :addr_0159
    goto :addr_006a
    .line 200
    invoke-static {}, Ll/ۤۚ;->ܶۘ֨()I
    invoke-static {}, Ll/ۘ;->۬ۖ۬()I
    :addr_006a
    const-string v5, "ۚ᩷᩺"
    const/4 v6, 0x6
    invoke-static {v5, v6}, Ll/ۡ۫;->۠ۢ᩶(Ljava/lang/Object;I)C
    move-result v6
    :addr_0071
    xor-int/2addr v6, v3
    const/4 v7, 0x7
    invoke-static {v5, v7}, Ll/ܽ᩵;->ᩳ᩹֨(Ljava/lang/Object;I)C
    move-result v7
    goto/16 :addr_0129
    .line 179
    invoke-static {}, Ll/ܰۙ;->᩶ۡۤ()I
    return-void
    :try_start_007d
    .line 283
    invoke-static {v1, v2}, Ll/ۤۙ;->ᩳۡۚ(Ljava/lang/Object;Ljava/lang/Object;)V
    goto :addr_0086
    throw v1
    :try_end_007d
    :try_end_007d
    return-void
    :try_start_0083
    invoke-static {v0}, Ll/۬ۨ;->ۜۜܿ(Ljava/lang/Object;)V
    :try_end_0083
    :try_end_0083
    :addr_0086
    const-string v5, "۟ܽۢ"
    const/4 v6, 0x6
    invoke-static {v5, v6}, Ll/ۡ۫;->۠ۢ᩶(Ljava/lang/Object;I)C
    move-result v6
    xor-int/2addr v6, v4
    const/4 v7, 0x7
    invoke-static {v5, v7}, Ll/ۡ۫;->۠ۢ᩶(Ljava/lang/Object;I)C
    move-result v7
    :addr_0093
    mul-int v6, v6, v7
    const/4 v7, 0x7
    invoke-static {v5, v7}, Ll/ۡ۫;->۠ۢ᩶(Ljava/lang/Object;I)C
    move-result v5
    goto/16 :addr_0130
    move-exception v2
    const-string v5, "ۧܶ۠"
    const/4 v6, 0x6
    invoke-static {v5, v6}, Ll/ܽ᩵;->ᩳ᩹֨(Ljava/lang/Object;I)C
    move-result v6
    xor-int/2addr v6, v3
    const/4 v7, 0x7
    invoke-static {v5, v7}, Ll/ܽ᩵;->ᩳ᩹֨(Ljava/lang/Object;I)C
    move-result v7
    goto :addr_0093
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
    :addr_00ca
    xor-int v6, v5, v3
    goto/16 :addr_001f
    move-exception v0
    move-object v1, v0
    const-string v0, "ܰۧ᩸"
    invoke-static {v0}, Ll/ۙۘ;->ۙᩴ۫(Ljava/lang/Object;)I
    move-result v0
    xor-int v6, v0, v4
    move-object v0, v5
    goto/16 :addr_001f
    const-string v5, "۠۟ۖ"
    const/4 v6, 0x6
    invoke-static {v5, v6}, Ll/ܽ᩵;->ᩳ᩹֨(Ljava/lang/Object;I)C
    move-result v6
    :addr_00e2
    const/4 v7, 0x7
    invoke-static {v5, v7}, Ll/ۡ۫;->۠ۢ᩶(Ljava/lang/Object;I)C
    move-result v7
    mul-int v6, v6, v7
    xor-int/2addr v6, v4
    const/4 v7, 0x7
    goto/16 :addr_001a
    .line 96
    sget v5, Ll/᩺ܶ;->ۨ۬۠:I
    if-gtz v5, :addr_00f3
    goto/16 :addr_01b2
    :addr_00f3
    const-string v5, "᩵ۗۙ"
    const/4 v6, 0x6
    invoke-static {v5, v6}, Ll/ܽ᩵;->ᩳ᩹֨(Ljava/lang/Object;I)C
    move-result v6
    mul-int/lit16 v6, v6, 0x3c1
    const/4 v7, 0x7
    invoke-static {v5, v7}, Ll/ۡ۫;->۠ۢ᩶(Ljava/lang/Object;I)C
    move-result v7
    goto/16 :addr_0015
    .line 23
    invoke-static {}, Ll/ᩴᩴ;->ۡۙ۬()I
    move-result v5
    if-ltz v5, :addr_010a
    goto :addr_0137
    :addr_010a
    const-string v5, "֫ܺ᩻"
    :addr_010c
    invoke-static {v5}, Ll/ۤ֨;->۬ۚᩴ(Ljava/lang/Object;)I
    move-result v5
    :addr_0110
    xor-int v6, v5, v4
    goto/16 :addr_001f
    .line 117
    sget v5, Ll/ۢۨ;->ᩳۨܶ:I
    if-ltz v5, :addr_011c
    :addr_0118
    const-string/jumbo v5, "᩻۠ۖ"
    goto :addr_010c
    :addr_011c
    const-string v5, "᩵֫᩹"
    const/4 v6, 0x6
    invoke-static {v5, v6}, Ll/ܽ᩵;->ᩳ᩹֨(Ljava/lang/Object;I)C
    move-result v6
    xor-int/2addr v6, v3
    const/4 v7, 0x7
    invoke-static {v5, v7}, Ll/ۡ۫;->۠ۢ᩶(Ljava/lang/Object;I)C
    move-result v7
    :addr_0129
    mul-int v6, v6, v7
    const/4 v7, 0x7
    invoke-static {v5, v7}, Ll/ܽ᩵;->ᩳ᩹֨(Ljava/lang/Object;I)C
    move-result v5
    :addr_0130
    sub-int/2addr v6, v5
    goto/16 :addr_001f
    .line 77
    sget-boolean v5, Ll/ܽۜ;->ۖۙۖ:Z
    if-eqz v5, :addr_013e
    :addr_0137
    const-string v5, "ۤۡ۠"
    :addr_0139
    invoke-static {v5}, Ll/ۙۘ;->ۙᩴ۫(Ljava/lang/Object;)I
    move-result v5
    goto :addr_0110
    :addr_013e
    const-string v5, "ۢۨܺ"
    const/4 v6, 0x6
    invoke-static {v5, v6}, Ll/ۡ۫;->۠ۢ᩶(Ljava/lang/Object;I)C
    move-result v6
    goto :addr_0184
    .line 220
    sget v5, Ll/ܽ֫;->ۡᩴ᩻:I
    if-ltz v5, :addr_014b
    goto :addr_0190
    :addr_014b
    const-string v5, "ۚۚ֡"
    const/4 v6, 0x6
    invoke-static {v5, v6}, Ll/ܽ᩵;->ᩳ᩹֨(Ljava/lang/Object;I)C
    move-result v6
    goto :addr_01bc
    .line 221
    invoke-static {}, Ll/ܰۙ;->᩶ۡۤ()I
    move-result v5
    if-eqz v5, :addr_0161
    :addr_0159
    const-string v5, "ۛۖۙ"
    const/4 v6, 0x6
    invoke-static {v5, v6}, Ll/ۡ۫;->۠ۢ᩶(Ljava/lang/Object;I)C
    move-result v6
    goto :addr_00e2
    :addr_0161
    const-string v5, "ܺܿۧ"
    const/4 v6, 0x6
    invoke-static {v5, v6}, Ll/ۡ۫;->۠ۢ᩶(Ljava/lang/Object;I)C
    move-result v6
    mul-int/lit16 v6, v6, 0x3c1
    const/4 v7, 0x7
    invoke-static {v5, v7}, Ll/ܽ᩵;->ᩳ᩹֨(Ljava/lang/Object;I)C
    move-result v7
    goto :addr_01c3
    .line 84
    sget-boolean v5, Ll/ۛܰ;->ۗ᩻֨:Z
    if-nez v5, :addr_017d
    :addr_0174
    const-string/jumbo v5, "᩺ۧ᩻"
    :addr_0177
    invoke-static {v5}, Ll/ۙۘ;->ۙᩴ۫(Ljava/lang/Object;)I
    move-result v5
    goto/16 :addr_00ca
    :addr_017d
    const-string v5, "᩸ۖ᩻"
    const/4 v6, 0x6
    invoke-static {v5, v6}, Ll/ܽ᩵;->ᩳ᩹֨(Ljava/lang/Object;I)C
    move-result v6
    :addr_0184
    mul-int/lit16 v6, v6, 0x3c1
    const/4 v7, 0x7
    invoke-static {v5, v7}, Ll/ܽ᩵;->ᩳ᩹֨(Ljava/lang/Object;I)C
    move-result v7
    goto :addr_01a7
    sget v5, Ll/֫;->᩺ܽ֫:I
    if-gtz v5, :addr_0199
    :addr_0190
    const-string v5, "᩸֨᩹"
    const/4 v6, 0x6
    invoke-static {v5, v6}, Ll/ܽ᩵;->ᩳ᩹֨(Ljava/lang/Object;I)C
    move-result v6
    goto/16 :addr_0071
    :addr_0199
    const-string v5, "ܿܳ᩵"
    const/4 v6, 0x6
    invoke-static {v5, v6}, Ll/ܽ᩵;->ᩳ᩹֨(Ljava/lang/Object;I)C
    move-result v6
    mul-int/lit16 v6, v6, 0x3c1
    const/4 v7, 0x7
    invoke-static {v5, v7}, Ll/ۡ۫;->۠ۢ᩶(Ljava/lang/Object;I)C
    move-result v7
    :addr_01a7
    mul-int/lit8 v7, v7, 0x1f
    add-int/2addr v6, v7
    xor-int/2addr v6, v3
    goto :addr_01c7
    invoke-static {}, Ll/ۤۛ;->ۚۨ᩶()Z
    move-result v5
    if-nez v5, :addr_01b5
    :addr_01b2
    const-string v5, "۫ۙۤ"
    goto :addr_0139
    :addr_01b5
    const-string v5, "ۙۜۛ"
    const/4 v6, 0x6
    invoke-static {v5, v6}, Ll/ۡ۫;->۠ۢ᩶(Ljava/lang/Object;I)C
    move-result v6
    :addr_01bc
    mul-int/lit16 v6, v6, 0x3c1
    const/4 v7, 0x7
    invoke-static {v5, v7}, Ll/ۡ۫;->۠ۢ᩶(Ljava/lang/Object;I)C
    move-result v7
    :addr_01c3
    mul-int/lit8 v7, v7, 0x1f
    add-int/2addr v6, v7
    xor-int/2addr v6, v4
    :addr_01c7
    const/4 v7, 0x7
    goto :addr_01e0
    .line 118
    sget v5, Ll/ۘ۟;->᩻ܿ۟:I
    if-gtz v5, :addr_01d0
    :addr_01cd
    const-string v5, "ۘܺܿ"
    goto :addr_0177
    :addr_01d0
    const-string v5, "ۙ᩻֨"
    const/4 v6, 0x6
    invoke-static {v5, v6}, Ll/ܽ᩵;->ᩳ᩹֨(Ljava/lang/Object;I)C
    move-result v6
    const/4 v7, 0x7
    invoke-static {v5, v7}, Ll/ۡ۫;->۠ۢ᩶(Ljava/lang/Object;I)C
    move-result v7
    mul-int v6, v6, v7
    xor-int/2addr v6, v4
    const/4 v7, 0x7
    :addr_01e0
    invoke-static {v5, v7}, Ll/ۡ۫;->۠ۢ᩶(Ljava/lang/Object;I)C
    move-result v5
    goto/16 :addr_001e
    :addr_01e6
    .sparse-switch
        -28059417 -> :addr_0021
        -28026678 -> :addr_00e4
        -8465690 -> :addr_005e
        -7171868 -> :addr_005a
        -6570478 -> :addr_001b
        -6564546 -> :addr_0063
        -6564325 -> :addr_008d
        -6556519 -> :addr_0134
        -1830075 -> :addr_0151
        -1749696 -> :addr_00f5
        -1442329 -> :addr_01aa
        1445542 -> :addr_003d
        1463967 -> :addr_00ce
        1745108 -> :addr_0114
        1746345 -> :addr_016d
        1748464 -> :addr_0016
        1754277 -> :addr_0008
        1834066 -> :addr_0064
        1842575 -> :addr_0127
        3071856 -> :addr_0045
        3077753 -> :addr_008c
        6575170 -> :addr_0010
        7565456 -> :addr_0062
        9819940 -> :addr_018d
    .end sparse-switch
.end method

.method public static Lbin/mt/plus/ShortcutActivity;->ۖ(Ll/۠ᩴۡ;Z)V
    .registers 88
    move-object/from16 v0, v86
    const/4 v4, 0x4
    const/4 v5, 0x5
    const/4 v6, 0x6
    const/4 v7, 0x7
    const/4 v8, -0x8
    const/4 v9, -0x7
    const/4 v10, -0x6
    const/4 v11, -0x5
    const/4 v12, -0x4
    const/4 v13, -0x3
    const/4 v14, -0x2
    const/4 v15, -0x1
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
    const/4 v2, 0x2
    invoke-static {v1, v2}, Ll/ۡ۫;->۠ۢ᩶(Ljava/lang/Object;I)C
    move-result v2
    mul-int/lit16 v2, v2, 0x3c1
    const/4 v3, 0x3
    invoke-static {v1, v3}, Ll/ܽ᩵;->ᩳ᩹֨(Ljava/lang/Object;I)C
    move-result v3
    mul-int/lit8 v3, v3, 0x1f
    add-int/2addr v2, v3
    xor-int v2, v2, v62
    const/4 v3, 0x3
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
    const/4 v1, 0x1
    const/4 v3, 0x3
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
    :addr_00d6
    sparse-switch v2, :addr_1628
    move/from16 v45, v0
    move/from16 v44, v3
    invoke-static {}, Ll/ۙۙ;->ܳܶۖ()I
    invoke-static {}, Ll/ۛܶ;->ܶۖۚ()Z
    move-result v0
    if-eqz v0, :addr_0286
    goto/16 :addr_02a3
    .line 27
    invoke-static {}, Ll/ۙ᩻;->ۧ۫᩺()I
    sget v2, Ll/ۢۨ;->ᩳۨܶ:I
    if-ltz v2, :addr_00f5
    move/from16 v45, v0
    move/from16 v44, v3
    goto/16 :addr_0286
    :addr_00f5
    const-string/jumbo v2, "᩻ܽ۟"
    move/from16 v44, v3
    const/4 v3, 0x3
    invoke-static {v2, v3}, Ll/ܽ᩵;->ᩳ᩹֨(Ljava/lang/Object;I)C
    move-result v3
    mul-int/lit16 v3, v3, 0x3c1
    move/from16 v45, v0
    const/4 v0, 0x0
    invoke-static {v2, v0}, Ll/ۡ۫;->۠ۢ᩶(Ljava/lang/Object;I)C
    move-result v0
    mul-int/lit8 v0, v0, 0x1f
    add-int/2addr v3, v0
    xor-int v0, v3, v63
    const/4 v3, 0x3
    invoke-static {v2, v3}, Ll/ܽ᩵;->ᩳ᩹֨(Ljava/lang/Object;I)C
    move-result v2
    goto/16 :addr_0408
    move/from16 v45, v0
    move/from16 v44, v3
    .line 245
    invoke-static {}, Ll/᩹;->ۖ᩷֫()I
    invoke-static {}, Ll/ᩴᩳ;->ۛܰܶ()I
    move-result v0
    if-lez v0, :addr_0123
    goto/16 :addr_02a3
    :addr_0123
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
    goto/16 :addr_117b
    move/from16 v45, v0
    move/from16 v44, v3
    .line 198
    sget v0, Ll/ܳܺ;->۫ܿ᩵:I
    if-ltz v0, :addr_0199
    :addr_015f
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
    goto/16 :addr_15b6
    :addr_0199
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
    goto/16 :addr_1232
    move/from16 v45, v0
    move/from16 v44, v3
    .line 239
    invoke-static {}, Ll/ۚۘ;->᩸֨᩺()Z
    invoke-static {}, Ll/ۙ֫;->ۛ֫۬()I
    move-result v0
    if-gez v0, :addr_015f
    :addr_01de
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
    goto/16 :addr_0f5b
    move/from16 v45, v0
    move/from16 v44, v3
    .line 44
    invoke-static {}, Ll/ܽۛ;->ܺۢᩴ()I
    sget-boolean v0, Ll/ۛܰ;->ۗ᩻֨:Z
    if-nez v0, :addr_01de
    :addr_0213
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
    goto/16 :addr_101b
    move/from16 v45, v0
    move/from16 v44, v3
    invoke-static {}, Ll/ۙۙ;->ܳܶۖ()I
    sget v0, Ll/ᩴᩳ;->۟֡ۛ:I
    if-ltz v0, :addr_0213
    :addr_024c
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
    goto/16 :addr_1513
    :addr_0286
    const-string/jumbo v0, "᩹᩶ۨ"
    const/4 v2, 0x2
    invoke-static {v0, v2}, Ll/ܽ᩵;->ᩳ᩹֨(Ljava/lang/Object;I)C
    move-result v2
    xor-int v2, v2, v63
    const/4 v3, 0x3
    invoke-static {v0, v3}, Ll/ۡ۫;->۠ۢ᩶(Ljava/lang/Object;I)C
    move-result v3
    goto/16 :addr_0483
    move/from16 v45, v0
    move/from16 v44, v3
    .line 161
    invoke-static {}, Ll/᩻ᩴ;->۟ᩳܳ()Z
    sget v0, Ll/ۙ᩻;->ܿۨ֡:I
    if-gtz v0, :addr_02a3
    goto :addr_024c
    :addr_02a3
    const-string v0, "ۜ۠ܶ"
    goto/16 :addr_043d
    move/from16 v45, v0
    move/from16 v44, v3
    .line 226
    invoke-static {}, Ll/ۘ;->۬ۖ۬()I
    goto :addr_024c
    invoke-static {}, Ll/᩺ܳ;->ۜܺܶ()I
    invoke-static {}, Ll/ܽ֫;->᩺ۙ۬()Z
    return-void
    move/from16 v45, v0
    move/from16 v44, v3
    .line 187
    invoke-static/range {v42 .. v42}, Ll/ۚ۫;->ۜ(Landroid/graphics/Bitmap;)Ll/ۚ۫;
    move-result-object v0
    invoke-virtual {v15, v0}, Ll/۟᩺;->ۖ(Ll/ۚ۫;)V
    goto :addr_02f5
    move/from16 v45, v0
    move/from16 v44, v3
    .line 189
    invoke-virtual {v15}, Ll/۟᩺;->ۖ()Ll/ۢ᩺;
    move-result-object v0
    invoke-static {v1, v0}, Ll/ᩴᩳ;->ᩴܺ᩸(Ljava/lang/Object;Ljava/lang/Object;)Z
    goto :addr_0319
    move/from16 v45, v0
    move/from16 v44, v3
    .line 235
    invoke-static {v7}, Ll/۟۠ۢ;->ۖ(Ljava/lang/String;)Ljava/lang/String;
    move-result-object v0
    if-eqz v0, :addr_0438
    move-object v10, v0
    goto/16 :addr_043a
    move/from16 v45, v0
    move/from16 v44, v3
    .line 184
    invoke-virtual {v15, v8}, Ll/۟᩺;->ۖ(Ljava/lang/CharSequence;)V
    goto/16 :addr_0350
    move/from16 v45, v0
    move/from16 v44, v3
    if-eqz v42, :addr_02f5
    const-string v0, "ۨ᩻ۧ"
    const/4 v2, 0x2
    invoke-static {v0, v2}, Ll/ܽ᩵;->ᩳ᩹֨(Ljava/lang/Object;I)C
    move-result v2
    xor-int v2, v2, v63
    goto/16 :addr_047e
    :addr_02f5
    const-string v0, "ܽ֨ۛ"
    goto/16 :addr_043d
    move/from16 v45, v0
    move/from16 v44, v3
    .line 234
    invoke-static {v7, v4}, Ll/᩶ۤ;->ܿ᩶ۘ(Ljava/lang/Object;Ljava/lang/Object;)Z
    move-result v0
    if-eqz v0, :addr_0438
    const-string v0, "ܶܽᩳ"
    goto/16 :addr_04a9
    move/from16 v45, v0
    move/from16 v44, v3
    .line 177
    invoke-static/range {v35 .. v35}, Ll/۟۠ۢ;->ۖ(Ljava/lang/String;)Ljava/lang/String;
    move-result-object v0
    goto/16 :addr_0474
    move/from16 v45, v0
    move/from16 v44, v3
    if-eqz v42, :addr_0319
    goto/16 :addr_040d
    :addr_0319
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
    goto/16 :addr_0d87
    move/from16 v45, v0
    move/from16 v44, v3
    .line 182
    new-instance v15, Ll/۟᩺;
    invoke-direct {v15, v9}, Ll/۟᩺;-><init>(Ll/ۢ᩺;)V
    if-eqz v8, :addr_0350
    const-string v0, "ᩳ᩻᩷"
    const/4 v2, 0x2
    invoke-static {v0, v2}, Ll/ۡ۫;->۠ۢ᩶(Ljava/lang/Object;I)C
    move-result v2
    mul-int/lit16 v2, v2, 0x3c1
    const/4 v3, 0x3
    invoke-static {v0, v3}, Ll/ۡ۫;->۠ۢ᩶(Ljava/lang/Object;I)C
    move-result v3
    goto/16 :addr_04cd
    :addr_0350
    const-string v0, "᩷ᩳܶ"
    const/4 v2, 0x2
    invoke-static {v0, v2}, Ll/ۡ۫;->۠ۢ᩶(Ljava/lang/Object;I)C
    move-result v2
    const/4 v3, 0x3
    invoke-static {v0, v3}, Ll/ܽ᩵;->ᩳ᩹֨(Ljava/lang/Object;I)C
    move-result v3
    mul-int v2, v2, v3
    xor-int v2, v2, v63
    const/4 v3, 0x3
    invoke-static {v0, v3}, Ll/ۡ۫;->۠ۢ᩶(Ljava/lang/Object;I)C
    move-result v0
    goto/16 :addr_04d7
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
    goto/16 :addr_0dc9
    move/from16 v45, v0
    move/from16 v44, v3
    .line 233
    invoke-static {v13, v5}, Ll/ܽۘ;->֫֫ۨ(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/String;
    move-result-object v0
    if-eqz v0, :addr_0438
    const-string v2, "ᩴۘ᩹"
    const/4 v3, 0x3
    invoke-static {v2, v3}, Ll/ۡ۫;->۠ۢ᩶(Ljava/lang/Object;I)C
    move-result v3
    mul-int/lit16 v3, v3, 0x3c1
    const/4 v7, 0x7
    invoke-static {v2, v7}, Ll/ܽ᩵;->ᩳ᩹֨(Ljava/lang/Object;I)C
    move-result v7
    mul-int/lit8 v7, v7, 0x1f
    add-int/2addr v3, v7
    xor-int v3, v3, v62
    const/4 v7, 0x7
    invoke-static {v2, v7}, Ll/ܽ᩵;->ᩳ᩹֨(Ljava/lang/Object;I)C
    move-result v2
    add-int/2addr v2, v3
    move-object v7, v0
    goto/16 :addr_0611
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
    goto :addr_0419
    move/from16 v45, v0
    move/from16 v44, v3
    move-object/from16 v0, v35
    .line 176
    invoke-static {v0, v4}, Ll/᩶ۤ;->ܿ᩶ۘ(Ljava/lang/Object;Ljava/lang/Object;)Z
    move-result v2
    if-eqz v2, :addr_03e2
    const-string v2, "۫ۚܶ"
    invoke-static {v2}, Ll/ۙۘ;->ۙᩴ۫(Ljava/lang/Object;)I
    move-result v2
    xor-int v2, v2, v63
    move-object/from16 v35, v0
    goto/16 :addr_0611
    :addr_03e2
    move-object/from16 v35, v0
    goto/16 :addr_04ec
    move/from16 v45, v0
    move/from16 v44, v3
    move-object/from16 v0, v35
    if-nez v8, :addr_040b
    const-string v2, "ۘۨۤ"
    const/4 v3, 0x3
    invoke-static {v2, v3}, Ll/ܽ᩵;->ᩳ᩹֨(Ljava/lang/Object;I)C
    move-result v3
    mul-int/lit16 v3, v3, 0x3c1
    move-object/from16 v35, v0
    const/4 v0, 0x0
    invoke-static {v2, v0}, Ll/ܽ᩵;->ᩳ᩹֨(Ljava/lang/Object;I)C
    move-result v0
    mul-int/lit8 v0, v0, 0x1f
    add-int/2addr v3, v0
    xor-int v0, v3, v63
    const/4 v3, 0x3
    invoke-static {v2, v3}, Ll/ۡ۫;->۠ۢ᩶(Ljava/lang/Object;I)C
    move-result v2
    :addr_0408
    add-int/2addr v2, v0
    goto/16 :addr_0611
    :addr_040b
    move-object/from16 v35, v0
    :addr_040d
    const-string v0, "ۧ֡᩶"
    const/4 v2, 0x2
    invoke-static {v0, v2}, Ll/ܽ᩵;->ᩳ᩹֨(Ljava/lang/Object;I)C
    move-result v2
    goto :addr_047c
    move/from16 v45, v0
    move/from16 v44, v3
    :addr_0419
    const-string v0, "ܳܰۜ"
    goto :addr_043d
    move/from16 v45, v0
    move/from16 v44, v3
    const/4 v0, 0x0
    .line 232
    invoke-virtual {v13, v6, v0}, Landroid/content/Intent;->getBooleanExtra(Ljava/lang/String;Z)Z
    move-result v0
    if-eqz v0, :addr_0438
    const-string/jumbo v0, "᩺᩷ۖ"
    const/4 v2, 0x2
    invoke-static {v0, v2}, Ll/ۡ۫;->۠ۢ᩶(Ljava/lang/Object;I)C
    move-result v2
    xor-int v2, v2, v63
    const/4 v3, 0x3
    invoke-static {v0, v3}, Ll/ܽ᩵;->ᩳ᩹֨(Ljava/lang/Object;I)C
    move-result v3
    goto/16 :addr_04b5
    :addr_0438
    move-object/from16 v10, v20
    :addr_043a
    const-string/jumbo v0, "᩺۬ܽ"
    :addr_043d
    invoke-static {v0}, Ll/ۤ֨;->۬ۚᩴ(Ljava/lang/Object;)I
    move-result v0
    xor-int v2, v0, v62
    goto/16 :addr_0611
    move/from16 v45, v0
    move/from16 v44, v3
    .line 175
    invoke-static {v14, v5}, Ll/ۙ֫;->ܶܳᩴ(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/String;
    move-result-object v0
    if-eqz v0, :addr_04ec
    const-string v2, "ܺۛۢ"
    const/4 v3, 0x3
    invoke-static {v2, v3}, Ll/ۡ۫;->۠ۢ᩶(Ljava/lang/Object;I)C
    move-result v3
    move-object/from16 v46, v0
    const/4 v0, 0x0
    invoke-static {v2, v0}, Ll/ܽ᩵;->ᩳ᩹֨(Ljava/lang/Object;I)C
    move-result v0
    mul-int v3, v3, v0
    xor-int v0, v3, v63
    const/4 v3, 0x3
    invoke-static {v2, v3}, Ll/ܽ᩵;->ᩳ᩹֨(Ljava/lang/Object;I)C
    move-result v2
    add-int/2addr v2, v0
    move/from16 v3, v44
    move/from16 v0, v45
    move-object/from16 v35, v46
    goto/16 :addr_00d6
    move/from16 v45, v0
    move/from16 v44, v3
    const/4 v0, 0x0
    :addr_0474
    move-object v8, v0
    const-string v0, "ܳܰۗ"
    const/4 v2, 0x2
    invoke-static {v0, v2}, Ll/ۡ۫;->۠ۢ᩶(Ljava/lang/Object;I)C
    move-result v2
    :addr_047c
    xor-int v2, v2, v62
    :addr_047e
    const/4 v3, 0x3
    invoke-static {v0, v3}, Ll/ܽ᩵;->ᩳ᩹֨(Ljava/lang/Object;I)C
    move-result v3
    :addr_0483
    mul-int v2, v2, v3
    const/4 v3, 0x3
    invoke-static {v0, v3}, Ll/ܽ᩵;->ᩳ᩹֨(Ljava/lang/Object;I)C
    move-result v0
    goto :addr_04bc
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
    goto/16 :addr_05b0
    move/from16 v45, v0
    move/from16 v44, v3
    if-nez v51, :addr_04bf
    const-string v0, "ܺۡܽ"
    :addr_04a9
    const/4 v2, 0x2
    invoke-static {v0, v2}, Ll/ܽ᩵;->ᩳ᩹֨(Ljava/lang/Object;I)C
    move-result v2
    xor-int v2, v2, v63
    const/4 v3, 0x3
    invoke-static {v0, v3}, Ll/ۡ۫;->۠ۢ᩶(Ljava/lang/Object;I)C
    move-result v3
    :addr_04b5
    mul-int v2, v2, v3
    const/4 v3, 0x3
    invoke-static {v0, v3}, Ll/ۡ۫;->۠ۢ᩶(Ljava/lang/Object;I)C
    move-result v0
    :addr_04bc
    sub-int/2addr v2, v0
    goto/16 :addr_0611
    :addr_04bf
    const-string v0, "ۛۗۙ"
    const/4 v2, 0x2
    invoke-static {v0, v2}, Ll/ܽ᩵;->ᩳ᩹֨(Ljava/lang/Object;I)C
    move-result v2
    mul-int/lit16 v2, v2, 0x3c1
    const/4 v3, 0x3
    invoke-static {v0, v3}, Ll/ܽ᩵;->ᩳ᩹֨(Ljava/lang/Object;I)C
    move-result v3
    :addr_04cd
    mul-int/lit8 v3, v3, 0x1f
    add-int/2addr v2, v3
    xor-int v2, v2, v62
    const/4 v3, 0x3
    invoke-static {v0, v3}, Ll/ܽ᩵;->ᩳ᩹֨(Ljava/lang/Object;I)C
    move-result v0
    :addr_04d7
    add-int/2addr v2, v0
    goto/16 :addr_0611
    move/from16 v45, v0
    move/from16 v44, v3
    .line 174
    invoke-virtual {v14, v6, v12}, Landroid/content/Intent;->getBooleanExtra(Ljava/lang/String;Z)Z
    move-result v0
    if-eqz v0, :addr_04ec
    const-string/jumbo v0, "᩻֫ۡ"
    invoke-static {v0}, Ll/ۙۘ;->ۙᩴ۫(Ljava/lang/Object;)I
    move-result v0
    goto :addr_04f2
    :addr_04ec
    const-string v0, "ۤ۬᩻"
    invoke-static {v0}, Ll/ۤ֨;->۬ۚᩴ(Ljava/lang/Object;)I
    move-result v0
    :addr_04f2
    xor-int v2, v0, v63
    goto/16 :addr_0611
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
    goto :addr_0520
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
    :addr_0520
    move-object/from16 v2, v18
    move/from16 v3, v38
    move/from16 v38, v43
    move-object/from16 v18, v4
    move-object/from16 v43, v5
    move/from16 v4, v30
    goto/16 :addr_05fc
    move/from16 v44, v3
    .line 195
    invoke-static/range {v44 .. v44}, Ll/۟᩸;->ܿ᩵֨(I)V
    return-void
    move v2, v0
    move/from16 v44, v3
    const/4 v0, 0x0
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
    goto/16 :addr_07b0
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
    goto/16 :addr_0726
    move/from16 v45, v0
    move/from16 v44, v3
    move-object/from16 v2, v18
    move/from16 v3, v38
    move/from16 v38, v43
    if-nez v34, :addr_05aa
    const-string v0, "ۗܶ֫"
    move-object/from16 v18, v4
    const/4 v4, 0x4
    invoke-static {v0, v4}, Ll/ܽ᩵;->ᩳ᩹֨(Ljava/lang/Object;I)C
    move-result v4
    xor-int v4, v4, v62
    move-object/from16 v43, v5
    const/4 v5, 0x5
    invoke-static {v0, v5}, Ll/ۡ۫;->۠ۢ᩶(Ljava/lang/Object;I)C
    move-result v5
    mul-int v4, v4, v5
    const/4 v5, 0x5
    invoke-static {v0, v5}, Ll/ܽ᩵;->ᩳ᩹֨(Ljava/lang/Object;I)C
    move-result v0
    sub-int v0, v4, v0
    goto :addr_0606
    :addr_05aa
    move-object/from16 v18, v4
    move-object/from16 v43, v5
    move-object/from16 v51, v34
    :addr_05b0
    const-string v0, "ۧۗۢ"
    const/4 v4, 0x4
    invoke-static {v0, v4}, Ll/ܽ᩵;->ᩳ᩹֨(Ljava/lang/Object;I)C
    move-result v4
    mul-int/lit16 v4, v4, 0x3c1
    const/4 v5, 0x5
    invoke-static {v0, v5}, Ll/ܽ᩵;->ᩳ᩹֨(Ljava/lang/Object;I)C
    move-result v5
    mul-int/lit8 v5, v5, 0x1f
    add-int/2addr v4, v5
    xor-int v4, v4, v63
    const/4 v5, 0x5
    invoke-static {v0, v5}, Ll/ۡ۫;->۠ۢ᩶(Ljava/lang/Object;I)C
    move-result v0
    add-int/2addr v0, v4
    goto :addr_0606
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
    goto :addr_05fa
    move/from16 v45, v0
    move/from16 v44, v3
    move-object/from16 v2, v18
    move/from16 v3, v38
    move/from16 v38, v43
    move-object/from16 v18, v4
    move-object/from16 v43, v5
    move/from16 v4, v30
    const/4 v0, 0x0
    :addr_05fa
    move-object/from16 v42, v0
    :addr_05fc
    const-string v0, "ۢ᩻ܿ"
    invoke-static {v0}, Ll/ۙۘ;->ۙᩴ۫(Ljava/lang/Object;)I
    move-result v0
    xor-int v0, v0, v62
    move/from16 v30, v4
    :addr_0606
    move-object/from16 v4, v18
    move-object/from16 v5, v43
    move-object/from16 v18, v2
    move/from16 v43, v38
    move v2, v0
    move/from16 v38, v3
    :addr_0611
    move/from16 v3, v44
    move/from16 v0, v45
    goto/16 :addr_00d6
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
    if-eq v0, v5, :addr_065f
    move/from16 v29, v0
    const-string v0, "ۖ֫᩶"
    move/from16 v30, v4
    const/4 v4, 0x4
    invoke-static {v0, v4}, Ll/ۡ۫;->۠ۢ᩶(Ljava/lang/Object;I)C
    move-result v4
    mul-int/lit16 v4, v4, 0x3c1
    move-object/from16 v46, v6
    const/4 v6, 0x6
    invoke-static {v0, v6}, Ll/ܽ᩵;->ᩳ᩹֨(Ljava/lang/Object;I)C
    move-result v6
    mul-int/lit8 v6, v6, 0x1f
    add-int/2addr v4, v6
    xor-int v4, v4, v62
    const/4 v6, 0x6
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
    goto/16 :addr_06ef
    :addr_065f
    move/from16 v30, v4
    move-object/from16 v46, v6
    move-object/from16 v29, v7
    move/from16 v4, v28
    move/from16 v7, v68
    goto :addr_06a7
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
    const/4 v6, 0x6
    move-object/from16 v29, v7
    move/from16 v7, v68
    invoke-static {v0, v4, v6, v7}, Ll/ۤۛ;->ܳ᩺۫([SIII)Ljava/lang/String;
    move-result-object v0
    .line 170
    invoke-virtual {v14, v0, v12}, Landroid/content/Intent;->getBooleanExtra(Ljava/lang/String;Z)Z
    move-result v0
    if-eqz v0, :addr_06a5
    const-string v0, "ܰ᩷᩷"
    const/4 v4, 0x4
    invoke-static {v0, v4}, Ll/ۡ۫;->۠ۢ᩶(Ljava/lang/Object;I)C
    move-result v4
    const/4 v6, 0x6
    invoke-static {v0, v6}, Ll/ۡ۫;->۠ۢ᩶(Ljava/lang/Object;I)C
    move-result v6
    mul-int v4, v4, v6
    xor-int v4, v4, v63
    const/4 v6, 0x6
    invoke-static {v0, v6}, Ll/ۡ۫;->۠ۢ᩶(Ljava/lang/Object;I)C
    move-result v0
    goto :addr_06db
    :addr_06a5
    move/from16 v4, v28
    :addr_06a7
    move-object/from16 v28, v2
    goto/16 :addr_0863
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
    if-eqz v87, :addr_06f5
    const-string v0, "ܳ᩺᩹"
    const/4 v4, 0x4
    invoke-static {v0, v4}, Ll/ܽ᩵;->ᩳ᩹֨(Ljava/lang/Object;I)C
    move-result v4
    mul-int/lit16 v4, v4, 0x3c1
    const/4 v6, 0x6
    invoke-static {v0, v6}, Ll/ۡ۫;->۠ۢ᩶(Ljava/lang/Object;I)C
    move-result v6
    mul-int/lit8 v6, v6, 0x1f
    add-int/2addr v4, v6
    xor-int v4, v4, v62
    const/4 v6, 0x6
    invoke-static {v0, v6}, Ll/ܽ᩵;->ᩳ᩹֨(Ljava/lang/Object;I)C
    move-result v0
    :addr_06db
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
    :addr_06ef
    move/from16 v38, v3
    move/from16 v3, v44
    goto/16 :addr_00d6
    :addr_06f5
    move-object/from16 v0, v86
    move/from16 v47, v3
    move/from16 v4, v28
    move-object/from16 v28, v2
    goto/16 :addr_0a1f
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
    :addr_0726
    const-string v0, "ۢܿۜ"
    const/4 v6, 0x6
    invoke-static {v0, v6}, Ll/ۡ۫;->۠ۢ᩶(Ljava/lang/Object;I)C
    move-result v6
    xor-int v6, v6, v63
    move-object/from16 v28, v2
    const/4 v2, 0x2
    invoke-static {v0, v2}, Ll/ۡ۫;->۠ۢ᩶(Ljava/lang/Object;I)C
    move-result v2
    mul-int v6, v6, v2
    const/4 v2, 0x2
    invoke-static {v0, v2}, Ll/ܽ᩵;->ᩳ᩹֨(Ljava/lang/Object;I)C
    move-result v0
    sub-int v2, v6, v0
    goto/16 :addr_08dc
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
    if-eq v0, v5, :addr_078d
    const-string v2, "᩵ۚۛ"
    const/4 v6, 0x6
    invoke-static {v2, v6}, Ll/ܽ᩵;->ᩳ᩹֨(Ljava/lang/Object;I)C
    move-result v6
    move/from16 v47, v0
    const/4 v0, 0x0
    invoke-static {v2, v0}, Ll/ۡ۫;->۠ۢ᩶(Ljava/lang/Object;I)C
    move-result v0
    mul-int v6, v6, v0
    xor-int v0, v6, v63
    const/4 v6, 0x6
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
    goto/16 :addr_0a47
    :addr_078d
    move-object/from16 v0, v86
    goto/16 :addr_09a2
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
    :addr_07b0
    const-string v0, "۬ۧۨ"
    const/4 v2, 0x2
    invoke-static {v0, v2}, Ll/ܽ᩵;->ᩳ᩹֨(Ljava/lang/Object;I)C
    move-result v2
    const/4 v6, 0x6
    invoke-static {v0, v6}, Ll/ۡ۫;->۠ۢ᩶(Ljava/lang/Object;I)C
    move-result v6
    mul-int v2, v2, v6
    xor-int v2, v2, v62
    const/4 v6, 0x6
    goto/16 :addr_08ac
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
    if-eqz v87, :addr_0817
    const-string v0, "ۖۢ᩶"
    invoke-static {v0}, Ll/ۤ֨;->۬ۚᩴ(Ljava/lang/Object;)I
    move-result v0
    xor-int v2, v0, v63
    goto/16 :addr_08dc
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
    const/4 v6, 0x6
    invoke-static {v0, v2, v6, v7}, Ll/ۤ֫;->᩻᩸ۘ([SIII)Ljava/lang/String;
    move-result-object v0
    invoke-static {v0}, Ll/ۤ֨;->۬ۚᩴ(Ljava/lang/Object;)I
    move-result v0
    const v2, 0x7e6f59d4
    xor-int/2addr v0, v2
    .line 254
    invoke-static {v0}, Ll/ۘ᩺;->ۛۘܿ(I)V
    :addr_0817
    move-object/from16 v0, v86
    move/from16 v47, v3
    goto/16 :addr_0a1f
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
    if-eq v0, v5, :addr_0863
    const-string v2, "֫᩷᩶"
    const/4 v6, 0x6
    invoke-static {v2, v6}, Ll/ܽ᩵;->ᩳ᩹֨(Ljava/lang/Object;I)C
    move-result v6
    xor-int v6, v6, v62
    move/from16 v47, v0
    const/4 v0, 0x0
    invoke-static {v2, v0}, Ll/ۡ۫;->۠ۢ᩶(Ljava/lang/Object;I)C
    move-result v0
    mul-int v6, v6, v0
    const/4 v0, 0x0
    invoke-static {v2, v0}, Ll/ۡ۫;->۠ۢ᩶(Ljava/lang/Object;I)C
    move-result v0
    sub-int v2, v6, v0
    move/from16 v68, v7
    move-object/from16 v7, v29
    move/from16 v0, v45
    move-object/from16 v6, v46
    move/from16 v30, v47
    goto/16 :addr_08e4
    :addr_0863
    const-string v0, "۫ۖܽ"
    invoke-static {v0}, Ll/ۙۘ;->ۙᩴ۫(Ljava/lang/Object;)I
    move-result v0
    xor-int v2, v0, v62
    goto/16 :addr_08dc
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
    if-eqz v27, :addr_0898
    const-string v0, "۟ۙۚ"
    const/4 v2, 0x2
    invoke-static {v0, v2}, Ll/ۡ۫;->۠ۢ᩶(Ljava/lang/Object;I)C
    move-result v2
    mul-int/lit16 v2, v2, 0x3c1
    const/4 v6, 0x6
    invoke-static {v0, v6}, Ll/ܽ᩵;->ᩳ᩹֨(Ljava/lang/Object;I)C
    move-result v6
    goto :addr_08a6
    :addr_0898
    const-string v0, "ܽ֡ܰ"
    const/4 v2, 0x2
    invoke-static {v0, v2}, Ll/ܽ᩵;->ᩳ᩹֨(Ljava/lang/Object;I)C
    move-result v2
    mul-int/lit16 v2, v2, 0x3c1
    const/4 v6, 0x6
    invoke-static {v0, v6}, Ll/ۡ۫;->۠ۢ᩶(Ljava/lang/Object;I)C
    move-result v6
    :addr_08a6
    mul-int/lit8 v6, v6, 0x1f
    add-int/2addr v2, v6
    xor-int v2, v2, v63
    const/4 v6, 0x6
    :addr_08ac
    invoke-static {v0, v6}, Ll/ۡ۫;->۠ۢ᩶(Ljava/lang/Object;I)C
    move-result v0
    add-int/2addr v2, v0
    goto :addr_08dc
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
    if-nez v2, :addr_08f0
    const-string v2, "ۗ᩸ܶ"
    invoke-static {v2}, Ll/ۤ֨;->۬ۚᩴ(Ljava/lang/Object;)I
    move-result v2
    xor-int v2, v2, v62
    :addr_08dc
    move/from16 v68, v7
    move-object/from16 v7, v29
    move/from16 v0, v45
    move-object/from16 v6, v46
    :addr_08e4
    move/from16 v29, v5
    move-object/from16 v5, v43
    move/from16 v43, v38
    move/from16 v38, v3
    move/from16 v3, v44
    goto/16 :addr_0a47
    :addr_08f0
    move/from16 v47, v3
    move/from16 v48, v4
    move-object/from16 v6, v23
    move-object/from16 v2, v24
    goto/16 :addr_0b09
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
    goto/16 :addr_0e54
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
    if-eq v2, v5, :addr_09a2
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
    goto/16 :addr_0a4b
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
    if-eqz v22, :addr_09a2
    const-string v2, "ᩳܶᩴ"
    const/4 v6, 0x6
    invoke-static {v2, v6}, Ll/ܽ᩵;->ᩳ᩹֨(Ljava/lang/Object;I)C
    move-result v6
    mul-int/lit16 v6, v6, 0x3c1
    move/from16 v47, v3
    const/4 v3, 0x3
    invoke-static {v2, v3}, Ll/ܽ᩵;->ᩳ᩹֨(Ljava/lang/Object;I)C
    move-result v3
    mul-int/lit8 v3, v3, 0x1f
    add-int/2addr v6, v3
    xor-int v3, v6, v63
    const/4 v6, 0x6
    goto/16 :addr_0a1a
    :addr_09a2
    move/from16 v47, v3
    const-string v2, "ۘᩴۘ"
    invoke-static {v2}, Ll/ۤ֨;->۬ۚᩴ(Ljava/lang/Object;)I
    move-result v2
    xor-int v2, v2, v62
    goto/16 :addr_0a35
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
    if-nez v2, :addr_09e1
    const-string v2, "ۚۤᩴ"
    const/4 v3, 0x3
    invoke-static {v2, v3}, Ll/ܽ᩵;->ᩳ᩹֨(Ljava/lang/Object;I)C
    move-result v3
    const/4 v6, 0x6
    invoke-static {v2, v6}, Ll/ۡ۫;->۠ۢ᩶(Ljava/lang/Object;I)C
    move-result v6
    mul-int v3, v3, v6
    xor-int v3, v3, v63
    goto :addr_0a2f
    :addr_09e1
    move/from16 v48, v4
    move-object/from16 v6, v23
    move-object/from16 v2, v24
    move-object/from16 v24, v1
    goto/16 :addr_0cbc
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
    if-eqz v87, :addr_0a1f
    const-string v2, "ۡ֫۠"
    const/4 v3, 0x3
    invoke-static {v2, v3}, Ll/ۡ۫;->۠ۢ᩶(Ljava/lang/Object;I)C
    move-result v3
    const/4 v6, 0x6
    invoke-static {v2, v6}, Ll/ܽ᩵;->ᩳ᩹֨(Ljava/lang/Object;I)C
    move-result v6
    mul-int v3, v3, v6
    xor-int v3, v3, v63
    const/4 v6, 0x6
    :addr_0a1a
    invoke-static {v2, v6}, Ll/ܽ᩵;->ᩳ᩹֨(Ljava/lang/Object;I)C
    move-result v2
    goto :addr_0a34
    :addr_0a1f
    const-string v2, "᩷ܿۤ"
    const/4 v3, 0x3
    invoke-static {v2, v3}, Ll/ۡ۫;->۠ۢ᩶(Ljava/lang/Object;I)C
    move-result v3
    const/4 v6, 0x6
    invoke-static {v2, v6}, Ll/ۡ۫;->۠ۢ᩶(Ljava/lang/Object;I)C
    move-result v6
    mul-int v3, v3, v6
    xor-int v3, v3, v62
    :addr_0a2f
    const/4 v6, 0x6
    invoke-static {v2, v6}, Ll/ۡ۫;->۠ۢ᩶(Ljava/lang/Object;I)C
    move-result v2
    :addr_0a34
    add-int/2addr v2, v3
    :addr_0a35
    move/from16 v68, v7
    move-object/from16 v7, v29
    move/from16 v3, v44
    move/from16 v0, v45
    move-object/from16 v6, v46
    move/from16 v29, v5
    move-object/from16 v5, v43
    move/from16 v43, v38
    move/from16 v38, v47
    :addr_0a47
    move-object/from16 v83, v28
    move/from16 v28, v4
    :addr_0a4b
    move-object/from16 v4, v18
    move-object/from16 v18, v83
    goto/16 :addr_00d6
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
    if-eqz v3, :addr_0aaa
    const-string v0, "ۛᩳ۟"
    move-object/from16 v24, v3
    const/4 v3, 0x3
    invoke-static {v0, v3}, Ll/ܽ᩵;->ᩳ᩹֨(Ljava/lang/Object;I)C
    move-result v3
    move/from16 v48, v4
    const/4 v4, 0x4
    invoke-static {v0, v4}, Ll/ۡ۫;->۠ۢ᩶(Ljava/lang/Object;I)C
    move-result v4
    mul-int v3, v3, v4
    xor-int v3, v3, v62
    const/4 v4, 0x4
    invoke-static {v0, v4}, Ll/ܽ᩵;->ᩳ᩹֨(Ljava/lang/Object;I)C
    move-result v0
    add-int/2addr v0, v3
    move-object/from16 v23, v6
    move/from16 v68, v7
    move-object/from16 v4, v18
    move-object/from16 v26, v24
    goto/16 :addr_0de8
    :addr_0aaa
    move/from16 v48, v4
    const-string v0, "᩷ܺۜ"
    const/4 v3, 0x3
    invoke-static {v0, v3}, Ll/ۡ۫;->۠ۢ᩶(Ljava/lang/Object;I)C
    move-result v3
    const/4 v4, 0x4
    invoke-static {v0, v4}, Ll/ܽ᩵;->ᩳ᩹֨(Ljava/lang/Object;I)C
    move-result v4
    mul-int v3, v3, v4
    xor-int v3, v3, v63
    const/4 v4, 0x4
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
    :addr_0ad2
    move v2, v0
    move/from16 v29, v5
    move-object/from16 v23, v6
    move-object/from16 v5, v43
    move/from16 v0, v45
    goto/16 :addr_1620
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
    if-nez v0, :addr_0b09
    const-string v0, "᩷᩹᩷"
    const/4 v3, 0x3
    invoke-static {v0, v3}, Ll/ۡ۫;->۠ۢ᩶(Ljava/lang/Object;I)C
    move-result v3
    xor-int v3, v3, v62
    goto :addr_0b12
    :addr_0b09
    const-string v0, "᩷ۘ۬"
    const/4 v3, 0x3
    invoke-static {v0, v3}, Ll/ۡ۫;->۠ۢ᩶(Ljava/lang/Object;I)C
    move-result v3
    xor-int v3, v3, v63
    :addr_0b12
    const/4 v4, 0x4
    invoke-static {v0, v4}, Ll/ܽ᩵;->ᩳ᩹֨(Ljava/lang/Object;I)C
    move-result v4
    mul-int v3, v3, v4
    const/4 v4, 0x4
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
    goto/16 :addr_1622
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
    if-eqz v0, :addr_0b88
    const-string/jumbo v3, "᩹֨᩵"
    const/4 v4, 0x4
    invoke-static {v3, v4}, Ll/ۡ۫;->۠ۢ᩶(Ljava/lang/Object;I)C
    move-result v4
    mul-int/lit16 v4, v4, 0x3c1
    move-object/from16 v24, v0
    const/4 v0, 0x0
    invoke-static {v3, v0}, Ll/ܽ᩵;->ᩳ᩹֨(Ljava/lang/Object;I)C
    move-result v0
    mul-int/lit8 v0, v0, 0x1f
    add-int/2addr v4, v0
    xor-int v0, v4, v63
    const/4 v4, 0x4
    invoke-static {v3, v4}, Ll/ܽ᩵;->ᩳ᩹֨(Ljava/lang/Object;I)C
    move-result v3
    add-int/2addr v0, v3
    move-object/from16 v23, v6
    move/from16 v68, v7
    move-object/from16 v4, v18
    move-object/from16 v21, v24
    goto :addr_0bad
    :addr_0b88
    const-string v0, "ۛܶۗ"
    const/4 v4, 0x4
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
    const/4 v4, 0x4
    invoke-static {v0, v4}, Ll/ܽ᩵;->ᩳ᩹֨(Ljava/lang/Object;I)C
    move-result v0
    add-int/2addr v0, v1
    move-object/from16 v22, v3
    move-object/from16 v23, v6
    move/from16 v68, v7
    move-object/from16 v4, v18
    move-object/from16 v1, v24
    :addr_0bad
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
    goto/16 :addr_00d6
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
    if-ltz v4, :addr_0c12
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
    goto/16 :addr_117b
    :addr_0c12
    const-string v4, "ۢܽܶ"
    const/4 v11, -0x5
    invoke-static {v4, v11}, Ll/ۡ۫;->۠ۢ᩶(Ljava/lang/Object;I)C
    move-result v11
    const/4 v13, -0x3
    invoke-static {v4, v13}, Ll/ܽ᩵;->ᩳ᩹֨(Ljava/lang/Object;I)C
    move-result v13
    mul-int v11, v11, v13
    xor-int v11, v11, v62
    const/4 v13, -0x3
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
    goto/16 :addr_00d6
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
    if-eqz v16, :addr_0cbc
    const-string v1, "ܰۘܳ"
    const/4 v3, 0x3
    invoke-static {v1, v3}, Ll/ۡ۫;->۠ۢ᩶(Ljava/lang/Object;I)C
    move-result v3
    mul-int/lit16 v3, v3, 0x3c1
    const/4 v4, 0x4
    invoke-static {v1, v4}, Ll/ۡ۫;->۠ۢ᩶(Ljava/lang/Object;I)C
    move-result v4
    mul-int/lit8 v4, v4, 0x1f
    add-int/2addr v3, v4
    xor-int v3, v3, v62
    const/4 v4, 0x4
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
    goto/16 :addr_00d6
    :addr_0cbc
    const-string v0, "᩵۟ܳ"
    const/4 v1, 0x1
    invoke-static {v0, v1}, Ll/ۡ۫;->۠ۢ᩶(Ljava/lang/Object;I)C
    move-result v1
    mul-int/lit16 v1, v1, 0x3c1
    const/4 v3, 0x3
    invoke-static {v0, v3}, Ll/ܽ᩵;->ᩳ᩹֨(Ljava/lang/Object;I)C
    move-result v3
    goto :addr_0cfd
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
    if-eqz v0, :addr_0d04
    const-string v0, "֡ܰۧ"
    const/4 v1, 0x1
    invoke-static {v0, v1}, Ll/ܽ᩵;->ᩳ᩹֨(Ljava/lang/Object;I)C
    move-result v1
    mul-int/lit16 v1, v1, 0x3c1
    const/4 v3, 0x3
    invoke-static {v0, v3}, Ll/ۡ۫;->۠ۢ᩶(Ljava/lang/Object;I)C
    move-result v3
    :addr_0cfd
    mul-int/lit8 v3, v3, 0x1f
    add-int/2addr v1, v3
    xor-int v1, v1, v63
    const/4 v3, 0x3
    goto :addr_0d5a
    :addr_0d04
    const-string v0, "ۧ֨ܶ"
    const/4 v1, 0x1
    invoke-static {v0, v1}, Ll/ۡ۫;->۠ۢ᩶(Ljava/lang/Object;I)C
    move-result v1
    xor-int v1, v1, v62
    const/4 v3, 0x3
    invoke-static {v0, v3}, Ll/ۡ۫;->۠ۢ᩶(Ljava/lang/Object;I)C
    move-result v3
    mul-int v1, v1, v3
    const/4 v3, 0x3
    invoke-static {v0, v3}, Ll/ۡ۫;->۠ۢ᩶(Ljava/lang/Object;I)C
    move-result v0
    goto/16 :addr_0dde
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
    if-eqz v0, :addr_0d49
    const-string v0, "ۖۨܺ"
    invoke-static {v0}, Ll/ۤ֨;->۬ۚᩴ(Ljava/lang/Object;)I
    move-result v0
    xor-int v0, v0, v63
    goto/16 :addr_0de0
    :addr_0d49
    const-string v0, "᩷۫᩻"
    const/4 v1, 0x1
    invoke-static {v0, v1}, Ll/ۡ۫;->۠ۢ᩶(Ljava/lang/Object;I)C
    move-result v1
    const/4 v3, 0x3
    invoke-static {v0, v3}, Ll/ܽ᩵;->ᩳ᩹֨(Ljava/lang/Object;I)C
    move-result v3
    mul-int v1, v1, v3
    xor-int v1, v1, v62
    const/4 v3, 0x3
    :addr_0d5a
    invoke-static {v0, v3}, Ll/ܽ᩵;->ᩳ᩹֨(Ljava/lang/Object;I)C
    move-result v0
    goto :addr_0d9c
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
    :addr_0d87
    const-string v0, "ۢۡ֫"
    const/4 v1, 0x1
    invoke-static {v0, v1}, Ll/ۡ۫;->۠ۢ᩶(Ljava/lang/Object;I)C
    move-result v1
    const/4 v3, 0x3
    invoke-static {v0, v3}, Ll/ۡ۫;->۠ۢ᩶(Ljava/lang/Object;I)C
    move-result v3
    mul-int v1, v1, v3
    xor-int v1, v1, v63
    const/4 v3, 0x3
    invoke-static {v0, v3}, Ll/ۡ۫;->۠ۢ᩶(Ljava/lang/Object;I)C
    move-result v0
    :addr_0d9c
    add-int/2addr v0, v1
    goto :addr_0de0
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
    const/4 v1, 0x1
    move-object/from16 v19, v0
    const/16 v16, 0x0
    :addr_0dc9
    const-string v0, "ۨܽۤ"
    const/4 v1, 0x1
    invoke-static {v0, v1}, Ll/ۡ۫;->۠ۢ᩶(Ljava/lang/Object;I)C
    move-result v1
    xor-int v1, v1, v62
    const/4 v3, 0x3
    invoke-static {v0, v3}, Ll/ۡ۫;->۠ۢ᩶(Ljava/lang/Object;I)C
    move-result v3
    mul-int v1, v1, v3
    const/4 v3, 0x3
    invoke-static {v0, v3}, Ll/ܽ᩵;->ᩳ᩹֨(Ljava/lang/Object;I)C
    move-result v0
    :addr_0dde
    sub-int v0, v1, v0
    :addr_0de0
    move-object/from16 v23, v6
    move/from16 v68, v7
    move-object/from16 v4, v18
    move-object/from16 v1, v24
    :addr_0de8
    move-object/from16 v18, v28
    move-object/from16 v7, v29
    move/from16 v3, v44
    move-object/from16 v6, v46
    move/from16 v28, v48
    goto/16 :addr_0f14
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
    const/4 v4, 0x4
    if-eqz v65, :addr_0e53
    const-string v5, "ܰۖ۠"
    const/4 v12, -0x4
    invoke-static {v5, v12}, Ll/ܽ᩵;->ᩳ᩹֨(Ljava/lang/Object;I)C
    move-result v12
    mul-int/lit16 v12, v12, 0x3c1
    const/4 v2, 0x2
    invoke-static {v5, v2}, Ll/ۡ۫;->۠ۢ᩶(Ljava/lang/Object;I)C
    move-result v2
    mul-int/lit8 v2, v2, 0x1f
    add-int/2addr v12, v2
    xor-int v2, v12, v63
    const/4 v12, -0x4
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
    const/4 v12, -0x4
    const/16 v29, -0x1
    move-object/from16 v24, v0
    goto/16 :addr_0f1b
    :addr_0e53
    const/4 v5, 0x5
    :addr_0e54
    const-string v2, "ܽ֨ܶ"
    const/4 v4, 0x4
    invoke-static {v2, v4}, Ll/ۡ۫;->۠ۢ᩶(Ljava/lang/Object;I)C
    move-result v4
    mul-int/lit16 v4, v4, 0x3c1
    move-object/from16 v23, v0
    const/4 v0, 0x0
    invoke-static {v2, v0}, Ll/ۡ۫;->۠ۢ᩶(Ljava/lang/Object;I)C
    move-result v0
    mul-int/lit8 v0, v0, 0x1f
    add-int/2addr v4, v0
    xor-int v0, v4, v63
    const/4 v4, 0x4
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
    goto/16 :addr_1624
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
    if-ltz v49, :addr_0ee3
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
    goto/16 :addr_1306
    :addr_0ee3
    const-string v3, "ܰ֡ۙ"
    const/4 v6, 0x6
    invoke-static {v3, v6}, Ll/ۡ۫;->۠ۢ᩶(Ljava/lang/Object;I)C
    move-result v6
    mul-int/lit16 v6, v6, 0x3c1
    move-object/from16 v49, v0
    const/4 v0, 0x0
    invoke-static {v3, v0}, Ll/ۡ۫;->۠ۢ᩶(Ljava/lang/Object;I)C
    move-result v0
    mul-int/lit8 v0, v0, 0x1f
    add-int/2addr v6, v0
    xor-int v0, v6, v62
    const/4 v6, 0x6
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
    :addr_0f14
    move-object/from16 v24, v2
    move/from16 v29, v5
    move-object/from16 v5, v43
    move v2, v0
    :addr_0f1b
    move/from16 v43, v38
    move/from16 v0, v45
    goto/16 :addr_1624
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
    if-ltz v53, :addr_0f98
    move-object/from16 v53, v0
    :addr_0f5b
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
    const/4 v2, 0x2
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
    goto/16 :addr_161a
    :addr_0f98
    move-object/from16 v53, v0
    move/from16 v54, v1
    move/from16 v55, v2
    const-string v0, "ۙ᩹ۡ"
    const/4 v1, 0x1
    invoke-static {v0, v1}, Ll/ۡ۫;->۠ۢ᩶(Ljava/lang/Object;I)C
    move-result v1
    xor-int v1, v1, v62
    const/4 v2, 0x2
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
    goto/16 :addr_1622
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
    if-gtz v52, :addr_105d
    :addr_101b
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
    const/4 v2, 0x2
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
    goto/16 :addr_161a
    :addr_105d
    move-object/from16 v52, v1
    move/from16 v56, v2
    const-string v1, "ۙۛۢ"
    const/4 v2, 0x2
    invoke-static {v1, v2}, Ll/ܽ᩵;->ᩳ᩹֨(Ljava/lang/Object;I)C
    move-result v2
    move-object/from16 v57, v0
    const/4 v0, 0x0
    invoke-static {v1, v0}, Ll/ܽ᩵;->ᩳ᩹֨(Ljava/lang/Object;I)C
    move-result v0
    mul-int v2, v2, v0
    xor-int v0, v2, v63
    const/4 v2, 0x2
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
    goto/16 :addr_00d6
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
    if-ltz v58, :addr_10f4
    move-object/from16 v58, v0
    move/from16 v59, v1
    move/from16 v60, v2
    move-object/from16 v64, v69
    move/from16 v66, v70
    goto/16 :addr_1306
    :addr_10f4
    move-object/from16 v58, v0
    const-string v0, "ܺۙۘ"
    move/from16 v59, v1
    const/4 v1, 0x1
    invoke-static {v0, v1}, Ll/ܽ᩵;->ᩳ᩹֨(Ljava/lang/Object;I)C
    move-result v1
    xor-int v1, v1, v63
    move/from16 v60, v2
    const/4 v2, 0x2
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
    :addr_1131
    move-object/from16 v71, v58
    move/from16 v72, v59
    move/from16 v73, v60
    goto/16 :addr_161a
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
    if-eqz v1, :addr_11a8
    :addr_117b
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
    goto :addr_1131
    :addr_11a8
    const-string v1, "ܰۡ֡"
    const/4 v2, 0x2
    invoke-static {v1, v2}, Ll/ܽ᩵;->ᩳ᩹֨(Ljava/lang/Object;I)C
    move-result v2
    xor-int v2, v2, v62
    move/from16 v57, v0
    const/4 v0, 0x0
    invoke-static {v1, v0}, Ll/ܽ᩵;->ᩳ᩹֨(Ljava/lang/Object;I)C
    move-result v0
    mul-int v2, v2, v0
    const/4 v0, 0x0
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
    goto/16 :addr_161a
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
    const/4 v0, 0x0
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
    if-eqz v61, :addr_1269
    :addr_1232
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
    goto/16 :addr_0ad2
    :addr_1269
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
    const/4 v2, 0x2
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
    goto/16 :addr_161a
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
    if-ltz v0, :addr_1325
    :addr_1306
    const-string v0, "֨ܿ᩸"
    const/4 v1, 0x1
    invoke-static {v0, v1}, Ll/ܽ᩵;->ᩳ᩹֨(Ljava/lang/Object;I)C
    move-result v1
    const/4 v2, 0x2
    invoke-static {v0, v2}, Ll/ܽ᩵;->ᩳ᩹֨(Ljava/lang/Object;I)C
    move-result v2
    mul-int v1, v1, v2
    xor-int v1, v1, v62
    const/4 v2, 0x2
    invoke-static {v0, v2}, Ll/ܽ᩵;->ᩳ᩹֨(Ljava/lang/Object;I)C
    move-result v0
    add-int v2, v1, v0
    move/from16 v82, v3
    move-object/from16 v79, v4
    move/from16 v68, v7
    goto/16 :addr_1405
    :addr_1325
    const-string v0, "۟ۚۜ"
    move-object/from16 v57, v1
    const/4 v1, 0x1
    invoke-static {v0, v1}, Ll/ܽ᩵;->ᩳ᩹֨(Ljava/lang/Object;I)C
    move-result v1
    mul-int/lit16 v1, v1, 0x3c1
    move/from16 v61, v2
    const/4 v2, 0x2
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
    goto/16 :addr_161a
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
    goto :addr_13ea
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
    :addr_13ea
    const-string v0, "۬ܿۗ"
    const/4 v1, 0x1
    invoke-static {v0, v1}, Ll/ܽ᩵;->ᩳ᩹֨(Ljava/lang/Object;I)C
    move-result v1
    const/4 v2, 0x2
    invoke-static {v0, v2}, Ll/ۡ۫;->۠ۢ᩶(Ljava/lang/Object;I)C
    move-result v2
    mul-int v1, v1, v2
    xor-int v1, v1, v62
    const/4 v2, 0x2
    invoke-static {v0, v2}, Ll/ܽ᩵;->ᩳ᩹֨(Ljava/lang/Object;I)C
    move-result v0
    add-int v2, v1, v0
    move/from16 v82, v3
    move-object/from16 v79, v4
    :addr_1405
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
    goto/16 :addr_14c3
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
    if-lez v2, :addr_1484
    const-string v0, "ۢ᩷ۖ"
    const/4 v2, 0x2
    invoke-static {v0, v2}, Ll/ۡ۫;->۠ۢ᩶(Ljava/lang/Object;I)C
    move-result v2
    xor-int v2, v2, v63
    move/from16 v57, v1
    const/4 v1, 0x1
    invoke-static {v0, v1}, Ll/ۡ۫;->۠ۢ᩶(Ljava/lang/Object;I)C
    move-result v1
    mul-int v2, v2, v1
    const/4 v1, 0x1
    invoke-static {v0, v1}, Ll/ܽ᩵;->ᩳ᩹֨(Ljava/lang/Object;I)C
    move-result v0
    sub-int/2addr v2, v0
    goto :addr_149d
    :addr_1484
    move/from16 v57, v1
    const-string v0, "ܶۚܽ"
    const/4 v1, 0x1
    invoke-static {v0, v1}, Ll/ۡ۫;->۠ۢ᩶(Ljava/lang/Object;I)C
    move-result v1
    xor-int v1, v1, v63
    :addr_148f
    const/4 v2, 0x2
    invoke-static {v0, v2}, Ll/ۡ۫;->۠ۢ᩶(Ljava/lang/Object;I)C
    move-result v2
    mul-int v1, v1, v2
    const/4 v2, 0x2
    invoke-static {v0, v2}, Ll/ۡ۫;->۠ۢ᩶(Ljava/lang/Object;I)C
    move-result v0
    :addr_149b
    sub-int v2, v1, v0
    :addr_149d
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
    :addr_14c3
    move-object/from16 v71, v58
    move/from16 v72, v59
    move/from16 v73, v60
    move-object/from16 v69, v64
    move/from16 v70, v66
    goto/16 :addr_161a
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
    if-ltz v2, :addr_151e
    :addr_1513
    const-string v0, "ۤܺۢ"
    const/4 v1, 0x1
    invoke-static {v0, v1}, Ll/ܽ᩵;->ᩳ᩹֨(Ljava/lang/Object;I)C
    move-result v1
    xor-int v1, v1, v62
    goto/16 :addr_148f
    :addr_151e
    const-string v2, "ۖۢ᩹"
    const/4 v1, 0x1
    invoke-static {v2, v1}, Ll/ܽ᩵;->ᩳ᩹֨(Ljava/lang/Object;I)C
    move-result v1
    move/from16 v68, v0
    const/4 v0, 0x0
    invoke-static {v2, v0}, Ll/ۡ۫;->۠ۢ᩶(Ljava/lang/Object;I)C
    move-result v0
    mul-int v1, v1, v0
    xor-int v0, v1, v62
    const/4 v1, 0x1
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
    goto/16 :addr_1622
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
    if-gtz v2, :addr_15cd
    :addr_15b6
    const-string v0, "۬֡ۧ"
    const/4 v1, 0x1
    invoke-static {v0, v1}, Ll/ۡ۫;->۠ۢ᩶(Ljava/lang/Object;I)C
    move-result v1
    xor-int v1, v1, v62
    const/4 v2, 0x2
    invoke-static {v0, v2}, Ll/ܽ᩵;->ᩳ᩹֨(Ljava/lang/Object;I)C
    move-result v2
    mul-int v1, v1, v2
    const/4 v2, 0x2
    invoke-static {v0, v2}, Ll/ܽ᩵;->ᩳ᩹֨(Ljava/lang/Object;I)C
    move-result v0
    goto/16 :addr_149b
    :addr_15cd
    const-string v2, "ۗ֫ۖ"
    const/4 v1, 0x1
    invoke-static {v2, v1}, Ll/ܽ᩵;->ᩳ᩹֨(Ljava/lang/Object;I)C
    move-result v1
    move-object/from16 v37, v0
    const/4 v0, 0x0
    invoke-static {v2, v0}, Ll/ܽ᩵;->ᩳ᩹֨(Ljava/lang/Object;I)C
    move-result v0
    mul-int v1, v1, v0
    xor-int v0, v1, v63
    const/4 v1, 0x1
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
    :addr_161a
    move/from16 v29, v5
    move-object/from16 v23, v6
    move-object/from16 v5, v43
    :addr_1620
    move-object/from16 v6, v46
    :addr_1622
    move/from16 v43, v38
    :addr_1624
    move/from16 v38, v47
    goto/16 :addr_00d6
    :addr_1628
    .sparse-switch
        -98440750 -> :addr_07dc
        -25471098 -> :addr_0dbb
        -21108667 -> :addr_04f8
        -17737715 -> :addr_0132
        -17712981 -> :addr_0310
        -17692677 -> :addr_025f
        -17675380 -> :addr_0a07
        -17122641 -> :addr_0fd0
        -16983404 -> :addr_0c45
        -16943218 -> :addr_01d9
        -16839067 -> :addr_03b5
        -12575626 -> :addr_0012
        -11991002 -> :addr_0b77
        -11931542 -> :addr_134f
        -11900858 -> :addr_0748
        -6701483 -> :addr_0205
        -6579059 -> :addr_02d9
        -6547629 -> :addr_0223
        -3411078 -> :addr_0a65
        -3256879 -> :addr_0747
        -3253861 -> :addr_11e5
        -3113718 -> :addr_04ac
        -1985744 -> :addr_0081
        -1965832 -> :addr_0458
        -1912896 -> :addr_0404
        -1886829 -> :addr_05d5
        -1886470 -> :addr_06bb
        -1828527 -> :addr_08d8
        -1822375 -> :addr_0291
        -1818762 -> :addr_01ec
        -1803326 -> :addr_0d1e
        -1765868 -> :addr_0513
        -1752716 -> :addr_01d1
        -1750625 -> :addr_1110
        -1749574 -> :addr_0896
        -1747909 -> :addr_0346
        -1747535 -> :addr_0629
        -1737377 -> :addr_149e
        -1728829 -> :addr_0420
        1444572 -> :addr_097b
        1738092 -> :addr_0af0
        1739800 -> :addr_023b
        1743598 -> :addr_04f4
        1745788 -> :addr_0541
        1754582 -> :addr_03cb
        1756471 -> :addr_0399
        1757187 -> :addr_0231
        1823678 -> :addr_0c89
        1826759 -> :addr_0cc8
        1827048 -> :addr_0594
        2244794 -> :addr_045e
        2343187 -> :addr_01f8
        2416407 -> :addr_12d8
        2419898 -> :addr_0f05
        2434597 -> :addr_033f
        2540557 -> :addr_13f9
        2554693 -> :addr_0713
        2555301 -> :addr_016b
        2557297 -> :addr_0bf5
        3085871 -> :addr_0480
        3093355 -> :addr_0e4b
        3093452 -> :addr_02f4
        3255443 -> :addr_0797
        6561173 -> :addr_036f
        6563530 -> :addr_0853
        6565157 -> :addr_0915
        6571373 -> :addr_066b
        6574777 -> :addr_003e
        6725029 -> :addr_00fb
        8859928 -> :addr_0824
        11590448 -> :addr_129b
        11651121 -> :addr_01e0
        11946862 -> :addr_06ed
        12506365 -> :addr_020e
        44577338 -> :addr_01c1
        44590712 -> :addr_02b3
        45901765 -> :addr_0433
        45909308 -> :addr_1063
    .end sparse-switch
.end method

.method public static Lbin/mt/plus/ShortcutActivity;->᩵()Z
    .registers 7
    const/4 v0, 0x0
    sget v1, Ll/ܰۡ;->ۢᩳۛ:I
    sget v2, Ll/᩻ᩴ;->ۤ᩹ۜ:I
    const-string v3, "ۨۤ᩶"
    :addr_0007
    invoke-static {v3}, Ll/ۤ֨;->۬ۚᩴ(Ljava/lang/Object;)I
    move-result v3
    :addr_000b
    xor-int/2addr v3, v2
    :addr_000c
    sparse-switch v3, :addr_0188
    .line 262
    invoke-static {}, Ll/ܽ᩶;->ۖܶ᩹()I
    invoke-static {}, Ll/ۤ֫;->֡ۖۛ()I
    move-result v3
    if-nez v3, :addr_00bf
    goto/16 :addr_012c
    .line 259
    invoke-static {}, Ll/ᩴᩳ;->ۛܰܶ()I
    sget-boolean v3, Ll/ۛܰ;->ۗ᩻֨:Z
    if-nez v3, :addr_0087
    goto/16 :addr_012c
    .line 263
    invoke-static {}, Ll/ۘ;->۬ۖ۬()I
    sget v3, Ll/ᩴ᩵;->۟᩹᩵:I
    if-nez v3, :addr_002c
    goto/16 :addr_012c
    :addr_002c
    const-string v3, "ۤ᩹֫"
    goto/16 :addr_0157
    .line 260
    invoke-static {}, Ll/֫;->֨᩶᩸()I
    invoke-static {}, Ll/ܰۡ;->᩷۫֡()I
    goto/16 :addr_012c
    invoke-static {}, Ll/ۤ֫;->֡ۖۛ()I
    const/4 v0, 0x0
    return v0
    invoke-static {v0}, Ll/ۛܳ;->᩷֡ܽ(Z)Ljava/lang/Boolean;
    move-result-object v3
    sput-object v3, Lbin/mt/plus/ShortcutActivity;->ۘۖ:Ljava/lang/Boolean;
    goto/16 :addr_016d
    sget v3, Ll/֨֡;->ܿܿ᩺:I
    if-ltz v3, :addr_004b
    goto/16 :addr_0100
    :addr_004b
    const-string v3, "ܶ۠ܺ"
    const/4 v4, 0x4
    invoke-static {v3, v4}, Ll/ܽ᩵;->ᩳ᩹֨(Ljava/lang/Object;I)C
    move-result v4
    mul-int/lit16 v4, v4, 0x3c1
    const/4 v5, 0x5
    invoke-static {v3, v5}, Ll/ܽ᩵;->ᩳ᩹֨(Ljava/lang/Object;I)C
    move-result v5
    mul-int/lit8 v5, v5, 0x1f
    add-int/2addr v4, v5
    xor-int/2addr v4, v2
    goto/16 :addr_0167
    invoke-static {}, Ll/ۤ֨;->֫ܽ۫()Z
    move-result v3
    if-eqz v3, :addr_0067
    goto/16 :addr_0100
    :addr_0067
    const-string v3, "۫ܰۢ"
    const/4 v4, 0x4
    invoke-static {v3, v4}, Ll/ܽ᩵;->ᩳ᩹֨(Ljava/lang/Object;I)C
    move-result v4
    mul-int/lit16 v4, v4, 0x3c1
    const/4 v5, 0x5
    invoke-static {v3, v5}, Ll/ܽ᩵;->ᩳ᩹֨(Ljava/lang/Object;I)C
    move-result v5
    goto :addr_00b3
    sget v3, Ll/ۘ;->ۢۤᩳ:I
    if-ltz v3, :addr_007c
    goto/16 :addr_0100
    :addr_007c
    const-string v3, "ۧ᩶ᩴ"
    invoke-static {v3}, Ll/ۙۘ;->ۙᩴ۫(Ljava/lang/Object;)I
    move-result v3
    goto :addr_00e3
    .line 263
    sget-boolean v3, Ll/ۛܳ;->ۡ֨ᩴ:Z
    if-eqz v3, :addr_0090
    :addr_0087
    const-string v3, "ܶۖܺ"
    const/4 v4, 0x4
    invoke-static {v3, v4}, Ll/ܽ᩵;->ᩳ᩹֨(Ljava/lang/Object;I)C
    move-result v4
    xor-int/2addr v4, v1
    goto :addr_00c7
    :addr_0090
    const-string v3, "ܶۚۗ"
    const/4 v4, 0x4
    invoke-static {v3, v4}, Ll/ۡ۫;->۠ۢ᩶(Ljava/lang/Object;I)C
    move-result v4
    mul-int/lit16 v4, v4, 0x3c1
    const/4 v5, 0x5
    invoke-static {v3, v5}, Ll/ۡ۫;->۠ۢ᩶(Ljava/lang/Object;I)C
    move-result v5
    goto/16 :addr_017b
    sget v3, Ll/۬ۨ;->۫ۜۖ:I
    if-ltz v3, :addr_00a5
    goto :addr_00bf
    :addr_00a5
    const-string v3, "ۖ۫ܰ"
    const/4 v4, 0x4
    invoke-static {v3, v4}, Ll/ܽ᩵;->ᩳ᩹֨(Ljava/lang/Object;I)C
    move-result v4
    mul-int/lit16 v4, v4, 0x3c1
    const/4 v5, 0x5
    invoke-static {v3, v5}, Ll/ۡ۫;->۠ۢ᩶(Ljava/lang/Object;I)C
    move-result v5
    :addr_00b3
    mul-int/lit8 v5, v5, 0x1f
    add-int/2addr v4, v5
    xor-int/2addr v4, v2
    goto/16 :addr_017f
    .line 261
    invoke-static {}, Ll/ۘ᩺;->ۡᩴᩳ()Z
    move-result v3
    if-eqz v3, :addr_00d4
    :addr_00bf
    const-string v3, "ۤۧ᩸"
    const/4 v4, 0x4
    invoke-static {v3, v4}, Ll/ۡ۫;->۠ۢ᩶(Ljava/lang/Object;I)C
    move-result v4
    xor-int/2addr v4, v2
    :addr_00c7
    const/4 v5, 0x5
    invoke-static {v3, v5}, Ll/ܽ᩵;->ᩳ᩹֨(Ljava/lang/Object;I)C
    move-result v5
    mul-int v4, v4, v5
    const/4 v5, 0x5
    invoke-static {v3, v5}, Ll/ۡ۫;->۠ۢ᩶(Ljava/lang/Object;I)C
    move-result v3
    goto :addr_011c
    :addr_00d4
    const-string v3, "ܽ۠ۢ"
    goto/16 :addr_0007
    sget-boolean v3, Ll/ۛܶ;->ۙ᩵᩶:Z
    if-nez v3, :addr_00dd
    goto :addr_012c
    :addr_00dd
    const-string v3, "ܳ᩷ۗ"
    invoke-static {v3}, Ll/ۤ֨;->۬ۚᩴ(Ljava/lang/Object;)I
    move-result v3
    :addr_00e3
    xor-int/2addr v3, v1
    goto/16 :addr_000c
    .line 259
    sget v3, Ll/ۤۚ;->ۖۡۢ:I
    if-ltz v3, :addr_00eb
    goto :addr_012c
    :addr_00eb
    const-string v3, "᩶᩸ۗ"
    const/4 v4, 0x4
    invoke-static {v3, v4}, Ll/ܽ᩵;->ᩳ᩹֨(Ljava/lang/Object;I)C
    move-result v4
    const/4 v5, 0x5
    invoke-static {v3, v5}, Ll/ܽ᩵;->ᩳ᩹֨(Ljava/lang/Object;I)C
    move-result v5
    mul-int v4, v4, v5
    xor-int/2addr v4, v2
    const/4 v5, 0x5
    goto :addr_0168
    sget v3, Ll/ۤ۟;->ۤᩴۚ:I
    if-ltz v3, :addr_0108
    :addr_0100
    const-string v3, "᩶֡ᩳ"
    invoke-static {v3}, Ll/ۙۘ;->ۙᩴ۫(Ljava/lang/Object;)I
    move-result v3
    goto/16 :addr_000b
    :addr_0108
    const-string v3, "ۜܽ֨"
    :addr_010a
    const/4 v4, 0x4
    invoke-static {v3, v4}, Ll/ۡ۫;->۠ۢ᩶(Ljava/lang/Object;I)C
    move-result v4
    xor-int/2addr v4, v1
    const/4 v5, 0x5
    invoke-static {v3, v5}, Ll/ۡ۫;->۠ۢ᩶(Ljava/lang/Object;I)C
    move-result v5
    mul-int v4, v4, v5
    const/4 v5, 0x5
    invoke-static {v3, v5}, Ll/ܽ᩵;->ᩳ᩹֨(Ljava/lang/Object;I)C
    move-result v3
    :addr_011c
    sub-int v3, v4, v3
    goto/16 :addr_000c
    .line 260
    invoke-static {}, Ll/ۡ۫;->۠ۚۧ()Landroid/app/Application;
    move-result-object v3
    invoke-static {v3}, Ll/֨᩺;->ۢ(Landroid/content/Context;)Z
    move-result v3
    sget-boolean v4, Ll/ᩴ;->ܳ᩺ܳ:Z
    if-eqz v4, :addr_012f
    :addr_012c
    const-string v3, "ۧ᩹ܰ"
    goto :addr_010a
    :addr_012f
    const-string v0, "֨ۢܽ"
    const/4 v4, 0x4
    invoke-static {v0, v4}, Ll/ܽ᩵;->ᩳ᩹֨(Ljava/lang/Object;I)C
    move-result v4
    xor-int/2addr v4, v2
    const/4 v5, 0x5
    invoke-static {v0, v5}, Ll/ۡ۫;->۠ۢ᩶(Ljava/lang/Object;I)C
    move-result v5
    mul-int v4, v4, v5
    const/4 v5, 0x5
    invoke-static {v0, v5}, Ll/ۡ۫;->۠ۢ᩶(Ljava/lang/Object;I)C
    move-result v0
    sub-int v0, v4, v0
    move v6, v3
    move v3, v0
    move v0, v6
    goto/16 :addr_000c
    .line 262
    sget-object v0, Lbin/mt/plus/ShortcutActivity;->ۘۖ:Ljava/lang/Boolean;
    invoke-static {v0}, Ll/ܳܺ;->ܿ᩻֡(Ljava/lang/Object;)Z
    move-result v0
    return v0
    .line 259
    sget-object v3, Lbin/mt/plus/ShortcutActivity;->ۘۖ:Ljava/lang/Boolean;
    if-nez v3, :addr_016d
    const-string v3, "ܳ֫۬"
    :addr_0157
    const/4 v4, 0x4
    invoke-static {v3, v4}, Ll/ۡ۫;->۠ۢ᩶(Ljava/lang/Object;I)C
    move-result v4
    mul-int/lit16 v4, v4, 0x3c1
    const/4 v5, 0x5
    invoke-static {v3, v5}, Ll/ܽ᩵;->ᩳ᩹֨(Ljava/lang/Object;I)C
    move-result v5
    mul-int/lit8 v5, v5, 0x1f
    add-int/2addr v4, v5
    xor-int/2addr v4, v1
    :addr_0167
    const/4 v5, 0x5
    :addr_0168
    invoke-static {v3, v5}, Ll/ۡ۫;->۠ۢ᩶(Ljava/lang/Object;I)C
    move-result v3
    goto :addr_0184
    :addr_016d
    const-string v3, "ۛۢۨ"
    const/4 v4, 0x4
    invoke-static {v3, v4}, Ll/ۡ۫;->۠ۢ᩶(Ljava/lang/Object;I)C
    move-result v4
    mul-int/lit16 v4, v4, 0x3c1
    const/4 v5, 0x5
    invoke-static {v3, v5}, Ll/ܽ᩵;->ᩳ᩹֨(Ljava/lang/Object;I)C
    move-result v5
    :addr_017b
    mul-int/lit8 v5, v5, 0x1f
    add-int/2addr v4, v5
    xor-int/2addr v4, v1
    :addr_017f
    const/4 v5, 0x5
    invoke-static {v3, v5}, Ll/ܽ᩵;->ᩳ᩹֨(Ljava/lang/Object;I)C
    move-result v3
    :addr_0184
    add-int/2addr v3, v4
    goto/16 :addr_000c
    nop
    :addr_0188
    .sparse-switch
        1311041 -> :addr_002c
        1728804 -> :addr_0077
        1741007 -> :addr_013e
        1767334 -> :addr_0039
        1768133 -> :addr_0145
        1815970 -> :addr_0114
        1820707 -> :addr_0031
        1836377 -> :addr_006a
        1843648 -> :addr_0094
        1912699 -> :addr_0053
        1988909 -> :addr_00ad
        6568919 -> :addr_000e
        11880301 -> :addr_00cc
        12180171 -> :addr_00f0
        14220396 -> :addr_00da
        14308342 -> :addr_0017
        14824936 -> :addr_0024
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
    const/4 v4, 0x4
    const/4 v5, 0x5
    const/4 v6, 0x6
    const/4 v7, 0x7
    const/4 v8, -0x8
    const/4 v9, -0x7
    const/4 v10, -0x6
    const/4 v11, -0x5
    const/4 v12, -0x4
    const/4 v13, -0x3
    const/4 v14, -0x2
    const/4 v15, -0x1
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
    const/4 v2, 0x2
    invoke-static {v1, v2}, Ll/ܽ᩵;->ᩳ᩹֨(Ljava/lang/Object;I)C
    move-result v2
    xor-int v2, v2, v33
    const/4 v3, 0x3
    invoke-static {v1, v3}, Ll/ۡ۫;->۠ۢ᩶(Ljava/lang/Object;I)C
    move-result v3
    mul-int v2, v2, v3
    const/4 v3, 0x3
    invoke-static {v1, v3}, Ll/ܽ᩵;->ᩳ᩹֨(Ljava/lang/Object;I)C
    move-result v1
    sub-int/2addr v2, v1
    move-object v8, v7
    const/4 v1, 0x1
    const/4 v3, 0x3
    const/4 v4, 0x4
    const/4 v5, 0x5
    const/4 v6, 0x6
    const/4 v7, 0x7
    const/4 v9, -0x7
    const/4 v10, -0x6
    const/4 v11, -0x5
    const/4 v12, -0x4
    const/4 v13, -0x3
    const/4 v14, -0x2
    const/4 v15, -0x1
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
    :addr_0078
    sparse-switch v2, :addr_0828
    move-object/from16 v36, v3
    move/from16 v35, v6
    move/from16 v37, v11
    if-eqz v17, :addr_0330
    const-string/jumbo v2, "᩻ۡ᩵"
    const/4 v3, 0x3
    invoke-static {v2, v3}, Ll/ۡ۫;->۠ۢ᩶(Ljava/lang/Object;I)C
    move-result v3
    const/4 v6, 0x6
    invoke-static {v2, v6}, Ll/ܽ᩵;->ᩳ᩹֨(Ljava/lang/Object;I)C
    move-result v6
    mul-int v3, v3, v6
    xor-int v3, v3, v33
    goto/16 :addr_02cc
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
    goto/16 :addr_07a2
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
    goto/16 :addr_0330
    move-object/from16 v36, v3
    move/from16 v37, v11
    goto/16 :addr_0330
    move/from16 v35, v6
    move/from16 v37, v11
    goto/16 :addr_07a0
    move-object/from16 v36, v3
    move/from16 v35, v6
    move/from16 v37, v11
    if-nez v31, :addr_0330
    const-string/jumbo v2, "᩻ᩳ᩺"
    const/4 v3, 0x3
    invoke-static {v2, v3}, Ll/ܽ᩵;->ᩳ᩹֨(Ljava/lang/Object;I)C
    move-result v3
    xor-int v3, v3, v32
    goto/16 :addr_02a4
    move-object/from16 v36, v3
    move/from16 v35, v6
    move/from16 v37, v11
    if-nez v30, :addr_0330
    const-string v2, "۬ۚ᩸"
    const/4 v3, 0x3
    invoke-static {v2, v3}, Ll/ۡ۫;->۠ۢ᩶(Ljava/lang/Object;I)C
    move-result v3
    mul-int/lit16 v3, v3, 0x3c1
    const/4 v6, 0x6
    invoke-static {v2, v6}, Ll/ܽ᩵;->ᩳ᩹֨(Ljava/lang/Object;I)C
    move-result v6
    mul-int/lit8 v6, v6, 0x1f
    add-int/2addr v3, v6
    xor-int v3, v3, v32
    goto/16 :addr_0324
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
    goto/16 :addr_0330
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
    goto/16 :addr_0330
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
    goto/16 :addr_0330
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
    goto/16 :addr_0330
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
    goto/16 :addr_0330
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
    const/4 v3, 0x3
    invoke-static {v2, v3}, Ll/ܽ᩵;->ᩳ᩹֨(Ljava/lang/Object;I)C
    move-result v3
    xor-int v3, v3, v33
    const/4 v6, 0x6
    invoke-static {v2, v6}, Ll/ۡ۫;->۠ۢ᩶(Ljava/lang/Object;I)C
    move-result v6
    mul-int v3, v3, v6
    const/4 v6, 0x6
    invoke-static {v2, v6}, Ll/ۡ۫;->۠ۢ᩶(Ljava/lang/Object;I)C
    move-result v2
    goto/16 :addr_02b0
    move-object/from16 v36, v3
    move/from16 v35, v6
    move/from16 v37, v11
    :try_start_01bb
    .line 110
    invoke-virtual {v1}, Landroid/content/Intent;->getExtras()Landroid/os/Bundle;
    move-result-object v2
    invoke-static {v0, v2, v9}, Lbin/mt/plus/Main;->ۖ(Landroid/app/Activity;Landroid/os/Bundle;Z)V
    goto/16 :addr_0330
    move-object/from16 v36, v3
    move/from16 v35, v6
    move/from16 v37, v11
    .line 87
    invoke-static {v4}, Ll/ۤۚ;->۟ܶۙ(Ljava/lang/Object;)Z
    move-result v30
    :try_end_01bb
    :try_end_01bb
    const-string v2, "᩷ۘܿ"
    const/4 v3, 0x3
    invoke-static {v2, v3}, Ll/ܽ᩵;->ᩳ᩹֨(Ljava/lang/Object;I)C
    move-result v3
    const/4 v6, 0x6
    invoke-static {v2, v6}, Ll/ܽ᩵;->ᩳ᩹֨(Ljava/lang/Object;I)C
    move-result v6
    goto/16 :addr_02c8
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
    goto/16 :addr_0330
    move-object/from16 v36, v3
    move/from16 v35, v6
    move/from16 v37, v11
    if-eqz v29, :addr_0330
    const-string v2, "᩸ۢ۫"
    const/4 v3, 0x3
    invoke-static {v2, v3}, Ll/ܽ᩵;->ᩳ᩹֨(Ljava/lang/Object;I)C
    move-result v3
    xor-int v3, v3, v33
    goto/16 :addr_0264
    move-object/from16 v36, v3
    move/from16 v35, v6
    move/from16 v37, v11
    if-eqz v28, :addr_0330
    const-string v2, "ۨ᩻ᩳ"
    const/4 v3, 0x3
    invoke-static {v2, v3}, Ll/ۡ۫;->۠ۢ᩶(Ljava/lang/Object;I)C
    move-result v3
    goto/16 :addr_02dd
    move-object/from16 v36, v3
    move/from16 v35, v6
    move/from16 v37, v11
    if-eqz v27, :addr_0330
    goto/16 :addr_02d6
    move-object/from16 v36, v3
    move/from16 v35, v6
    move/from16 v37, v11
    if-nez v26, :addr_029a
    goto/16 :addr_0330
    move-object/from16 v36, v3
    move/from16 v35, v6
    move/from16 v37, v11
    if-eqz v25, :addr_0330
    const-string v2, "ۨ֡ᩴ"
    goto/16 :addr_029d
    move-object/from16 v36, v3
    move/from16 v35, v6
    move/from16 v37, v11
    if-nez v24, :addr_029a
    goto/16 :addr_0330
    move-object/from16 v36, v3
    move/from16 v35, v6
    move/from16 v37, v11
    if-nez v23, :addr_029a
    goto/16 :addr_0330
    move-object/from16 v36, v3
    move/from16 v35, v6
    move/from16 v37, v11
    if-eqz v22, :addr_0330
    goto/16 :addr_02bc
    move-object/from16 v36, v3
    move/from16 v35, v6
    move/from16 v37, v11
    if-eqz v21, :addr_0330
    const-string v2, "۠ۤܽ"
    const/4 v3, 0x3
    invoke-static {v2, v3}, Ll/ۡ۫;->۠ۢ᩶(Ljava/lang/Object;I)C
    move-result v3
    xor-int v3, v3, v32
    :addr_0264
    const/4 v6, 0x6
    invoke-static {v2, v6}, Ll/ܽ᩵;->ᩳ᩹֨(Ljava/lang/Object;I)C
    move-result v6
    goto :addr_02a9
    move-object/from16 v36, v3
    move/from16 v35, v6
    move/from16 v37, v11
    if-eqz v20, :addr_0330
    goto :addr_02bc
    move-object/from16 v36, v3
    move/from16 v35, v6
    move/from16 v37, v11
    if-nez v19, :addr_029a
    goto/16 :addr_0330
    move-object/from16 v36, v3
    move/from16 v35, v6
    move/from16 v37, v11
    if-nez v18, :addr_029a
    goto/16 :addr_0330
    move-object/from16 v36, v3
    move/from16 v35, v6
    move/from16 v37, v11
    if-eqz v16, :addr_0330
    goto :addr_02bc
    move-object/from16 v36, v3
    move/from16 v35, v6
    move/from16 v37, v11
    if-nez v15, :addr_029a
    goto/16 :addr_0330
    :addr_029a
    const-string/jumbo v2, "᩹᩵ᩴ"
    :addr_029d
    const/4 v3, 0x3
    invoke-static {v2, v3}, Ll/ۡ۫;->۠ۢ᩶(Ljava/lang/Object;I)C
    move-result v3
    xor-int v3, v3, v33
    :addr_02a4
    const/4 v6, 0x6
    invoke-static {v2, v6}, Ll/ۡ۫;->۠ۢ᩶(Ljava/lang/Object;I)C
    move-result v6
    :addr_02a9
    mul-int v3, v3, v6
    const/4 v6, 0x6
    invoke-static {v2, v6}, Ll/ܽ᩵;->ᩳ᩹֨(Ljava/lang/Object;I)C
    move-result v2
    :addr_02b0
    sub-int v2, v3, v2
    goto/16 :addr_032a
    move-object/from16 v36, v3
    move/from16 v35, v6
    move/from16 v37, v11
    if-eqz v14, :addr_0330
    :addr_02bc
    const-string v2, "ۧۧܳ"
    const/4 v3, 0x3
    invoke-static {v2, v3}, Ll/ܽ᩵;->ᩳ᩹֨(Ljava/lang/Object;I)C
    move-result v3
    const/4 v6, 0x6
    invoke-static {v2, v6}, Ll/ۡ۫;->۠ۢ᩶(Ljava/lang/Object;I)C
    move-result v6
    :addr_02c8
    mul-int v3, v3, v6
    xor-int v3, v3, v32
    :addr_02cc
    const/4 v6, 0x6
    goto :addr_0304
    move-object/from16 v36, v3
    move/from16 v35, v6
    move/from16 v37, v11
    if-eqz v13, :addr_0330
    :addr_02d6
    const-string v2, "֨ۚ۟"
    const/4 v3, 0x3
    invoke-static {v2, v3}, Ll/ܽ᩵;->ᩳ᩹֨(Ljava/lang/Object;I)C
    move-result v3
    :addr_02dd
    const/4 v6, 0x6
    invoke-static {v2, v6}, Ll/ۡ۫;->۠ۢ᩶(Ljava/lang/Object;I)C
    move-result v6
    mul-int v3, v3, v6
    xor-int v3, v3, v32
    const/4 v6, 0x6
    goto :addr_0325
    move-object/from16 v36, v3
    move/from16 v35, v6
    move/from16 v37, v11
    if-eqz v12, :addr_0330
    const-string v2, "֫ܶܿ"
    const/4 v3, 0x3
    invoke-static {v2, v3}, Ll/ܽ᩵;->ᩳ᩹֨(Ljava/lang/Object;I)C
    move-result v3
    mul-int/lit16 v3, v3, 0x3c1
    const/4 v6, 0x6
    invoke-static {v2, v6}, Ll/ۡ۫;->۠ۢ᩶(Ljava/lang/Object;I)C
    move-result v6
    mul-int/lit8 v6, v6, 0x1f
    add-int/2addr v3, v6
    xor-int v3, v3, v33
    const/4 v6, 0x6
    :addr_0304
    invoke-static {v2, v6}, Ll/ۡ۫;->۠ۢ᩶(Ljava/lang/Object;I)C
    move-result v2
    goto :addr_0329
    move-object/from16 v36, v3
    move/from16 v35, v6
    move/from16 v37, v11
    if-eqz v37, :addr_0330
    const-string v2, "֨ܰۗ"
    const/4 v3, 0x3
    invoke-static {v2, v3}, Ll/ܽ᩵;->ᩳ᩹֨(Ljava/lang/Object;I)C
    move-result v3
    mul-int/lit16 v3, v3, 0x3c1
    const/4 v6, 0x6
    invoke-static {v2, v6}, Ll/ܽ᩵;->ᩳ᩹֨(Ljava/lang/Object;I)C
    move-result v6
    mul-int/lit8 v6, v6, 0x1f
    add-int/2addr v3, v6
    xor-int v3, v3, v33
    :addr_0324
    const/4 v6, 0x6
    :addr_0325
    invoke-static {v2, v6}, Ll/ܽ᩵;->ᩳ᩹֨(Ljava/lang/Object;I)C
    move-result v2
    :addr_0329
    add-int/2addr v2, v3
    :addr_032a
    move/from16 v6, v35
    move-object/from16 v3, v36
    goto/16 :addr_0824
    :addr_0330
    move-object/from16 v3, v36
    goto/16 :addr_07a0
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
    goto/16 :addr_054c
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
    goto/16 :addr_03f1
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
    goto/16 :addr_04cc
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
    const/4 v6, 0x6
    invoke-static {v2, v6}, Ll/ܽ᩵;->ᩳ᩹֨(Ljava/lang/Object;I)C
    move-result v6
    goto/16 :addr_0515
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
    const/4 v6, 0x6
    invoke-static {v2, v6}, Ll/ۡ۫;->۠ۢ᩶(Ljava/lang/Object;I)C
    move-result v6
    xor-int v6, v6, v32
    const/4 v11, -0x5
    invoke-static {v2, v11}, Ll/ܽ᩵;->ᩳ᩹֨(Ljava/lang/Object;I)C
    move-result v11
    mul-int v6, v6, v11
    const/4 v11, -0x5
    invoke-static {v2, v11}, Ll/ۡ۫;->۠ۢ᩶(Ljava/lang/Object;I)C
    move-result v2
    goto/16 :addr_04b5
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
    const/4 v6, 0x6
    invoke-static {v2, v6}, Ll/ܽ᩵;->ᩳ᩹֨(Ljava/lang/Object;I)C
    move-result v6
    xor-int v6, v6, v32
    goto/16 :addr_04a9
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
    :addr_03f1
    invoke-static {v2}, Ll/ۤ֨;->۬ۚᩴ(Ljava/lang/Object;)I
    move-result v2
    xor-int v2, v2, v33
    goto/16 :addr_0749
    move/from16 v35, v6
    move/from16 v37, v11
    :try_start_03fd
    sget-object v2, Lbin/mt/plus/ShortcutActivity;->۠ܶۧ:[S
    const/16 v6, 0xf4
    const/4 v11, -0x5
    invoke-static {v2, v6, v11, v5}, Ll/ۤ֨;->ۜۢۢ([SIII)Ljava/lang/String;
    move-result-object v2
    invoke-static {v3, v2}, Ll/ܽۘ;->۫᩺ᩳ(Ljava/lang/Object;Ljava/lang/Object;)Z
    move-result v22
    const-string v2, "᩵֨ܶ"
    goto :addr_0445
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
    const/4 v6, 0x6
    invoke-static {v2, v6}, Ll/ۡ۫;->۠ۢ᩶(Ljava/lang/Object;I)C
    move-result v6
    const/4 v11, -0x5
    invoke-static {v2, v11}, Ll/ܽ᩵;->ᩳ᩹֨(Ljava/lang/Object;I)C
    move-result v11
    mul-int v6, v6, v11
    xor-int v6, v6, v33
    goto/16 :addr_055a
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
    :addr_0445
    const/4 v6, 0x6
    invoke-static {v2, v6}, Ll/ۡ۫;->۠ۢ᩶(Ljava/lang/Object;I)C
    move-result v6
    mul-int/lit16 v6, v6, 0x3c1
    const/4 v11, -0x5
    invoke-static {v2, v11}, Ll/ۡ۫;->۠ۢ᩶(Ljava/lang/Object;I)C
    move-result v11
    mul-int/lit8 v11, v11, 0x1f
    add-int/2addr v6, v11
    xor-int v6, v6, v32
    const/4 v11, -0x5
    goto/16 :addr_055b
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
    const/4 v6, 0x6
    invoke-static {v2, v6}, Ll/ۡ۫;->۠ۢ᩶(Ljava/lang/Object;I)C
    move-result v6
    const/4 v11, -0x5
    invoke-static {v2, v11}, Ll/ܽ᩵;->ᩳ᩹֨(Ljava/lang/Object;I)C
    move-result v11
    goto/16 :addr_051a
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
    goto :addr_04cc
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
    const/4 v6, 0x6
    invoke-static {v2, v6}, Ll/ܽ᩵;->ᩳ᩹֨(Ljava/lang/Object;I)C
    move-result v6
    xor-int v6, v6, v33
    :addr_04a9
    const/4 v11, -0x5
    invoke-static {v2, v11}, Ll/ܽ᩵;->ᩳ᩹֨(Ljava/lang/Object;I)C
    move-result v11
    mul-int v6, v6, v11
    const/4 v11, -0x5
    invoke-static {v2, v11}, Ll/ܽ᩵;->ᩳ᩹֨(Ljava/lang/Object;I)C
    move-result v2
    :addr_04b5
    sub-int v2, v6, v2
    goto/16 :addr_0749
    move/from16 v35, v6
    move/from16 v37, v11
    :try_start_04bd
    .line 115
    sget-object v2, Lbin/mt/plus/ShortcutActivity;->۠ܶۧ:[S
    const/16 v6, 0x9b
    const/4 v11, -0x5
    invoke-static {v2, v6, v11, v5}, Ll/᩻᩷;->ۧۧ᩹([SIII)Ljava/lang/String;
    move-result-object v2
    .line 77
    invoke-static {v3, v2}, Ll/ܽۘ;->۫᩺ᩳ(Ljava/lang/Object;Ljava/lang/Object;)Z
    move-result v16
    :try_end_04bd
    :try_end_04bd
    const-string v2, "ۨۚۘ"
    :addr_04cc
    invoke-static {v2}, Ll/ۤ֨;->۬ۚᩴ(Ljava/lang/Object;)I
    move-result v2
    xor-int v2, v2, v32
    goto/16 :addr_0749
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
    const/4 v6, 0x6
    invoke-static {v2, v6}, Ll/ܽ᩵;->ᩳ᩹֨(Ljava/lang/Object;I)C
    move-result v6
    mul-int/lit16 v6, v6, 0x3c1
    const/4 v11, -0x5
    invoke-static {v2, v11}, Ll/ۡ۫;->۠ۢ᩶(Ljava/lang/Object;I)C
    move-result v11
    mul-int/lit8 v11, v11, 0x1f
    add-int/2addr v6, v11
    xor-int v6, v6, v33
    const/4 v11, -0x5
    goto :addr_051f
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
    const/4 v6, 0x6
    invoke-static {v2, v6}, Ll/ۡ۫;->۠ۢ᩶(Ljava/lang/Object;I)C
    move-result v6
    :addr_0515
    const/4 v11, -0x5
    invoke-static {v2, v11}, Ll/ۡ۫;->۠ۢ᩶(Ljava/lang/Object;I)C
    move-result v11
    :addr_051a
    mul-int v6, v6, v11
    xor-int v6, v6, v33
    const/4 v11, -0x5
    :addr_051f
    invoke-static {v2, v11}, Ll/ۡ۫;->۠ۢ᩶(Ljava/lang/Object;I)C
    move-result v2
    goto :addr_055f
    move/from16 v35, v6
    move/from16 v37, v11
    :try_start_0528
    .line 83
    sget-object v2, Lbin/mt/plus/ShortcutActivity;->۠ܶۧ:[S
    const/16 v6, 0x77
    const/4 v11, -0x5
    invoke-static {v2, v6, v11, v5}, Ll/֫;->ܺ۠ᩳ([SIII)Ljava/lang/String;
    move-result-object v2
    .line 77
    invoke-static {v3, v2}, Ll/ܽۘ;->۫᩺ᩳ(Ljava/lang/Object;Ljava/lang/Object;)Z
    move-result v13
    const-string v2, "֨᩵ܳ"
    goto :addr_054c
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
    :addr_054c
    const/4 v6, 0x6
    invoke-static {v2, v6}, Ll/ܽ᩵;->ᩳ᩹֨(Ljava/lang/Object;I)C
    move-result v6
    const/4 v11, -0x5
    invoke-static {v2, v11}, Ll/ܽ᩵;->ᩳ᩹֨(Ljava/lang/Object;I)C
    move-result v11
    mul-int v6, v6, v11
    xor-int v6, v6, v32
    :addr_055a
    const/4 v11, -0x5
    :addr_055b
    invoke-static {v2, v11}, Ll/ܽ᩵;->ᩳ᩹֨(Ljava/lang/Object;I)C
    move-result v2
    :addr_055f
    add-int/2addr v2, v6
    goto/16 :addr_0749
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
    const/4 v6, 0x6
    invoke-static {v2, v6}, Ll/ܽ᩵;->ᩳ᩹֨(Ljava/lang/Object;I)C
    move-result v6
    mul-int/lit16 v6, v6, 0x3c1
    const/4 v0, 0x0
    invoke-static {v2, v0}, Ll/ۡ۫;->۠ۢ᩶(Ljava/lang/Object;I)C
    move-result v0
    mul-int/lit8 v0, v0, 0x1f
    add-int/2addr v6, v0
    xor-int v0, v6, v33
    const/4 v6, 0x6
    invoke-static {v2, v6}, Ll/ۡ۫;->۠ۢ᩶(Ljava/lang/Object;I)C
    move-result v2
    add-int/2addr v2, v0
    move-object/from16 v0, v39
    move/from16 v6, v35
    goto/16 :addr_0078
    return-void
    move/from16 v35, v6
    move/from16 v37, v11
    const/high16 v6, 0x400
    const-class v0, Ll/᩶֨۟;
    const/4 v2, 0x2
    const/high16 v11, 0x1000
    sparse-switch v35, :addr_0922
    goto/16 :addr_07a0
    const-string v2, "۫᩷ܰ"
    const/4 v7, 0x7
    invoke-static {v2, v7}, Ll/ۡ۫;->۠ۢ᩶(Ljava/lang/Object;I)C
    move-result v7
    mul-int/lit16 v7, v7, 0x3c1
    const/4 v8, -0x8
    invoke-static {v2, v8}, Ll/ܽ᩵;->ᩳ᩹֨(Ljava/lang/Object;I)C
    move-result v8
    mul-int/lit8 v8, v8, 0x1f
    add-int/2addr v7, v8
    xor-int v7, v7, v33
    const/4 v8, -0x8
    invoke-static {v2, v8}, Ll/ܽ᩵;->ᩳ᩹֨(Ljava/lang/Object;I)C
    move-result v2
    add-int/2addr v2, v7
    const/high16 v7, 0x400
    const/high16 v10, 0x1000
    move-object v8, v0
    move/from16 v6, v35
    move/from16 v11, v37
    goto/16 :addr_06cc
    const-string v0, "ۢۨۧ"
    invoke-static {v0}, Ll/ۤ֨;->۬ۚᩴ(Ljava/lang/Object;)I
    move-result v0
    xor-int v2, v0, v32
    goto/16 :addr_06e7
    const-string v0, "۟᩵ܰ"
    const/4 v6, 0x6
    invoke-static {v0, v6}, Ll/ܽ᩵;->ᩳ᩹֨(Ljava/lang/Object;I)C
    move-result v6
    mul-int/lit16 v6, v6, 0x3c1
    const/4 v9, -0x7
    invoke-static {v0, v9}, Ll/ܽ᩵;->ᩳ᩹֨(Ljava/lang/Object;I)C
    move-result v9
    mul-int/lit8 v9, v9, 0x1f
    add-int/2addr v6, v9
    xor-int v6, v6, v32
    const/4 v9, -0x7
    invoke-static {v0, v9}, Ll/ۡ۫;->۠ۢ᩶(Ljava/lang/Object;I)C
    move-result v0
    goto/16 :addr_06a3
    const-string v0, "֨֡᩵"
    goto/16 :addr_06f3
    const-string v0, "ܰ᩸᩷"
    invoke-static {v0}, Ll/ۤ֨;->۬ۚᩴ(Ljava/lang/Object;)I
    move-result v0
    xor-int v2, v0, v33
    goto/16 :addr_06e7
    const-string v0, "۠ܿ۫"
    goto :addr_0659
    const-string v0, "۠ᩴ֡"
    invoke-static {v0}, Ll/ۤ֨;->۬ۚᩴ(Ljava/lang/Object;)I
    move-result v0
    goto :addr_065d
    const-string v0, "᩵֫ܺ"
    const/4 v6, 0x6
    invoke-static {v0, v6}, Ll/ۡ۫;->۠ۢ᩶(Ljava/lang/Object;I)C
    move-result v6
    xor-int v6, v6, v33
    goto :addr_062f
    const-string v0, "ۨ۬ۖ"
    const/4 v2, 0x2
    invoke-static {v0, v2}, Ll/ۡ۫;->۠ۢ᩶(Ljava/lang/Object;I)C
    move-result v2
    const/4 v6, 0x6
    invoke-static {v0, v6}, Ll/ۡ۫;->۠ۢ᩶(Ljava/lang/Object;I)C
    move-result v6
    mul-int v2, v2, v6
    xor-int v2, v2, v33
    const/4 v6, 0x6
    invoke-static {v0, v6}, Ll/ܽ᩵;->ᩳ᩹֨(Ljava/lang/Object;I)C
    move-result v0
    add-int/2addr v2, v0
    goto/16 :addr_06e7
    const-string v0, "ۛᩳܺ"
    const/4 v6, 0x6
    invoke-static {v0, v6}, Ll/ۡ۫;->۠ۢ᩶(Ljava/lang/Object;I)C
    move-result v6
    xor-int v6, v6, v32
    :addr_062f
    const/4 v9, -0x7
    invoke-static {v0, v9}, Ll/ܽ᩵;->ᩳ᩹֨(Ljava/lang/Object;I)C
    move-result v9
    mul-int v6, v6, v9
    const/4 v9, -0x7
    invoke-static {v0, v9}, Ll/ܽ᩵;->ᩳ᩹֨(Ljava/lang/Object;I)C
    move-result v0
    sub-int v0, v6, v0
    goto :addr_06a4
    const-string/jumbo v0, "᩹۟᩹"
    const/4 v2, 0x2
    invoke-static {v0, v2}, Ll/ܽ᩵;->ᩳ᩹֨(Ljava/lang/Object;I)C
    move-result v2
    const/4 v6, 0x6
    invoke-static {v0, v6}, Ll/ۡ۫;->۠ۢ᩶(Ljava/lang/Object;I)C
    move-result v6
    mul-int v2, v2, v6
    xor-int v2, v2, v33
    const/4 v6, 0x6
    invoke-static {v0, v6}, Ll/ۡ۫;->۠ۢ᩶(Ljava/lang/Object;I)C
    move-result v0
    add-int/2addr v2, v0
    goto/16 :addr_0747
    const-string v0, "ܿ᩵ۨ"
    :addr_0659
    invoke-static {v0}, Ll/ۙۘ;->ۙᩴ۫(Ljava/lang/Object;)I
    move-result v0
    :addr_065d
    xor-int v2, v0, v32
    goto/16 :addr_0747
    const-string/jumbo v0, "᩻ۖۖ"
    const/4 v2, 0x2
    invoke-static {v0, v2}, Ll/ۡ۫;->۠ۢ᩶(Ljava/lang/Object;I)C
    move-result v2
    xor-int v2, v2, v32
    const/4 v6, 0x6
    invoke-static {v0, v6}, Ll/ۡ۫;->۠ۢ᩶(Ljava/lang/Object;I)C
    move-result v6
    goto/16 :addr_06df
    const-string/jumbo v0, "᩻ۜܳ"
    invoke-static {v0}, Ll/ۙۘ;->ۙᩴ۫(Ljava/lang/Object;)I
    move-result v0
    goto :addr_068b
    const-string v0, "ܽ۬ܰ"
    const/4 v2, 0x2
    invoke-static {v0, v2}, Ll/ܽ᩵;->ᩳ᩹֨(Ljava/lang/Object;I)C
    move-result v2
    xor-int v2, v2, v32
    goto/16 :addr_06fa
    const-string v0, "᩸ܿۗ"
    invoke-static {v0}, Ll/ۤ֨;->۬ۚᩴ(Ljava/lang/Object;)I
    move-result v0
    :addr_068b
    xor-int v0, v0, v33
    goto :addr_06a4
    const-string v0, "ۧۜܿ"
    const/4 v6, 0x6
    invoke-static {v0, v6}, Ll/ܽ᩵;->ᩳ᩹֨(Ljava/lang/Object;I)C
    move-result v6
    const/4 v9, -0x7
    invoke-static {v0, v9}, Ll/ܽ᩵;->ᩳ᩹֨(Ljava/lang/Object;I)C
    move-result v9
    mul-int v6, v6, v9
    xor-int v6, v6, v32
    const/4 v9, -0x7
    invoke-static {v0, v9}, Ll/ܽ᩵;->ᩳ᩹֨(Ljava/lang/Object;I)C
    move-result v0
    :addr_06a3
    add-int/2addr v0, v6
    :addr_06a4
    move v2, v0
    move/from16 v6, v35
    move/from16 v11, v37
    const/4 v9, -0x7
    goto :addr_06cc
    const-string v7, "ۛܳۚ"
    const/4 v8, -0x8
    invoke-static {v7, v8}, Ll/ܽ᩵;->ᩳ᩹֨(Ljava/lang/Object;I)C
    move-result v8
    const/4 v9, -0x7
    invoke-static {v7, v9}, Ll/ۡ۫;->۠ۢ᩶(Ljava/lang/Object;I)C
    move-result v9
    mul-int v8, v8, v9
    xor-int v8, v8, v33
    const/4 v9, -0x7
    invoke-static {v7, v9}, Ll/ܽ᩵;->ᩳ᩹֨(Ljava/lang/Object;I)C
    move-result v7
    add-int/2addr v7, v8
    move-object v8, v0
    move v2, v7
    move/from16 v6, v35
    move/from16 v11, v37
    const/high16 v7, 0x400
    const/4 v9, -0x7
    const/high16 v10, 0x1000
    :addr_06cc
    move-object/from16 v0, v39
    goto/16 :addr_0078
    const-string/jumbo v0, "᩻ۘܺ"
    const/4 v2, 0x2
    invoke-static {v0, v2}, Ll/ܽ᩵;->ᩳ᩹֨(Ljava/lang/Object;I)C
    move-result v2
    xor-int v2, v2, v32
    const/4 v6, 0x6
    invoke-static {v0, v6}, Ll/ܽ᩵;->ᩳ᩹֨(Ljava/lang/Object;I)C
    move-result v6
    :addr_06df
    mul-int v2, v2, v6
    const/4 v6, 0x6
    invoke-static {v0, v6}, Ll/ܽ᩵;->ᩳ᩹֨(Ljava/lang/Object;I)C
    move-result v0
    sub-int/2addr v2, v0
    :addr_06e7
    const/high16 v10, 0x1000
    goto :addr_0747
    move/from16 v35, v6
    move/from16 v37, v11
    :try_start_06ee
    .line 74
    invoke-static/range {v39 .. v39}, Ll/ۤۙ;->۫ۤܽ(Ljava/lang/Object;)V
    :try_end_06ee
    :try_end_06ee
    const-string v0, "ۧۛ᩹"
    :addr_06f3
    const/4 v2, 0x2
    invoke-static {v0, v2}, Ll/ܽ᩵;->ᩳ᩹֨(Ljava/lang/Object;I)C
    move-result v2
    xor-int v2, v2, v33
    :addr_06fa
    const/4 v6, 0x6
    invoke-static {v0, v6}, Ll/ܽ᩵;->ᩳ᩹֨(Ljava/lang/Object;I)C
    move-result v6
    goto :addr_073f
    move/from16 v35, v6
    move/from16 v37, v11
    :try_start_0704
    .line 77
    invoke-static {v3}, Ll/ۤ֨;->۬ۚᩴ(Ljava/lang/Object;)I
    move-result v6
    :try_end_0704
    :try_end_0704
    const-string v0, "ۡ۫ۖ"
    const/4 v2, 0x2
    invoke-static {v0, v2}, Ll/ܽ᩵;->ᩳ᩹֨(Ljava/lang/Object;I)C
    move-result v2
    const/4 v11, -0x5
    invoke-static {v0, v11}, Ll/ۡ۫;->۠ۢ᩶(Ljava/lang/Object;I)C
    move-result v11
    mul-int v2, v2, v11
    xor-int v2, v2, v32
    const/4 v11, -0x5
    invoke-static {v0, v11}, Ll/ܽ᩵;->ᩳ᩹֨(Ljava/lang/Object;I)C
    move-result v0
    add-int/2addr v2, v0
    move-object/from16 v0, v39
    goto/16 :addr_0824
    move/from16 v35, v6
    move/from16 v37, v11
    if-eqz v34, :addr_0731
    const-string v0, "᩶᩺֫"
    invoke-static {v0}, Ll/ۤ֨;->۬ۚᩴ(Ljava/lang/Object;)I
    move-result v0
    xor-int v2, v0, v33
    goto :addr_0747
    :addr_0731
    const-string v0, "ᩴܽۨ"
    const/4 v2, 0x2
    invoke-static {v0, v2}, Ll/ܽ᩵;->ᩳ᩹֨(Ljava/lang/Object;I)C
    move-result v2
    xor-int v2, v2, v33
    const/4 v6, 0x6
    invoke-static {v0, v6}, Ll/ۡ۫;->۠ۢ᩶(Ljava/lang/Object;I)C
    move-result v6
    :addr_073f
    mul-int v2, v2, v6
    const/4 v6, 0x6
    invoke-static {v0, v6}, Ll/ܽ᩵;->ᩳ᩹֨(Ljava/lang/Object;I)C
    move-result v0
    sub-int/2addr v2, v0
    :addr_0747
    move-object/from16 v0, v39
    :addr_0749
    move/from16 v6, v35
    goto/16 :addr_0824
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
    const/4 v1, 0x1
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
    const/4 v4, 0x4
    invoke-static {v3, v4}, Ll/ۡ۫;->۠ۢ᩶(Ljava/lang/Object;I)C
    move-result v4
    xor-int v4, v4, v32
    const/4 v6, 0x6
    invoke-static {v3, v6}, Ll/ܽ᩵;->ᩳ᩹֨(Ljava/lang/Object;I)C
    move-result v6
    mul-int v4, v4, v6
    const/4 v6, 0x6
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
    goto/16 :addr_0078
    :addr_07a0
    move-object/from16 v36, v1
    :addr_07a2
    const-string v0, "۫᩵ܳ"
    invoke-static {v0}, Ll/ۙۘ;->ۙᩴ۫(Ljava/lang/Object;)I
    move-result v0
    xor-int v2, v0, v32
    goto/16 :addr_081e
    move-object/from16 v36, v1
    move/from16 v35, v6
    move/from16 v37, v11
    .line 68
    invoke-super/range {v39 .. v40}, Ll/᩻᩻ۖ;->onCreate(Landroid/os/Bundle;)V
    const-string v0, "ᩴܶۚ"
    goto :addr_0800
    move-object/from16 v36, v1
    move/from16 v35, v6
    move/from16 v37, v11
    const v0, 0x82cb
    const v5, 0x82cb
    goto :addr_07d1
    move-object/from16 v36, v1
    move/from16 v35, v6
    move/from16 v37, v11
    const v0, 0xd772
    const v5, 0xd772
    :addr_07d1
    const-string v0, "ۨۧۚ"
    const/4 v1, 0x1
    invoke-static {v0, v1}, Ll/ۡ۫;->۠ۢ᩶(Ljava/lang/Object;I)C
    move-result v1
    const/4 v2, 0x2
    invoke-static {v0, v2}, Ll/ۡ۫;->۠ۢ᩶(Ljava/lang/Object;I)C
    move-result v2
    mul-int v1, v1, v2
    xor-int v1, v1, v32
    const/4 v2, 0x2
    invoke-static {v0, v2}, Ll/ܽ᩵;->ᩳ᩹֨(Ljava/lang/Object;I)C
    move-result v0
    goto :addr_081c
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
    if-lez v1, :addr_0807
    const-string v0, "ܶ᩺ܳ"
    :addr_0800
    invoke-static {v0}, Ll/ۙۘ;->ۙᩴ۫(Ljava/lang/Object;)I
    move-result v0
    xor-int v2, v0, v33
    goto :addr_081e
    :addr_0807
    const-string v0, "۟᩵ᩴ"
    const/4 v1, 0x1
    invoke-static {v0, v1}, Ll/ۡ۫;->۠ۢ᩶(Ljava/lang/Object;I)C
    move-result v1
    const/4 v2, 0x2
    invoke-static {v0, v2}, Ll/ܽ᩵;->ᩳ᩹֨(Ljava/lang/Object;I)C
    move-result v2
    mul-int v1, v1, v2
    xor-int v1, v1, v32
    const/4 v2, 0x2
    invoke-static {v0, v2}, Ll/ۡ۫;->۠ۢ᩶(Ljava/lang/Object;I)C
    move-result v0
    :addr_081c
    add-int v2, v1, v0
    :addr_081e
    move-object/from16 v0, v39
    move/from16 v6, v35
    move-object/from16 v1, v36
    :addr_0824
    move/from16 v11, v37
    goto/16 :addr_0078
    :addr_0828
    .sparse-switch
        1445053 -> :addr_0164
        1458474 -> :addr_014c
        1745504 -> :addr_0291
        1749319 -> :addr_0218
        1751549 -> :addr_0347
        1752304 -> :addr_02d6
        1755063 -> :addr_020f
        1760195 -> :addr_019d
        1767995 -> :addr_002d
        1898507 -> :addr_02ed
        1899401 -> :addr_0205
        1902364 -> :addr_0364
        1915450 -> :addr_02bc
        1915928 -> :addr_06d5
        1987121 -> :addr_0740
        1988017 -> :addr_031e
        1990915 -> :addr_0401
        2537307 -> :addr_0179
        2783998 -> :addr_0075
        3078976 -> :addr_023c
        3088927 -> :addr_013d
        3099663 -> :addr_0734
        3099844 -> :addr_051c
        3102142 -> :addr_0395
        3130108 -> :addr_01fb
        3232715 -> :addr_04c0
        3257136 -> :addr_0089
        3261084 -> :addr_04ac
        3261819 -> :addr_011c
        4259107 -> :addr_00e6
        4283534 -> :addr_01b1
        4499097 -> :addr_045c
        6559314 -> :addr_01d1
        6564089 -> :addr_01f2
        6564934 -> :addr_06d9
        6577164 -> :addr_0441
        6577262 -> :addr_0483
        6578008 -> :addr_018c
        6721785 -> :addr_0672
        6730080 -> :addr_01c7
        9722339 -> :addr_0303
        9829660 -> :addr_03b9
        10260383 -> :addr_0110
        10397380 -> :addr_01bd
        11346322 -> :addr_076f
        11423946 -> :addr_051b
        11872420 -> :addr_00d1
        11926470 -> :addr_00fb
        11933042 -> :addr_03e1
        12483974 -> :addr_0256
        12514381 -> :addr_01db
        16098375 -> :addr_0416
        16111833 -> :addr_04ea
        16384539 -> :addr_06aa
        37969180 -> :addr_001e
        42709236 -> :addr_0688
        44204853 -> :addr_00a6
        45438207 -> :addr_0381
        45864820 -> :addr_074d
        45865746 -> :addr_01a7
        45904824 -> :addr_00bc
        45926780 -> :addr_0270
    .end sparse-switch
    :addr_0922
    .sparse-switch
        -2122614245 -> :addr_0131
        -1912197360 -> :addr_010c
        -1263242200 -> :addr_00ef
        -1212308659 -> :addr_00e6
        -1119104947 -> :addr_00db
        -1097461934 -> :addr_00d3
        -785778927 -> :addr_00c2
        -667500459 -> :addr_00b8
        -593404262 -> :addr_009f
        -560080238 -> :addr_0087
        -474293814 -> :addr_006f
        3178851 -> :addr_0065
        24954378 -> :addr_005e
        35253639 -> :addr_005b
        588746739 -> :addr_0051
        1041335639 -> :addr_004d
        1721154072 -> :addr_0033
        1841977966 -> :addr_0029
        2116182360 -> :addr_0005
    .end sparse-switch
.end method

