IF OBJECT_ID(N'[__EFMigrationsHistory]') IS NULL
BEGIN
    CREATE TABLE [__EFMigrationsHistory] (
        [MigrationId] nvarchar(150) NOT NULL,
        [ProductVersion] nvarchar(32) NOT NULL,
        CONSTRAINT [PK___EFMigrationsHistory] PRIMARY KEY ([MigrationId])
    );
END;
GO

BEGIN TRANSACTION;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20230928102443_initial')
BEGIN
    CREATE TABLE [Categories] (
        [CategoryId] nvarchar(450) NOT NULL,
        [Name] nvarchar(max) NOT NULL,
        CONSTRAINT [PK_Categories] PRIMARY KEY ([CategoryId])
    );
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20230928102443_initial')
BEGIN
    CREATE TABLE [Statuss] (
        [StatusId] nvarchar(450) NOT NULL,
        [StatusName] nvarchar(max) NOT NULL,
        CONSTRAINT [PK_Statuss] PRIMARY KEY ([StatusId])
    );
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20230928102443_initial')
BEGIN
    CREATE TABLE [Todos] (
        [Id] int NOT NULL IDENTITY,
        [Description] nvarchar(max) NOT NULL,
        [DueDate] datetime2 NOT NULL,
        [CategoryId] nvarchar(450) NOT NULL,
        [StatusId] nvarchar(450) NOT NULL,
        CONSTRAINT [PK_Todos] PRIMARY KEY ([Id]),
        CONSTRAINT [FK_Todos_Categories_CategoryId] FOREIGN KEY ([CategoryId]) REFERENCES [Categories] ([CategoryId]) ON DELETE CASCADE,
        CONSTRAINT [FK_Todos_Statuss_StatusId] FOREIGN KEY ([StatusId]) REFERENCES [Statuss] ([StatusId]) ON DELETE CASCADE
    );
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20230928102443_initial')
BEGIN
    IF EXISTS (SELECT * FROM [sys].[identity_columns] WHERE [name] IN (N'CategoryId', N'Name') AND [object_id] = OBJECT_ID(N'[Categories]'))
        SET IDENTITY_INSERT [Categories] ON;
    EXEC(N'INSERT INTO [Categories] ([CategoryId], [Name])
    VALUES (N''call'', N''Contact''),
    (N''ex'', N''Exercise''),
    (N''home'', N''Home''),
    (N''shop'', N''Shopping''),
    (N''work'', N''Work'')');
    IF EXISTS (SELECT * FROM [sys].[identity_columns] WHERE [name] IN (N'CategoryId', N'Name') AND [object_id] = OBJECT_ID(N'[Categories]'))
        SET IDENTITY_INSERT [Categories] OFF;
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20230928102443_initial')
BEGIN
    IF EXISTS (SELECT * FROM [sys].[identity_columns] WHERE [name] IN (N'StatusId', N'StatusName') AND [object_id] = OBJECT_ID(N'[Statuss]'))
        SET IDENTITY_INSERT [Statuss] ON;
    EXEC(N'INSERT INTO [Statuss] ([StatusId], [StatusName])
    VALUES (N''closed'', N''Completed''),
    (N''open'', N''Open'')');
    IF EXISTS (SELECT * FROM [sys].[identity_columns] WHERE [name] IN (N'StatusId', N'StatusName') AND [object_id] = OBJECT_ID(N'[Statuss]'))
        SET IDENTITY_INSERT [Statuss] OFF;
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20230928102443_initial')
BEGIN
    CREATE INDEX [IX_Todos_CategoryId] ON [Todos] ([CategoryId]);
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20230928102443_initial')
BEGIN
    CREATE INDEX [IX_Todos_StatusId] ON [Todos] ([StatusId]);
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20230928102443_initial')
BEGIN
    INSERT INTO [__EFMigrationsHistory] ([MigrationId], [ProductVersion])
    VALUES (N'20230928102443_initial', N'7.0.11');
END;
GO

COMMIT;
GO

