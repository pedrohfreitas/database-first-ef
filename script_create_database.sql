CREATE DATABASE Bloging

use Bloging

CREATE TABLE [dbo].[User] (
    [UserId]  INT PRIMARY KEY IDENTITY (1, 1) NOT NULL,
    [Name] NVARCHAR (200) NULL
);

CREATE TABLE [dbo].[Blogs] (
    [BlogId] INT  IDENTITY (1, 1) NOT NULL,
    [Name] NVARCHAR (200) NULL,
    [Url]  NVARCHAR (200) NULL,
    CONSTRAINT [PK_dbo.Blogs] PRIMARY KEY CLUSTERED ([BlogId] ASC)
);

CREATE TABLE [dbo].[UserBlogs] (
    [UserBlogsId] INT IDENTITY (1, 1) NOT NULL,
    [BlogId] INT NOT NULL,
    [UserId] INT NOT NULL,
    FOREIGN KEY ([BlogId]) REFERENCES [dbo].[Blogs] ([BlogId]),
    FOREIGN KEY ([UserId]) REFERENCES [dbo].[User] ([UserId])
);

CREATE TABLE [dbo].[Posts] (
    [PostId] INT IDENTITY (1, 1) NOT NULL,
    [Title] NVARCHAR (200) NULL,
    [Content] NTEXT NULL,
    [BlogId] INT NOT NULL,
    CONSTRAINT [PK_dbo.Posts] PRIMARY KEY CLUSTERED ([PostId] ASC),
    CONSTRAINT [FK_dbo.Posts_dbo.Blogs_BlogId] FOREIGN KEY ([BlogId]) REFERENCES [dbo].[Blogs] ([BlogId])
);

INSERT INTO [dbo].[Blogs] ([Name],[Url])
VALUES ('The Visual Studio Blog', 'http://blogs.msdn.com/visualstudio/')

INSERT INTO [dbo].[Blogs] ([Name],[Url])
VALUES ('.NET Framework Blog', 'http://blogs.msdn.com/dotnet/')