.class public LMain;
.super Ljava/lang/Object;
.source "Main.java"

.method public constructor <init>()V
    .registers 1
    .line 9
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V
    return-void
.end method

.method public static main([Ljava/lang/String;)V
    .registers 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "([",
            "Ljava/lang/String;",
            ")V"
        }
    .end annotation
    .line 7
    sget-object p0, Ljava/lang/System;->out:Ljava/io/PrintStream;
    const-string v0, "你好 World!"
    invoke-virtual {p0, v0}, Ljava/io/PrintStream;->println(Ljava/lang/String;)V
    .line 8
    new-instance p0, Ljava/io/File;
    const-string v0, "/storage/emulated/0/aaaaa.txt"
    invoke-direct {p0, v0}, Ljava/io/File;-><init>(Ljava/lang/String;)V
    invoke-virtual {p0}, Ljava/io/File;->delete()Z
    return-void
.end method
