USE [master]
GO
/****** Object:  Database [BetSoftwareOnlineShop]    Script Date: 5/9/2022 13:28:53 ******/
CREATE DATABASE [BetSoftwareOnlineShop]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'BetSoftwareOnlineShop', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL13.MSSQLSERVER\MSSQL\DATA\BetSoftwareOnlineShop.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'BetSoftwareOnlineShop_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL13.MSSQLSERVER\MSSQL\DATA\BetSoftwareOnlineShop_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
GO
ALTER DATABASE [BetSoftwareOnlineShop] SET COMPATIBILITY_LEVEL = 130
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [BetSoftwareOnlineShop].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [BetSoftwareOnlineShop] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [BetSoftwareOnlineShop] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [BetSoftwareOnlineShop] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [BetSoftwareOnlineShop] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [BetSoftwareOnlineShop] SET ARITHABORT OFF 
GO
ALTER DATABASE [BetSoftwareOnlineShop] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [BetSoftwareOnlineShop] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [BetSoftwareOnlineShop] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [BetSoftwareOnlineShop] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [BetSoftwareOnlineShop] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [BetSoftwareOnlineShop] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [BetSoftwareOnlineShop] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [BetSoftwareOnlineShop] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [BetSoftwareOnlineShop] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [BetSoftwareOnlineShop] SET  DISABLE_BROKER 
GO
ALTER DATABASE [BetSoftwareOnlineShop] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [BetSoftwareOnlineShop] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [BetSoftwareOnlineShop] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [BetSoftwareOnlineShop] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [BetSoftwareOnlineShop] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [BetSoftwareOnlineShop] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [BetSoftwareOnlineShop] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [BetSoftwareOnlineShop] SET RECOVERY FULL 
GO
ALTER DATABASE [BetSoftwareOnlineShop] SET  MULTI_USER 
GO
ALTER DATABASE [BetSoftwareOnlineShop] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [BetSoftwareOnlineShop] SET DB_CHAINING OFF 
GO
ALTER DATABASE [BetSoftwareOnlineShop] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [BetSoftwareOnlineShop] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [BetSoftwareOnlineShop] SET DELAYED_DURABILITY = DISABLED 
GO
EXEC sys.sp_db_vardecimal_storage_format N'BetSoftwareOnlineShop', N'ON'
GO
ALTER DATABASE [BetSoftwareOnlineShop] SET QUERY_STORE = OFF
GO
USE [BetSoftwareOnlineShop]
GO
ALTER DATABASE SCOPED CONFIGURATION SET MAXDOP = 0;
GO
ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET MAXDOP = PRIMARY;
GO
ALTER DATABASE SCOPED CONFIGURATION SET LEGACY_CARDINALITY_ESTIMATION = OFF;
GO
ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET LEGACY_CARDINALITY_ESTIMATION = PRIMARY;
GO
ALTER DATABASE SCOPED CONFIGURATION SET PARAMETER_SNIFFING = ON;
GO
ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET PARAMETER_SNIFFING = PRIMARY;
GO
ALTER DATABASE SCOPED CONFIGURATION SET QUERY_OPTIMIZER_HOTFIXES = OFF;
GO
ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET QUERY_OPTIMIZER_HOTFIXES = PRIMARY;
GO
USE [BetSoftwareOnlineShop]
GO
/****** Object:  Table [dbo].[AppUsers]    Script Date: 5/9/2022 13:28:53 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AppUsers](
	[UserId] [bigint] IDENTITY(1,1) NOT NULL,
	[UserEmail] [varchar](50) NOT NULL,
	[UserPassword] [varchar](max) NOT NULL,
	[DateAdded] [datetime] NOT NULL,
	[DateUpdated] [datetime] NULL,
	[IsActive] [bit] NOT NULL,
 CONSTRAINT [PK_AppUsers] PRIMARY KEY CLUSTERED 
(
	[UserId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[ErrorLog]    Script Date: 5/9/2022 13:28:54 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ErrorLog](
	[ErrorLogId] [bigint] IDENTITY(1,1) NOT NULL,
	[ErrorMessage] [varchar](max) NULL,
	[ErrorStackTrace] [varchar](max) NULL,
	[DateLogged] [datetime] NULL,
 CONSTRAINT [PK_ErrorLog] PRIMARY KEY CLUSTERED 
(
	[ErrorLogId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Order]    Script Date: 5/9/2022 13:28:54 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Order](
	[OrderId] [bigint] IDENTITY(1,1) NOT NULL,
	[UserId] [bigint] NOT NULL,
	[DateAdded] [datetime] NOT NULL,
	[DateUpdated] [datetime] NULL,
 CONSTRAINT [PK_Order] PRIMARY KEY CLUSTERED 
(
	[OrderId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[OrderItem]    Script Date: 5/9/2022 13:28:54 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[OrderItem](
	[OrderItemId] [bigint] IDENTITY(1,1) NOT NULL,
	[OrderId] [bigint] NOT NULL,
	[Quantity] [int] NOT NULL,
	[ProductId] [bigint] NOT NULL,
 CONSTRAINT [PK_OrderItem] PRIMARY KEY CLUSTERED 
(
	[OrderItemId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Product]    Script Date: 5/9/2022 13:28:54 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Product](
	[ProductId] [bigint] IDENTITY(1,1) NOT NULL,
	[ProductName] [varchar](100) NOT NULL,
	[ProductImage] [varchar](max) NULL,
	[ProductPrice] [decimal](18, 2) NOT NULL,
	[Quantity] [int] NOT NULL,
	[DateAdded] [datetime] NOT NULL,
	[DateUpdated] [datetime] NULL,
 CONSTRAINT [PK_Product] PRIMARY KEY CLUSTERED 
(
	[ProductId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET IDENTITY_INSERT [dbo].[AppUsers] ON 

GO
INSERT [dbo].[AppUsers] ([UserId], [UserEmail], [UserPassword], [DateAdded], [DateUpdated], [IsActive]) VALUES (1, N'kg@gmail.com', N'7ebddddf026935d7552bcedc0c4a6026a252170f3cae0d21f24847d9fce3b761', CAST(N'2022-09-02T08:22:19.560' AS DateTime), NULL, 1)
GO
INSERT [dbo].[AppUsers] ([UserId], [UserEmail], [UserPassword], [DateAdded], [DateUpdated], [IsActive]) VALUES (5, N'kgau@gmail.com', N'c4c1018ea261050823fa1cfe0ecb60c359f32340b5240c411fa518342d3cc5d8', CAST(N'2022-09-04T14:34:06.327' AS DateTime), NULL, 0)
GO
INSERT [dbo].[AppUsers] ([UserId], [UserEmail], [UserPassword], [DateAdded], [DateUpdated], [IsActive]) VALUES (6, N'test@gmail.com', N'ba848dbcc792e79cd444e3f33f93c06ef2b689ccb670c347da31b6eb0dca12b2', CAST(N'2022-09-05T12:19:48.767' AS DateTime), NULL, 0)
GO
SET IDENTITY_INSERT [dbo].[AppUsers] OFF
GO
SET IDENTITY_INSERT [dbo].[ErrorLog] ON 

GO
INSERT [dbo].[ErrorLog] ([ErrorLogId], [ErrorMessage], [ErrorStackTrace], [DateLogged]) VALUES (106, N'Test logging: User not found', N'', CAST(N'2022-09-04T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[ErrorLog] ([ErrorLogId], [ErrorMessage], [ErrorStackTrace], [DateLogged]) VALUES (107, N'An unhandled exception has occurred while executing the request.', N'System.NullReferenceException: Object reference not set to an instance of an object.
   at BetSoftwareAssessment.Controllers.UserController.SignIn(UserRequest model) in C:\Users\Nkauza\Documents\Job Applications\Assessments\BetSoftwareAssessment\BetSoftwareAssessment\Controllers\UserController.cs:line 66
   at Microsoft.AspNetCore.Mvc.Infrastructure.ActionMethodExecutor.TaskOfIActionResultExecutor.Execute(IActionResultTypeMapper mapper, ObjectMethodExecutor executor, Object controller, Object[] arguments)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ControllerActionInvoker.<InvokeActionMethodAsync>g__Awaited|12_0(ControllerActionInvoker invoker, ValueTask`1 actionResultValueTask)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ControllerActionInvoker.<InvokeNextActionFilterAsync>g__Awaited|10_0(ControllerActionInvoker invoker, Task lastTask, State next, Scope scope, Object state, Boolean isCompleted)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ControllerActionInvoker.Rethrow(ActionExecutedContextSealed context)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ControllerActionInvoker.Next(State& next, Scope& scope, Object& state, Boolean& isCompleted)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ControllerActionInvoker.InvokeInnerFilterAsync()
--- End of stack trace from previous location where exception was thrown ---
   at Microsoft.AspNetCore.Mvc.Infrastructure.ResourceInvoker.<InvokeNextResourceFilter>g__Awaited|24_0(ResourceInvoker invoker, Task lastTask, State next, Scope scope, Object state, Boolean isCompleted)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ResourceInvoker.Rethrow(ResourceExecutedContextSealed context)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ResourceInvoker.Next(State& next, Scope& scope, Object& state, Boolean& isCompleted)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ResourceInvoker.InvokeFilterPipelineAsync()
--- End of stack trace from previous location where exception was thrown ---
   at Microsoft.AspNetCore.Mvc.Infrastructure.ResourceInvoker.<InvokeAsync>g__Awaited|17_0(ResourceInvoker invoker, Task task, IDisposable scope)
   at Microsoft.AspNetCore.Routing.EndpointMiddleware.<Invoke>g__AwaitRequestTask|6_0(Endpoint endpoint, Task requestTask, ILogger logger)
   at Microsoft.AspNetCore.Authorization.AuthorizationMiddleware.Invoke(HttpContext context)
   at Microsoft.AspNetCore.Diagnostics.DeveloperExceptionPageMiddleware.Invoke(HttpContext context)', CAST(N'2022-09-04T17:04:19.930' AS DateTime))
GO
INSERT [dbo].[ErrorLog] ([ErrorLogId], [ErrorMessage], [ErrorStackTrace], [DateLogged]) VALUES (108, N'Invalid login attempt. Username:string, Password: string', N'', CAST(N'2022-09-04T17:06:06.387' AS DateTime))
GO
INSERT [dbo].[ErrorLog] ([ErrorLogId], [ErrorMessage], [ErrorStackTrace], [DateLogged]) VALUES (109, N'API/SignIn:: Invalid login attempt. Username:kg@gmail.com, Password: Qwe12345', N'', CAST(N'2022-09-05T07:01:21.030' AS DateTime))
GO
INSERT [dbo].[ErrorLog] ([ErrorLogId], [ErrorMessage], [ErrorStackTrace], [DateLogged]) VALUES (110, N'API/SignIn:: Invalid login attempt. Username:kg@gmail.com, Password: Qwe12345', N'', CAST(N'2022-09-05T07:02:09.657' AS DateTime))
GO
INSERT [dbo].[ErrorLog] ([ErrorLogId], [ErrorMessage], [ErrorStackTrace], [DateLogged]) VALUES (111, N'API/AddOrder:: Missing type map configuration or unsupported mapping.

Mapping types:
OrderModel -> Order
BetSoftware.DataClasses.Request.OrderModel -> BetSoftware.Repository.Entities.Order', N'', CAST(N'2022-09-05T08:42:03.090' AS DateTime))
GO
INSERT [dbo].[ErrorLog] ([ErrorLogId], [ErrorMessage], [ErrorStackTrace], [DateLogged]) VALUES (112, N'An unhandled exception has occurred while executing the request.', N'AutoMapper.AutoMapperMappingException: Missing type map configuration or unsupported mapping.

Mapping types:
OrderModel -> Order
BetSoftware.DataClasses.Request.OrderModel -> BetSoftware.Repository.Entities.Order
   at BetSoftwareAssessment.Controllers.OrderController.AddOrder(OrderModel model) in C:\Users\Nkauza\Documents\Job Applications\Assessments\BetSoftwareAssessment\BetSoftwareAssessment\Controllers\OrderController.cs:line 75
   at Microsoft.AspNetCore.Mvc.Infrastructure.ActionMethodExecutor.TaskOfIActionResultExecutor.Execute(IActionResultTypeMapper mapper, ObjectMethodExecutor executor, Object controller, Object[] arguments)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ControllerActionInvoker.<InvokeActionMethodAsync>g__Awaited|12_0(ControllerActionInvoker invoker, ValueTask`1 actionResultValueTask)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ControllerActionInvoker.<InvokeNextActionFilterAsync>g__Awaited|10_0(ControllerActionInvoker invoker, Task lastTask, State next, Scope scope, Object state, Boolean isCompleted)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ControllerActionInvoker.Rethrow(ActionExecutedContextSealed context)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ControllerActionInvoker.Next(State& next, Scope& scope, Object& state, Boolean& isCompleted)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ControllerActionInvoker.InvokeInnerFilterAsync()
--- End of stack trace from previous location where exception was thrown ---
   at Microsoft.AspNetCore.Mvc.Infrastructure.ResourceInvoker.<InvokeNextResourceFilter>g__Awaited|24_0(ResourceInvoker invoker, Task lastTask, State next, Scope scope, Object state, Boolean isCompleted)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ResourceInvoker.Rethrow(ResourceExecutedContextSealed context)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ResourceInvoker.Next(State& next, Scope& scope, Object& state, Boolean& isCompleted)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ResourceInvoker.InvokeFilterPipelineAsync()
--- End of stack trace from previous location where exception was thrown ---
   at Microsoft.AspNetCore.Mvc.Infrastructure.ResourceInvoker.<InvokeAsync>g__Awaited|17_0(ResourceInvoker invoker, Task task, IDisposable scope)
   at Microsoft.AspNetCore.Routing.EndpointMiddleware.<Invoke>g__AwaitRequestTask|6_0(Endpoint endpoint, Task requestTask, ILogger logger)
   at Microsoft.AspNetCore.Authorization.AuthorizationMiddleware.Invoke(HttpContext context)
   at Microsoft.AspNetCore.Diagnostics.DeveloperExceptionPageMiddleware.Invoke(HttpContext context)', CAST(N'2022-09-05T08:42:03.330' AS DateTime))
GO
INSERT [dbo].[ErrorLog] ([ErrorLogId], [ErrorMessage], [ErrorStackTrace], [DateLogged]) VALUES (113, N'Failed executing DbCommand (457ms) [Parameters=[@p0=''?'' (DbType = DateTime2), @p1=''?'' (DbType = DateTime2), @p2=''?'' (DbType = Int64)], CommandType=''Text'', CommandTimeout=''30'']
SET NOCOUNT ON;
INSERT INTO [Order] ([DateAdded], [DateUpdated], [UserId])
VALUES (@p0, @p1, @p2);
SELECT [OrderId]
FROM [Order]
WHERE @@ROWCOUNT = 1 AND [OrderId] = scope_identity();', N'', CAST(N'2022-09-05T08:59:13.153' AS DateTime))
GO
INSERT [dbo].[ErrorLog] ([ErrorLogId], [ErrorMessage], [ErrorStackTrace], [DateLogged]) VALUES (114, N'An exception occurred in the database while saving changes for context type ''BetSoftware.Repository.DataAccess.OnlineShopDBContext''.
Microsoft.EntityFrameworkCore.DbUpdateException: An error occurred while updating the entries. See the inner exception for details.
 ---> Microsoft.Data.SqlClient.SqlException (0x80131904): The conversion of a datetime2 data type to a datetime data type resulted in an out-of-range value.
The statement has been terminated.
   at Microsoft.Data.SqlClient.SqlCommand.<>c.<ExecuteDbDataReaderAsync>b__164_0(Task`1 result)
   at System.Threading.Tasks.ContinuationResultTaskFromResultTask`2.InnerInvoke()
   at System.Threading.Tasks.Task.<>c.<.cctor>b__274_0(Object obj)
   at System.Threading.ExecutionContext.RunInternal(ExecutionContext executionContext, ContextCallback callback, Object state)
--- End of stack trace from previous location where exception was thrown ---
   at System.Threading.ExecutionContext.RunInternal(ExecutionContext executionContext, ContextCallback callback, Object state)
   at System.Threading.Tasks.Task.ExecuteWithThreadLocal(Task& currentTaskSlot, Thread threadPoolThread)
--- End of stack trace from previous location where exception was thrown ---
   at Microsoft.EntityFrameworkCore.Storage.RelationalCommand.ExecuteReaderAsync(RelationalCommandParameterObject parameterObject, CancellationToken cancellationToken)
   at Microsoft.EntityFrameworkCore.Storage.RelationalCommand.ExecuteReaderAsync(RelationalCommandParameterObject parameterObject, CancellationToken cancellationToken)
   at Microsoft.EntityFrameworkCore.Storage.RelationalCommand.ExecuteReaderAsync(RelationalCommandParameterObject parameterObject, CancellationToken cancellationToken)
   at Microsoft.EntityFrameworkCore.Update.ReaderModificationCommandBatch.ExecuteAsync(IRelationalConnection connection, CancellationToken cancellationToken)
ClientConnectionId:a58e6f17-3771-485b-a9a2-a28b7b59f3a2
Error Number:242,State:3,Class:16
   --- End of inner exception stack trace ---
   at Microsoft.EntityFrameworkCore.Update.ReaderModificationCommandBatch.ExecuteAsync(IRelationalConnection connection, CancellationToken cancellationToken)
   at Microsoft.EntityFrameworkCore.Update.Internal.BatchExecutor.ExecuteAsync(IEnumerable`1 commandBatches, IRelationalConnection connection, CancellationToken cancellationToken)
   at Microsoft.EntityFrameworkCore.Update.Internal.BatchExecutor.ExecuteAsync(IEnumerable`1 commandBatches, IRelationalConnection connection, CancellationToken cancellationToken)
   at Microsoft.EntityFrameworkCore.ChangeTracking.Internal.StateManager.SaveChangesAsync(IList`1 entriesToSave, CancellationToken cancellationToken)
   at Microsoft.EntityFrameworkCore.ChangeTracking.Internal.StateManager.SaveChangesAsync(DbContext _, Boolean acceptAllChangesOnSuccess, CancellationToken cancellationToken)
   at Microsoft.EntityFrameworkCore.SqlServer.Storage.Internal.SqlServerExecutionStrategy.ExecuteAsync[TState,TResult](TState state, Func`4 operation, Func`4 verifySucceeded, CancellationToken cancellationToken)
   at Microsoft.EntityFrameworkCore.DbContext.SaveChangesAsync(Boolean acceptAllChangesOnSuccess, CancellationToken cancellationToken)', N'Microsoft.EntityFrameworkCore.DbUpdateException: An error occurred while updating the entries. See the inner exception for details.
 ---> Microsoft.Data.SqlClient.SqlException (0x80131904): The conversion of a datetime2 data type to a datetime data type resulted in an out-of-range value.
The statement has been terminated.
   at Microsoft.Data.SqlClient.SqlCommand.<>c.<ExecuteDbDataReaderAsync>b__164_0(Task`1 result)
   at System.Threading.Tasks.ContinuationResultTaskFromResultTask`2.InnerInvoke()
   at System.Threading.Tasks.Task.<>c.<.cctor>b__274_0(Object obj)
   at System.Threading.ExecutionContext.RunInternal(ExecutionContext executionContext, ContextCallback callback, Object state)
--- End of stack trace from previous location where exception was thrown ---
   at System.Threading.ExecutionContext.RunInternal(ExecutionContext executionContext, ContextCallback callback, Object state)
   at System.Threading.Tasks.Task.ExecuteWithThreadLocal(Task& currentTaskSlot, Thread threadPoolThread)
--- End of stack trace from previous location where exception was thrown ---
   at Microsoft.EntityFrameworkCore.Storage.RelationalCommand.ExecuteReaderAsync(RelationalCommandParameterObject parameterObject, CancellationToken cancellationToken)
   at Microsoft.EntityFrameworkCore.Storage.RelationalCommand.ExecuteReaderAsync(RelationalCommandParameterObject parameterObject, CancellationToken cancellationToken)
   at Microsoft.EntityFrameworkCore.Storage.RelationalCommand.ExecuteReaderAsync(RelationalCommandParameterObject parameterObject, CancellationToken cancellationToken)
   at Microsoft.EntityFrameworkCore.Update.ReaderModificationCommandBatch.ExecuteAsync(IRelationalConnection connection, CancellationToken cancellationToken)
ClientConnectionId:a58e6f17-3771-485b-a9a2-a28b7b59f3a2
Error Number:242,State:3,Class:16
   --- End of inner exception stack trace ---
   at Microsoft.EntityFrameworkCore.Update.ReaderModificationCommandBatch.ExecuteAsync(IRelationalConnection connection, CancellationToken cancellationToken)
   at Microsoft.EntityFrameworkCore.Update.Internal.BatchExecutor.ExecuteAsync(IEnumerable`1 commandBatches, IRelationalConnection connection, CancellationToken cancellationToken)
   at Microsoft.EntityFrameworkCore.Update.Internal.BatchExecutor.ExecuteAsync(IEnumerable`1 commandBatches, IRelationalConnection connection, CancellationToken cancellationToken)
   at Microsoft.EntityFrameworkCore.ChangeTracking.Internal.StateManager.SaveChangesAsync(IList`1 entriesToSave, CancellationToken cancellationToken)
   at Microsoft.EntityFrameworkCore.ChangeTracking.Internal.StateManager.SaveChangesAsync(DbContext _, Boolean acceptAllChangesOnSuccess, CancellationToken cancellationToken)
   at Microsoft.EntityFrameworkCore.SqlServer.Storage.Internal.SqlServerExecutionStrategy.ExecuteAsync[TState,TResult](TState state, Func`4 operation, Func`4 verifySucceeded, CancellationToken cancellationToken)
   at Microsoft.EntityFrameworkCore.DbContext.SaveChangesAsync(Boolean acceptAllChangesOnSuccess, CancellationToken cancellationToken)', CAST(N'2022-09-05T08:59:13.653' AS DateTime))
GO
INSERT [dbo].[ErrorLog] ([ErrorLogId], [ErrorMessage], [ErrorStackTrace], [DateLogged]) VALUES (115, N'API/AddOrder:: An error occurred while updating the entries. See the inner exception for details.', N'', CAST(N'2022-09-05T08:59:14.650' AS DateTime))
GO
INSERT [dbo].[ErrorLog] ([ErrorLogId], [ErrorMessage], [ErrorStackTrace], [DateLogged]) VALUES (116, N'An unhandled exception has occurred while executing the request.', N'Microsoft.EntityFrameworkCore.DbUpdateException: An error occurred while updating the entries. See the inner exception for details.
 ---> Microsoft.Data.SqlClient.SqlException (0x80131904): The conversion of a datetime2 data type to a datetime data type resulted in an out-of-range value.
The statement has been terminated.
   at Microsoft.Data.SqlClient.SqlCommand.<>c.<ExecuteDbDataReaderAsync>b__164_0(Task`1 result)
   at System.Threading.Tasks.ContinuationResultTaskFromResultTask`2.InnerInvoke()
   at System.Threading.Tasks.Task.<>c.<.cctor>b__274_0(Object obj)
   at System.Threading.ExecutionContext.RunInternal(ExecutionContext executionContext, ContextCallback callback, Object state)
--- End of stack trace from previous location where exception was thrown ---
   at System.Threading.ExecutionContext.RunInternal(ExecutionContext executionContext, ContextCallback callback, Object state)
   at System.Threading.Tasks.Task.ExecuteWithThreadLocal(Task& currentTaskSlot, Thread threadPoolThread)
--- End of stack trace from previous location where exception was thrown ---
   at Microsoft.EntityFrameworkCore.Storage.RelationalCommand.ExecuteReaderAsync(RelationalCommandParameterObject parameterObject, CancellationToken cancellationToken)
   at Microsoft.EntityFrameworkCore.Storage.RelationalCommand.ExecuteReaderAsync(RelationalCommandParameterObject parameterObject, CancellationToken cancellationToken)
   at Microsoft.EntityFrameworkCore.Storage.RelationalCommand.ExecuteReaderAsync(RelationalCommandParameterObject parameterObject, CancellationToken cancellationToken)
   at Microsoft.EntityFrameworkCore.Update.ReaderModificationCommandBatch.ExecuteAsync(IRelationalConnection connection, CancellationToken cancellationToken)
ClientConnectionId:a58e6f17-3771-485b-a9a2-a28b7b59f3a2
Error Number:242,State:3,Class:16
   --- End of inner exception stack trace ---
   at BetSoftwareAssessment.Controllers.OrderController.AddOrder(OrderModel model) in C:\Users\Nkauza\Documents\Job Applications\Assessments\BetSoftwareAssessment\BetSoftwareAssessment\Controllers\OrderController.cs:line 75
   at Microsoft.AspNetCore.Mvc.Infrastructure.ActionMethodExecutor.TaskOfIActionResultExecutor.Execute(IActionResultTypeMapper mapper, ObjectMethodExecutor executor, Object controller, Object[] arguments)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ControllerActionInvoker.<InvokeActionMethodAsync>g__Awaited|12_0(ControllerActionInvoker invoker, ValueTask`1 actionResultValueTask)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ControllerActionInvoker.<InvokeNextActionFilterAsync>g__Awaited|10_0(ControllerActionInvoker invoker, Task lastTask, State next, Scope scope, Object state, Boolean isCompleted)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ControllerActionInvoker.Rethrow(ActionExecutedContextSealed context)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ControllerActionInvoker.Next(State& next, Scope& scope, Object& state, Boolean& isCompleted)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ControllerActionInvoker.<InvokeInnerFilterAsync>g__Awaited|13_0(ControllerActionInvoker invoker, Task lastTask, State next, Scope scope, Object state, Boolean isCompleted)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ResourceInvoker.<InvokeNextResourceFilter>g__Awaited|24_0(ResourceInvoker invoker, Task lastTask, State next, Scope scope, Object state, Boolean isCompleted)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ResourceInvoker.Rethrow(ResourceExecutedContextSealed context)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ResourceInvoker.Next(State& next, Scope& scope, Object& state, Boolean& isCompleted)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ResourceInvoker.<InvokeFilterPipelineAsync>g__Awaited|19_0(ResourceInvoker invoker, Task lastTask, State next, Scope scope, Object state, Boolean isCompleted)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ResourceInvoker.<InvokeAsync>g__Awaited|17_0(ResourceInvoker invoker, Task task, IDisposable scope)
   at Microsoft.AspNetCore.Routing.EndpointMiddleware.<Invoke>g__AwaitRequestTask|6_0(Endpoint endpoint, Task requestTask, ILogger logger)
   at Microsoft.AspNetCore.Authorization.AuthorizationMiddleware.Invoke(HttpContext context)
   at Microsoft.AspNetCore.Diagnostics.DeveloperExceptionPageMiddleware.Invoke(HttpContext context)', CAST(N'2022-09-05T08:59:14.840' AS DateTime))
GO
INSERT [dbo].[ErrorLog] ([ErrorLogId], [ErrorMessage], [ErrorStackTrace], [DateLogged]) VALUES (117, N'Failed executing DbCommand (187ms) [Parameters=[@p0=''?'' (DbType = DateTime2), @p1=''?'' (DbType = DateTime2), @p2=''?'' (DbType = Int64)], CommandType=''Text'', CommandTimeout=''30'']
SET NOCOUNT ON;
INSERT INTO [Order] ([DateAdded], [DateUpdated], [UserId])
VALUES (@p0, @p1, @p2);
SELECT [OrderId]
FROM [Order]
WHERE @@ROWCOUNT = 1 AND [OrderId] = scope_identity();', N'', CAST(N'2022-09-05T09:04:44.660' AS DateTime))
GO
INSERT [dbo].[ErrorLog] ([ErrorLogId], [ErrorMessage], [ErrorStackTrace], [DateLogged]) VALUES (118, N'An exception occurred in the database while saving changes for context type ''BetSoftware.Repository.DataAccess.OnlineShopDBContext''.
Microsoft.EntityFrameworkCore.DbUpdateException: An error occurred while updating the entries. See the inner exception for details.
 ---> Microsoft.Data.SqlClient.SqlException (0x80131904): The conversion of a datetime2 data type to a datetime data type resulted in an out-of-range value.
The statement has been terminated.
   at Microsoft.Data.SqlClient.SqlCommand.<>c.<ExecuteDbDataReaderAsync>b__164_0(Task`1 result)
   at System.Threading.Tasks.ContinuationResultTaskFromResultTask`2.InnerInvoke()
   at System.Threading.Tasks.Task.<>c.<.cctor>b__274_0(Object obj)
   at System.Threading.ExecutionContext.RunInternal(ExecutionContext executionContext, ContextCallback callback, Object state)
--- End of stack trace from previous location where exception was thrown ---
   at System.Threading.ExecutionContext.RunInternal(ExecutionContext executionContext, ContextCallback callback, Object state)
   at System.Threading.Tasks.Task.ExecuteWithThreadLocal(Task& currentTaskSlot, Thread threadPoolThread)
--- End of stack trace from previous location where exception was thrown ---
   at Microsoft.EntityFrameworkCore.Storage.RelationalCommand.ExecuteReaderAsync(RelationalCommandParameterObject parameterObject, CancellationToken cancellationToken)
   at Microsoft.EntityFrameworkCore.Storage.RelationalCommand.ExecuteReaderAsync(RelationalCommandParameterObject parameterObject, CancellationToken cancellationToken)
   at Microsoft.EntityFrameworkCore.Storage.RelationalCommand.ExecuteReaderAsync(RelationalCommandParameterObject parameterObject, CancellationToken cancellationToken)
   at Microsoft.EntityFrameworkCore.Update.ReaderModificationCommandBatch.ExecuteAsync(IRelationalConnection connection, CancellationToken cancellationToken)
ClientConnectionId:1c3bd099-5bdf-4a7c-a25b-71a60c46cab8
Error Number:242,State:3,Class:16
   --- End of inner exception stack trace ---
   at Microsoft.EntityFrameworkCore.Update.ReaderModificationCommandBatch.ExecuteAsync(IRelationalConnection connection, CancellationToken cancellationToken)
   at Microsoft.EntityFrameworkCore.Update.Internal.BatchExecutor.ExecuteAsync(IEnumerable`1 commandBatches, IRelationalConnection connection, CancellationToken cancellationToken)
   at Microsoft.EntityFrameworkCore.Update.Internal.BatchExecutor.ExecuteAsync(IEnumerable`1 commandBatches, IRelationalConnection connection, CancellationToken cancellationToken)
   at Microsoft.EntityFrameworkCore.ChangeTracking.Internal.StateManager.SaveChangesAsync(IList`1 entriesToSave, CancellationToken cancellationToken)
   at Microsoft.EntityFrameworkCore.ChangeTracking.Internal.StateManager.SaveChangesAsync(DbContext _, Boolean acceptAllChangesOnSuccess, CancellationToken cancellationToken)
   at Microsoft.EntityFrameworkCore.SqlServer.Storage.Internal.SqlServerExecutionStrategy.ExecuteAsync[TState,TResult](TState state, Func`4 operation, Func`4 verifySucceeded, CancellationToken cancellationToken)
   at Microsoft.EntityFrameworkCore.DbContext.SaveChangesAsync(Boolean acceptAllChangesOnSuccess, CancellationToken cancellationToken)', N'Microsoft.EntityFrameworkCore.DbUpdateException: An error occurred while updating the entries. See the inner exception for details.
 ---> Microsoft.Data.SqlClient.SqlException (0x80131904): The conversion of a datetime2 data type to a datetime data type resulted in an out-of-range value.
The statement has been terminated.
   at Microsoft.Data.SqlClient.SqlCommand.<>c.<ExecuteDbDataReaderAsync>b__164_0(Task`1 result)
   at System.Threading.Tasks.ContinuationResultTaskFromResultTask`2.InnerInvoke()
   at System.Threading.Tasks.Task.<>c.<.cctor>b__274_0(Object obj)
   at System.Threading.ExecutionContext.RunInternal(ExecutionContext executionContext, ContextCallback callback, Object state)
--- End of stack trace from previous location where exception was thrown ---
   at System.Threading.ExecutionContext.RunInternal(ExecutionContext executionContext, ContextCallback callback, Object state)
   at System.Threading.Tasks.Task.ExecuteWithThreadLocal(Task& currentTaskSlot, Thread threadPoolThread)
--- End of stack trace from previous location where exception was thrown ---
   at Microsoft.EntityFrameworkCore.Storage.RelationalCommand.ExecuteReaderAsync(RelationalCommandParameterObject parameterObject, CancellationToken cancellationToken)
   at Microsoft.EntityFrameworkCore.Storage.RelationalCommand.ExecuteReaderAsync(RelationalCommandParameterObject parameterObject, CancellationToken cancellationToken)
   at Microsoft.EntityFrameworkCore.Storage.RelationalCommand.ExecuteReaderAsync(RelationalCommandParameterObject parameterObject, CancellationToken cancellationToken)
   at Microsoft.EntityFrameworkCore.Update.ReaderModificationCommandBatch.ExecuteAsync(IRelationalConnection connection, CancellationToken cancellationToken)
ClientConnectionId:1c3bd099-5bdf-4a7c-a25b-71a60c46cab8
Error Number:242,State:3,Class:16
   --- End of inner exception stack trace ---
   at Microsoft.EntityFrameworkCore.Update.ReaderModificationCommandBatch.ExecuteAsync(IRelationalConnection connection, CancellationToken cancellationToken)
   at Microsoft.EntityFrameworkCore.Update.Internal.BatchExecutor.ExecuteAsync(IEnumerable`1 commandBatches, IRelationalConnection connection, CancellationToken cancellationToken)
   at Microsoft.EntityFrameworkCore.Update.Internal.BatchExecutor.ExecuteAsync(IEnumerable`1 commandBatches, IRelationalConnection connection, CancellationToken cancellationToken)
   at Microsoft.EntityFrameworkCore.ChangeTracking.Internal.StateManager.SaveChangesAsync(IList`1 entriesToSave, CancellationToken cancellationToken)
   at Microsoft.EntityFrameworkCore.ChangeTracking.Internal.StateManager.SaveChangesAsync(DbContext _, Boolean acceptAllChangesOnSuccess, CancellationToken cancellationToken)
   at Microsoft.EntityFrameworkCore.SqlServer.Storage.Internal.SqlServerExecutionStrategy.ExecuteAsync[TState,TResult](TState state, Func`4 operation, Func`4 verifySucceeded, CancellationToken cancellationToken)
   at Microsoft.EntityFrameworkCore.DbContext.SaveChangesAsync(Boolean acceptAllChangesOnSuccess, CancellationToken cancellationToken)', CAST(N'2022-09-05T09:04:44.807' AS DateTime))
GO
INSERT [dbo].[ErrorLog] ([ErrorLogId], [ErrorMessage], [ErrorStackTrace], [DateLogged]) VALUES (119, N'API/AddOrder:: An error occurred while updating the entries. See the inner exception for details.', N'', CAST(N'2022-09-05T09:04:57.583' AS DateTime))
GO
INSERT [dbo].[ErrorLog] ([ErrorLogId], [ErrorMessage], [ErrorStackTrace], [DateLogged]) VALUES (120, N'An unhandled exception has occurred while executing the request.', N'Microsoft.EntityFrameworkCore.DbUpdateException: An error occurred while updating the entries. See the inner exception for details.
 ---> Microsoft.Data.SqlClient.SqlException (0x80131904): The conversion of a datetime2 data type to a datetime data type resulted in an out-of-range value.
The statement has been terminated.
   at Microsoft.Data.SqlClient.SqlCommand.<>c.<ExecuteDbDataReaderAsync>b__164_0(Task`1 result)
   at System.Threading.Tasks.ContinuationResultTaskFromResultTask`2.InnerInvoke()
   at System.Threading.Tasks.Task.<>c.<.cctor>b__274_0(Object obj)
   at System.Threading.ExecutionContext.RunInternal(ExecutionContext executionContext, ContextCallback callback, Object state)
--- End of stack trace from previous location where exception was thrown ---
   at System.Threading.ExecutionContext.RunInternal(ExecutionContext executionContext, ContextCallback callback, Object state)
   at System.Threading.Tasks.Task.ExecuteWithThreadLocal(Task& currentTaskSlot, Thread threadPoolThread)
--- End of stack trace from previous location where exception was thrown ---
   at Microsoft.EntityFrameworkCore.Storage.RelationalCommand.ExecuteReaderAsync(RelationalCommandParameterObject parameterObject, CancellationToken cancellationToken)
   at Microsoft.EntityFrameworkCore.Storage.RelationalCommand.ExecuteReaderAsync(RelationalCommandParameterObject parameterObject, CancellationToken cancellationToken)
   at Microsoft.EntityFrameworkCore.Storage.RelationalCommand.ExecuteReaderAsync(RelationalCommandParameterObject parameterObject, CancellationToken cancellationToken)
   at Microsoft.EntityFrameworkCore.Update.ReaderModificationCommandBatch.ExecuteAsync(IRelationalConnection connection, CancellationToken cancellationToken)
ClientConnectionId:1c3bd099-5bdf-4a7c-a25b-71a60c46cab8
Error Number:242,State:3,Class:16
   --- End of inner exception stack trace ---
   at BetSoftwareAssessment.Controllers.OrderController.AddOrder(OrderModel model) in C:\Users\Nkauza\Documents\Job Applications\Assessments\BetSoftwareAssessment\BetSoftwareAssessment\Controllers\OrderController.cs:line 75
   at Microsoft.AspNetCore.Mvc.Infrastructure.ActionMethodExecutor.TaskOfIActionResultExecutor.Execute(IActionResultTypeMapper mapper, ObjectMethodExecutor executor, Object controller, Object[] arguments)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ControllerActionInvoker.<InvokeActionMethodAsync>g__Awaited|12_0(ControllerActionInvoker invoker, ValueTask`1 actionResultValueTask)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ControllerActionInvoker.<InvokeNextActionFilterAsync>g__Awaited|10_0(ControllerActionInvoker invoker, Task lastTask, State next, Scope scope, Object state, Boolean isCompleted)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ControllerActionInvoker.Rethrow(ActionExecutedContextSealed context)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ControllerActionInvoker.Next(State& next, Scope& scope, Object& state, Boolean& isCompleted)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ControllerActionInvoker.<InvokeInnerFilterAsync>g__Awaited|13_0(ControllerActionInvoker invoker, Task lastTask, State next, Scope scope, Object state, Boolean isCompleted)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ResourceInvoker.<InvokeNextResourceFilter>g__Awaited|24_0(ResourceInvoker invoker, Task lastTask, State next, Scope scope, Object state, Boolean isCompleted)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ResourceInvoker.Rethrow(ResourceExecutedContextSealed context)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ResourceInvoker.Next(State& next, Scope& scope, Object& state, Boolean& isCompleted)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ResourceInvoker.<InvokeFilterPipelineAsync>g__Awaited|19_0(ResourceInvoker invoker, Task lastTask, State next, Scope scope, Object state, Boolean isCompleted)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ResourceInvoker.<InvokeAsync>g__Awaited|17_0(ResourceInvoker invoker, Task task, IDisposable scope)
   at Microsoft.AspNetCore.Routing.EndpointMiddleware.<Invoke>g__AwaitRequestTask|6_0(Endpoint endpoint, Task requestTask, ILogger logger)
   at Microsoft.AspNetCore.Authorization.AuthorizationMiddleware.Invoke(HttpContext context)
   at Microsoft.AspNetCore.Diagnostics.DeveloperExceptionPageMiddleware.Invoke(HttpContext context)', CAST(N'2022-09-05T09:04:57.727' AS DateTime))
GO
INSERT [dbo].[ErrorLog] ([ErrorLogId], [ErrorMessage], [ErrorStackTrace], [DateLogged]) VALUES (121, N'Failed executing DbCommand (204ms) [Parameters=[@p0=''?'' (DbType = Int64), @p1=''?'' (DbType = Int64), @p2=''?'' (DbType = Int32)], CommandType=''Text'', CommandTimeout=''30'']
SET NOCOUNT ON;
INSERT INTO [OrderItem] ([OrderId], [ProductId], [Quantity])
VALUES (@p0, @p1, @p2);
SELECT [OrderItemId]
FROM [OrderItem]
WHERE @@ROWCOUNT = 1 AND [OrderItemId] = scope_identity();', N'', CAST(N'2022-09-05T09:07:54.157' AS DateTime))
GO
INSERT [dbo].[ErrorLog] ([ErrorLogId], [ErrorMessage], [ErrorStackTrace], [DateLogged]) VALUES (122, N'An exception occurred in the database while saving changes for context type ''BetSoftware.Repository.DataAccess.OnlineShopDBContext''.
Microsoft.EntityFrameworkCore.DbUpdateException: An error occurred while updating the entries. See the inner exception for details.
 ---> Microsoft.Data.SqlClient.SqlException (0x80131904): The INSERT statement conflicted with the FOREIGN KEY constraint "FK_OrderItem_Order". The conflict occurred in database "BetSoftwareOnlineShop", table "dbo.Order", column ''OrderId''.
The statement has been terminated.
   at Microsoft.Data.SqlClient.SqlCommand.<>c.<ExecuteDbDataReaderAsync>b__164_0(Task`1 result)
   at System.Threading.Tasks.ContinuationResultTaskFromResultTask`2.InnerInvoke()
   at System.Threading.Tasks.Task.<>c.<.cctor>b__274_0(Object obj)
   at System.Threading.ExecutionContext.RunInternal(ExecutionContext executionContext, ContextCallback callback, Object state)
--- End of stack trace from previous location where exception was thrown ---
   at System.Threading.ExecutionContext.RunInternal(ExecutionContext executionContext, ContextCallback callback, Object state)
   at System.Threading.Tasks.Task.ExecuteWithThreadLocal(Task& currentTaskSlot, Thread threadPoolThread)
--- End of stack trace from previous location where exception was thrown ---
   at Microsoft.EntityFrameworkCore.Storage.RelationalCommand.ExecuteReaderAsync(RelationalCommandParameterObject parameterObject, CancellationToken cancellationToken)
   at Microsoft.EntityFrameworkCore.Storage.RelationalCommand.ExecuteReaderAsync(RelationalCommandParameterObject parameterObject, CancellationToken cancellationToken)
   at Microsoft.EntityFrameworkCore.Storage.RelationalCommand.ExecuteReaderAsync(RelationalCommandParameterObject parameterObject, CancellationToken cancellationToken)
   at Microsoft.EntityFrameworkCore.Update.ReaderModificationCommandBatch.ExecuteAsync(IRelationalConnection connection, CancellationToken cancellationToken)
ClientConnectionId:565f8a53-68a5-43f9-a087-bd182b2e1e61
Error Number:547,State:0,Class:16
   --- End of inner exception stack trace ---
   at Microsoft.EntityFrameworkCore.Update.ReaderModificationCommandBatch.ExecuteAsync(IRelationalConnection connection, CancellationToken cancellationToken)
   at Microsoft.EntityFrameworkCore.Update.Internal.BatchExecutor.ExecuteAsync(IEnumerable`1 commandBatches, IRelationalConnection connection, CancellationToken cancellationToken)
   at Microsoft.EntityFrameworkCore.Update.Internal.BatchExecutor.ExecuteAsync(IEnumerable`1 commandBatches, IRelationalConnection connection, CancellationToken cancellationToken)
   at Microsoft.EntityFrameworkCore.ChangeTracking.Internal.StateManager.SaveChangesAsync(IList`1 entriesToSave, CancellationToken cancellationToken)
   at Microsoft.EntityFrameworkCore.ChangeTracking.Internal.StateManager.SaveChangesAsync(DbContext _, Boolean acceptAllChangesOnSuccess, CancellationToken cancellationToken)
   at Microsoft.EntityFrameworkCore.SqlServer.Storage.Internal.SqlServerExecutionStrategy.ExecuteAsync[TState,TResult](TState state, Func`4 operation, Func`4 verifySucceeded, CancellationToken cancellationToken)
   at Microsoft.EntityFrameworkCore.DbContext.SaveChangesAsync(Boolean acceptAllChangesOnSuccess, CancellationToken cancellationToken)', N'Microsoft.EntityFrameworkCore.DbUpdateException: An error occurred while updating the entries. See the inner exception for details.
 ---> Microsoft.Data.SqlClient.SqlException (0x80131904): The INSERT statement conflicted with the FOREIGN KEY constraint "FK_OrderItem_Order". The conflict occurred in database "BetSoftwareOnlineShop", table "dbo.Order", column ''OrderId''.
The statement has been terminated.
   at Microsoft.Data.SqlClient.SqlCommand.<>c.<ExecuteDbDataReaderAsync>b__164_0(Task`1 result)
   at System.Threading.Tasks.ContinuationResultTaskFromResultTask`2.InnerInvoke()
   at System.Threading.Tasks.Task.<>c.<.cctor>b__274_0(Object obj)
   at System.Threading.ExecutionContext.RunInternal(ExecutionContext executionContext, ContextCallback callback, Object state)
--- End of stack trace from previous location where exception was thrown ---
   at System.Threading.ExecutionContext.RunInternal(ExecutionContext executionContext, ContextCallback callback, Object state)
   at System.Threading.Tasks.Task.ExecuteWithThreadLocal(Task& currentTaskSlot, Thread threadPoolThread)
--- End of stack trace from previous location where exception was thrown ---
   at Microsoft.EntityFrameworkCore.Storage.RelationalCommand.ExecuteReaderAsync(RelationalCommandParameterObject parameterObject, CancellationToken cancellationToken)
   at Microsoft.EntityFrameworkCore.Storage.RelationalCommand.ExecuteReaderAsync(RelationalCommandParameterObject parameterObject, CancellationToken cancellationToken)
   at Microsoft.EntityFrameworkCore.Storage.RelationalCommand.ExecuteReaderAsync(RelationalCommandParameterObject parameterObject, CancellationToken cancellationToken)
   at Microsoft.EntityFrameworkCore.Update.ReaderModificationCommandBatch.ExecuteAsync(IRelationalConnection connection, CancellationToken cancellationToken)
ClientConnectionId:565f8a53-68a5-43f9-a087-bd182b2e1e61
Error Number:547,State:0,Class:16
   --- End of inner exception stack trace ---
   at Microsoft.EntityFrameworkCore.Update.ReaderModificationCommandBatch.ExecuteAsync(IRelationalConnection connection, CancellationToken cancellationToken)
   at Microsoft.EntityFrameworkCore.Update.Internal.BatchExecutor.ExecuteAsync(IEnumerable`1 commandBatches, IRelationalConnection connection, CancellationToken cancellationToken)
   at Microsoft.EntityFrameworkCore.Update.Internal.BatchExecutor.ExecuteAsync(IEnumerable`1 commandBatches, IRelationalConnection connection, CancellationToken cancellationToken)
   at Microsoft.EntityFrameworkCore.ChangeTracking.Internal.StateManager.SaveChangesAsync(IList`1 entriesToSave, CancellationToken cancellationToken)
   at Microsoft.EntityFrameworkCore.ChangeTracking.Internal.StateManager.SaveChangesAsync(DbContext _, Boolean acceptAllChangesOnSuccess, CancellationToken cancellationToken)
   at Microsoft.EntityFrameworkCore.SqlServer.Storage.Internal.SqlServerExecutionStrategy.ExecuteAsync[TState,TResult](TState state, Func`4 operation, Func`4 verifySucceeded, CancellationToken cancellationToken)
   at Microsoft.EntityFrameworkCore.DbContext.SaveChangesAsync(Boolean acceptAllChangesOnSuccess, CancellationToken cancellationToken)', CAST(N'2022-09-05T09:07:54.283' AS DateTime))
GO
INSERT [dbo].[ErrorLog] ([ErrorLogId], [ErrorMessage], [ErrorStackTrace], [DateLogged]) VALUES (123, N'API/AddOrder:: An error occurred while updating the entries. See the inner exception for details.', N'', CAST(N'2022-09-05T09:08:22.550' AS DateTime))
GO
INSERT [dbo].[ErrorLog] ([ErrorLogId], [ErrorMessage], [ErrorStackTrace], [DateLogged]) VALUES (124, N'An unhandled exception has occurred while executing the request.', N'Microsoft.EntityFrameworkCore.DbUpdateException: An error occurred while updating the entries. See the inner exception for details.
 ---> Microsoft.Data.SqlClient.SqlException (0x80131904): The INSERT statement conflicted with the FOREIGN KEY constraint "FK_OrderItem_Order". The conflict occurred in database "BetSoftwareOnlineShop", table "dbo.Order", column ''OrderId''.
The statement has been terminated.
   at Microsoft.Data.SqlClient.SqlCommand.<>c.<ExecuteDbDataReaderAsync>b__164_0(Task`1 result)
   at System.Threading.Tasks.ContinuationResultTaskFromResultTask`2.InnerInvoke()
   at System.Threading.Tasks.Task.<>c.<.cctor>b__274_0(Object obj)
   at System.Threading.ExecutionContext.RunInternal(ExecutionContext executionContext, ContextCallback callback, Object state)
--- End of stack trace from previous location where exception was thrown ---
   at System.Threading.ExecutionContext.RunInternal(ExecutionContext executionContext, ContextCallback callback, Object state)
   at System.Threading.Tasks.Task.ExecuteWithThreadLocal(Task& currentTaskSlot, Thread threadPoolThread)
--- End of stack trace from previous location where exception was thrown ---
   at Microsoft.EntityFrameworkCore.Storage.RelationalCommand.ExecuteReaderAsync(RelationalCommandParameterObject parameterObject, CancellationToken cancellationToken)
   at Microsoft.EntityFrameworkCore.Storage.RelationalCommand.ExecuteReaderAsync(RelationalCommandParameterObject parameterObject, CancellationToken cancellationToken)
   at Microsoft.EntityFrameworkCore.Storage.RelationalCommand.ExecuteReaderAsync(RelationalCommandParameterObject parameterObject, CancellationToken cancellationToken)
   at Microsoft.EntityFrameworkCore.Update.ReaderModificationCommandBatch.ExecuteAsync(IRelationalConnection connection, CancellationToken cancellationToken)
ClientConnectionId:565f8a53-68a5-43f9-a087-bd182b2e1e61
Error Number:547,State:0,Class:16
   --- End of inner exception stack trace ---
   at BetSoftwareAssessment.Controllers.OrderController.AddOrder(OrderModel model) in C:\Users\Nkauza\Documents\Job Applications\Assessments\BetSoftwareAssessment\BetSoftwareAssessment\Controllers\OrderController.cs:line 75
   at Microsoft.AspNetCore.Mvc.Infrastructure.ActionMethodExecutor.TaskOfIActionResultExecutor.Execute(IActionResultTypeMapper mapper, ObjectMethodExecutor executor, Object controller, Object[] arguments)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ControllerActionInvoker.<InvokeActionMethodAsync>g__Awaited|12_0(ControllerActionInvoker invoker, ValueTask`1 actionResultValueTask)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ControllerActionInvoker.<InvokeNextActionFilterAsync>g__Awaited|10_0(ControllerActionInvoker invoker, Task lastTask, State next, Scope scope, Object state, Boolean isCompleted)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ControllerActionInvoker.Rethrow(ActionExecutedContextSealed context)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ControllerActionInvoker.Next(State& next, Scope& scope, Object& state, Boolean& isCompleted)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ControllerActionInvoker.<InvokeInnerFilterAsync>g__Awaited|13_0(ControllerActionInvoker invoker, Task lastTask, State next, Scope scope, Object state, Boolean isCompleted)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ResourceInvoker.<InvokeNextResourceFilter>g__Awaited|24_0(ResourceInvoker invoker, Task lastTask, State next, Scope scope, Object state, Boolean isCompleted)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ResourceInvoker.Rethrow(ResourceExecutedContextSealed context)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ResourceInvoker.Next(State& next, Scope& scope, Object& state, Boolean& isCompleted)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ResourceInvoker.<InvokeFilterPipelineAsync>g__Awaited|19_0(ResourceInvoker invoker, Task lastTask, State next, Scope scope, Object state, Boolean isCompleted)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ResourceInvoker.<InvokeAsync>g__Awaited|17_0(ResourceInvoker invoker, Task task, IDisposable scope)
   at Microsoft.AspNetCore.Routing.EndpointMiddleware.<Invoke>g__AwaitRequestTask|6_0(Endpoint endpoint, Task requestTask, ILogger logger)
   at Microsoft.AspNetCore.Authorization.AuthorizationMiddleware.Invoke(HttpContext context)
   at Microsoft.AspNetCore.Diagnostics.DeveloperExceptionPageMiddleware.Invoke(HttpContext context)', CAST(N'2022-09-05T09:08:22.743' AS DateTime))
GO
INSERT [dbo].[ErrorLog] ([ErrorLogId], [ErrorMessage], [ErrorStackTrace], [DateLogged]) VALUES (125, N'Failed executing DbCommand (65ms) [Parameters=[@p0=''?'' (DbType = Int64), @p1=''?'' (DbType = Int64), @p2=''?'' (DbType = Int32)], CommandType=''Text'', CommandTimeout=''30'']
SET NOCOUNT ON;
INSERT INTO [OrderItem] ([OrderId], [ProductId], [Quantity])
VALUES (@p0, @p1, @p2);
SELECT [OrderItemId]
FROM [OrderItem]
WHERE @@ROWCOUNT = 1 AND [OrderItemId] = scope_identity();', N'', CAST(N'2022-09-05T09:10:41.853' AS DateTime))
GO
INSERT [dbo].[ErrorLog] ([ErrorLogId], [ErrorMessage], [ErrorStackTrace], [DateLogged]) VALUES (126, N'An exception occurred in the database while saving changes for context type ''BetSoftware.Repository.DataAccess.OnlineShopDBContext''.
Microsoft.EntityFrameworkCore.DbUpdateException: An error occurred while updating the entries. See the inner exception for details.
 ---> Microsoft.Data.SqlClient.SqlException (0x80131904): The INSERT statement conflicted with the FOREIGN KEY constraint "FK_OrderItem_Order". The conflict occurred in database "BetSoftwareOnlineShop", table "dbo.Order", column ''OrderId''.
The statement has been terminated.
   at Microsoft.Data.SqlClient.SqlCommand.<>c.<ExecuteDbDataReaderAsync>b__164_0(Task`1 result)
   at System.Threading.Tasks.ContinuationResultTaskFromResultTask`2.InnerInvoke()
   at System.Threading.Tasks.Task.<>c.<.cctor>b__274_0(Object obj)
   at System.Threading.ExecutionContext.RunInternal(ExecutionContext executionContext, ContextCallback callback, Object state)
--- End of stack trace from previous location where exception was thrown ---
   at System.Threading.ExecutionContext.RunInternal(ExecutionContext executionContext, ContextCallback callback, Object state)
   at System.Threading.Tasks.Task.ExecuteWithThreadLocal(Task& currentTaskSlot, Thread threadPoolThread)
--- End of stack trace from previous location where exception was thrown ---
   at Microsoft.EntityFrameworkCore.Storage.RelationalCommand.ExecuteReaderAsync(RelationalCommandParameterObject parameterObject, CancellationToken cancellationToken)
   at Microsoft.EntityFrameworkCore.Storage.RelationalCommand.ExecuteReaderAsync(RelationalCommandParameterObject parameterObject, CancellationToken cancellationToken)
   at Microsoft.EntityFrameworkCore.Storage.RelationalCommand.ExecuteReaderAsync(RelationalCommandParameterObject parameterObject, CancellationToken cancellationToken)
   at Microsoft.EntityFrameworkCore.Update.ReaderModificationCommandBatch.ExecuteAsync(IRelationalConnection connection, CancellationToken cancellationToken)
ClientConnectionId:565f8a53-68a5-43f9-a087-bd182b2e1e61
Error Number:547,State:0,Class:16
   --- End of inner exception stack trace ---
   at Microsoft.EntityFrameworkCore.Update.ReaderModificationCommandBatch.ExecuteAsync(IRelationalConnection connection, CancellationToken cancellationToken)
   at Microsoft.EntityFrameworkCore.Update.Internal.BatchExecutor.ExecuteAsync(IEnumerable`1 commandBatches, IRelationalConnection connection, CancellationToken cancellationToken)
   at Microsoft.EntityFrameworkCore.Update.Internal.BatchExecutor.ExecuteAsync(IEnumerable`1 commandBatches, IRelationalConnection connection, CancellationToken cancellationToken)
   at Microsoft.EntityFrameworkCore.ChangeTracking.Internal.StateManager.SaveChangesAsync(IList`1 entriesToSave, CancellationToken cancellationToken)
   at Microsoft.EntityFrameworkCore.ChangeTracking.Internal.StateManager.SaveChangesAsync(DbContext _, Boolean acceptAllChangesOnSuccess, CancellationToken cancellationToken)
   at Microsoft.EntityFrameworkCore.SqlServer.Storage.Internal.SqlServerExecutionStrategy.ExecuteAsync[TState,TResult](TState state, Func`4 operation, Func`4 verifySucceeded, CancellationToken cancellationToken)
   at Microsoft.EntityFrameworkCore.DbContext.SaveChangesAsync(Boolean acceptAllChangesOnSuccess, CancellationToken cancellationToken)', N'Microsoft.EntityFrameworkCore.DbUpdateException: An error occurred while updating the entries. See the inner exception for details.
 ---> Microsoft.Data.SqlClient.SqlException (0x80131904): The INSERT statement conflicted with the FOREIGN KEY constraint "FK_OrderItem_Order". The conflict occurred in database "BetSoftwareOnlineShop", table "dbo.Order", column ''OrderId''.
The statement has been terminated.
   at Microsoft.Data.SqlClient.SqlCommand.<>c.<ExecuteDbDataReaderAsync>b__164_0(Task`1 result)
   at System.Threading.Tasks.ContinuationResultTaskFromResultTask`2.InnerInvoke()
   at System.Threading.Tasks.Task.<>c.<.cctor>b__274_0(Object obj)
   at System.Threading.ExecutionContext.RunInternal(ExecutionContext executionContext, ContextCallback callback, Object state)
--- End of stack trace from previous location where exception was thrown ---
   at System.Threading.ExecutionContext.RunInternal(ExecutionContext executionContext, ContextCallback callback, Object state)
   at System.Threading.Tasks.Task.ExecuteWithThreadLocal(Task& currentTaskSlot, Thread threadPoolThread)
--- End of stack trace from previous location where exception was thrown ---
   at Microsoft.EntityFrameworkCore.Storage.RelationalCommand.ExecuteReaderAsync(RelationalCommandParameterObject parameterObject, CancellationToken cancellationToken)
   at Microsoft.EntityFrameworkCore.Storage.RelationalCommand.ExecuteReaderAsync(RelationalCommandParameterObject parameterObject, CancellationToken cancellationToken)
   at Microsoft.EntityFrameworkCore.Storage.RelationalCommand.ExecuteReaderAsync(RelationalCommandParameterObject parameterObject, CancellationToken cancellationToken)
   at Microsoft.EntityFrameworkCore.Update.ReaderModificationCommandBatch.ExecuteAsync(IRelationalConnection connection, CancellationToken cancellationToken)
ClientConnectionId:565f8a53-68a5-43f9-a087-bd182b2e1e61
Error Number:547,State:0,Class:16
   --- End of inner exception stack trace ---
   at Microsoft.EntityFrameworkCore.Update.ReaderModificationCommandBatch.ExecuteAsync(IRelationalConnection connection, CancellationToken cancellationToken)
   at Microsoft.EntityFrameworkCore.Update.Internal.BatchExecutor.ExecuteAsync(IEnumerable`1 commandBatches, IRelationalConnection connection, CancellationToken cancellationToken)
   at Microsoft.EntityFrameworkCore.Update.Internal.BatchExecutor.ExecuteAsync(IEnumerable`1 commandBatches, IRelationalConnection connection, CancellationToken cancellationToken)
   at Microsoft.EntityFrameworkCore.ChangeTracking.Internal.StateManager.SaveChangesAsync(IList`1 entriesToSave, CancellationToken cancellationToken)
   at Microsoft.EntityFrameworkCore.ChangeTracking.Internal.StateManager.SaveChangesAsync(DbContext _, Boolean acceptAllChangesOnSuccess, CancellationToken cancellationToken)
   at Microsoft.EntityFrameworkCore.SqlServer.Storage.Internal.SqlServerExecutionStrategy.ExecuteAsync[TState,TResult](TState state, Func`4 operation, Func`4 verifySucceeded, CancellationToken cancellationToken)
   at Microsoft.EntityFrameworkCore.DbContext.SaveChangesAsync(Boolean acceptAllChangesOnSuccess, CancellationToken cancellationToken)', CAST(N'2022-09-05T09:10:41.853' AS DateTime))
GO
SET IDENTITY_INSERT [dbo].[ErrorLog] OFF
GO
SET IDENTITY_INSERT [dbo].[Order] ON 

GO
INSERT [dbo].[Order] ([OrderId], [UserId], [DateAdded], [DateUpdated]) VALUES (3, 1, CAST(N'2022-09-05T09:07:38.343' AS DateTime), NULL)
GO
INSERT [dbo].[Order] ([OrderId], [UserId], [DateAdded], [DateUpdated]) VALUES (4, 1, CAST(N'2022-09-05T09:09:56.353' AS DateTime), NULL)
GO
INSERT [dbo].[Order] ([OrderId], [UserId], [DateAdded], [DateUpdated]) VALUES (5, 1, CAST(N'2022-09-05T09:18:21.310' AS DateTime), NULL)
GO
INSERT [dbo].[Order] ([OrderId], [UserId], [DateAdded], [DateUpdated]) VALUES (6, 1, CAST(N'2022-09-05T12:21:41.760' AS DateTime), NULL)
GO
INSERT [dbo].[Order] ([OrderId], [UserId], [DateAdded], [DateUpdated]) VALUES (7, 6, CAST(N'2022-09-05T13:15:46.723' AS DateTime), NULL)
GO
INSERT [dbo].[Order] ([OrderId], [UserId], [DateAdded], [DateUpdated]) VALUES (8, 6, CAST(N'2022-09-05T13:17:13.913' AS DateTime), NULL)
GO
INSERT [dbo].[Order] ([OrderId], [UserId], [DateAdded], [DateUpdated]) VALUES (9, 6, CAST(N'2022-09-05T13:26:31.380' AS DateTime), NULL)
GO
SET IDENTITY_INSERT [dbo].[Order] OFF
GO
SET IDENTITY_INSERT [dbo].[OrderItem] ON 

GO
INSERT [dbo].[OrderItem] ([OrderItemId], [OrderId], [Quantity], [ProductId]) VALUES (3, 5, 1, 4)
GO
INSERT [dbo].[OrderItem] ([OrderItemId], [OrderId], [Quantity], [ProductId]) VALUES (4, 5, 1, 3)
GO
INSERT [dbo].[OrderItem] ([OrderItemId], [OrderId], [Quantity], [ProductId]) VALUES (5, 5, 2, 2)
GO
INSERT [dbo].[OrderItem] ([OrderItemId], [OrderId], [Quantity], [ProductId]) VALUES (6, 6, 2, 3)
GO
INSERT [dbo].[OrderItem] ([OrderItemId], [OrderId], [Quantity], [ProductId]) VALUES (7, 6, 1, 2)
GO
INSERT [dbo].[OrderItem] ([OrderItemId], [OrderId], [Quantity], [ProductId]) VALUES (8, 6, 1, 1)
GO
INSERT [dbo].[OrderItem] ([OrderItemId], [OrderId], [Quantity], [ProductId]) VALUES (9, 7, 1, 10)
GO
INSERT [dbo].[OrderItem] ([OrderItemId], [OrderId], [Quantity], [ProductId]) VALUES (10, 7, 2, 11)
GO
INSERT [dbo].[OrderItem] ([OrderItemId], [OrderId], [Quantity], [ProductId]) VALUES (11, 8, 2, 3)
GO
INSERT [dbo].[OrderItem] ([OrderItemId], [OrderId], [Quantity], [ProductId]) VALUES (12, 9, 1, 6)
GO
INSERT [dbo].[OrderItem] ([OrderItemId], [OrderId], [Quantity], [ProductId]) VALUES (13, 9, 1, 5)
GO
INSERT [dbo].[OrderItem] ([OrderItemId], [OrderId], [Quantity], [ProductId]) VALUES (14, 9, 1, 7)
GO
INSERT [dbo].[OrderItem] ([OrderItemId], [OrderId], [Quantity], [ProductId]) VALUES (15, 9, 1, 8)
GO
SET IDENTITY_INSERT [dbo].[OrderItem] OFF
GO
SET IDENTITY_INSERT [dbo].[Product] ON 

GO
INSERT [dbo].[Product] ([ProductId], [ProductName], [ProductImage], [ProductPrice], [Quantity], [DateAdded], [DateUpdated]) VALUES (1, N'Product A', N'https://cdn.shopify.com/s/files/1/0047/4054/6631/products/1e12572304b441d924b126c5c69b5719_180x.jpg?', CAST(1002.56 AS Decimal(18, 2)), 3, CAST(N'2022-09-02T20:44:37.437' AS DateTime), NULL)
GO
INSERT [dbo].[Product] ([ProductId], [ProductName], [ProductImage], [ProductPrice], [Quantity], [DateAdded], [DateUpdated]) VALUES (2, N'Product B', N'https://cdn.shopify.com/s/files/1/0047/4054/6631/products/6523b010db1f5a8e117624290ce92d01_180x.jpg?', CAST(500.26 AS Decimal(18, 2)), 2, CAST(N'2022-09-02T20:47:11.540' AS DateTime), NULL)
GO
INSERT [dbo].[Product] ([ProductId], [ProductName], [ProductImage], [ProductPrice], [Quantity], [DateAdded], [DateUpdated]) VALUES (3, N'Product C', N'https://images.puma.com/image/upload/f_auto,q_auto,b_rgb:fafafa/global/194917/11/sv01/fnd/ZAF/w/320/h/320/fmt/png', CAST(2000.45 AS Decimal(18, 2)), 5, CAST(N'2022-09-02T20:48:12.257' AS DateTime), NULL)
GO
INSERT [dbo].[Product] ([ProductId], [ProductName], [ProductImage], [ProductPrice], [Quantity], [DateAdded], [DateUpdated]) VALUES (4, N'Product D', N'https://cdn.shopify.com/s/files/1/0047/4054/6631/products/b299b3a93ba415f05683192b05e5c4a4_180x.jpg', CAST(700.00 AS Decimal(18, 2)), 3, CAST(N'2022-09-02T20:48:43.950' AS DateTime), NULL)
GO
INSERT [dbo].[Product] ([ProductId], [ProductName], [ProductImage], [ProductPrice], [Quantity], [DateAdded], [DateUpdated]) VALUES (5, N'Product E', N'https://images.puma.com/image/upload/f_auto,q_auto,b_rgb:fafafa/global/194449/13/sv01/fnd/ZAF/w/320/h/320/fmt/png', CAST(1500.96 AS Decimal(18, 2)), 1, CAST(N'2022-09-02T20:49:21.363' AS DateTime), NULL)
GO
INSERT [dbo].[Product] ([ProductId], [ProductName], [ProductImage], [ProductPrice], [Quantity], [DateAdded], [DateUpdated]) VALUES (6, N'Product F', N'https://images.puma.com/image/upload/f_auto,q_auto,b_rgb:fafafa/global/106668/01/sv01/fnd/ZAF/w/320/h/320/fmt/png', CAST(1475.00 AS Decimal(18, 2)), 6, CAST(N'2022-09-02T20:49:52.130' AS DateTime), NULL)
GO
INSERT [dbo].[Product] ([ProductId], [ProductName], [ProductImage], [ProductPrice], [Quantity], [DateAdded], [DateUpdated]) VALUES (7, N'Product G', N'https://image.tfgmedia.co.za/image/1/process/486x486?source=https://cdn.tfgmedia.co.za/13/ProductImages/59198738.jpg', CAST(2457.00 AS Decimal(18, 2)), 10, CAST(N'2022-09-02T20:50:26.200' AS DateTime), NULL)
GO
INSERT [dbo].[Product] ([ProductId], [ProductName], [ProductImage], [ProductPrice], [Quantity], [DateAdded], [DateUpdated]) VALUES (8, N'Product H', N'https://assets.adidas.com/images/w_450,f_auto,q_auto/1a2138b19ed645afaa97aec400cb2d40_9366/GY1649_012_hover_standard.jpg', CAST(1474.00 AS Decimal(18, 2)), 2, CAST(N'2022-09-02T20:50:58.163' AS DateTime), NULL)
GO
INSERT [dbo].[Product] ([ProductId], [ProductName], [ProductImage], [ProductPrice], [Quantity], [DateAdded], [DateUpdated]) VALUES (9, N'Product I', N'https://assets.adidas.com/images/w_450,f_auto,q_auto/99019a993f144b8abb69aeed00c391b3_9366/GZ4901_012_hover_standard.jpg', CAST(1064.00 AS Decimal(18, 2)), 3, CAST(N'2022-09-02T20:51:21.470' AS DateTime), NULL)
GO
INSERT [dbo].[Product] ([ProductId], [ProductName], [ProductImage], [ProductPrice], [Quantity], [DateAdded], [DateUpdated]) VALUES (10, N'Product J', N'https://image.tfgmedia.co.za/image/1/process/486x486?source=https://cdn.tfgmedia.co.za/13/ProductImages/59397082.jpg', CAST(920.58 AS Decimal(18, 2)), 1, CAST(N'2022-09-02T20:51:47.830' AS DateTime), NULL)
GO
INSERT [dbo].[Product] ([ProductId], [ProductName], [ProductImage], [ProductPrice], [Quantity], [DateAdded], [DateUpdated]) VALUES (11, N'Product K', N'https://image.tfgmedia.co.za/image/1/process/486x486?source=https://cdn.tfgmedia.co.za/13/ProductImages/59397082.jpg', CAST(1035.00 AS Decimal(18, 2)), 2, CAST(N'2022-09-02T20:52:19.833' AS DateTime), NULL)
GO
INSERT [dbo].[Product] ([ProductId], [ProductName], [ProductImage], [ProductPrice], [Quantity], [DateAdded], [DateUpdated]) VALUES (12, N'Product L', N'https://image.tfgmedia.co.za/image/1/process/486x486?source=https://cdn.tfgmedia.co.za/13/ProductImages/59624201.jpg', CAST(302.44 AS Decimal(18, 2)), 1, CAST(N'2022-09-02T20:52:48.160' AS DateTime), NULL)
GO
SET IDENTITY_INSERT [dbo].[Product] OFF
GO
ALTER TABLE [dbo].[AppUsers] ADD  CONSTRAINT [DF_AppUsers_DateAdded]  DEFAULT (getdate()) FOR [DateAdded]
GO
ALTER TABLE [dbo].[AppUsers] ADD  CONSTRAINT [DF_AppUsers_IsActive]  DEFAULT ((1)) FOR [IsActive]
GO
ALTER TABLE [dbo].[Order] ADD  CONSTRAINT [DF_Order_DateAdded]  DEFAULT (getdate()) FOR [DateAdded]
GO
ALTER TABLE [dbo].[Product] ADD  CONSTRAINT [DF_Product_ProductPrice]  DEFAULT ((0)) FOR [ProductPrice]
GO
ALTER TABLE [dbo].[Product] ADD  CONSTRAINT [DF_Product_Quantity]  DEFAULT ((0)) FOR [Quantity]
GO
ALTER TABLE [dbo].[Product] ADD  CONSTRAINT [DF_Product_DateAdded]  DEFAULT (getdate()) FOR [DateAdded]
GO
ALTER TABLE [dbo].[Order]  WITH CHECK ADD  CONSTRAINT [FK_Order_AppUsers] FOREIGN KEY([UserId])
REFERENCES [dbo].[AppUsers] ([UserId])
GO
ALTER TABLE [dbo].[Order] CHECK CONSTRAINT [FK_Order_AppUsers]
GO
ALTER TABLE [dbo].[OrderItem]  WITH CHECK ADD  CONSTRAINT [FK_OrderItem_Order] FOREIGN KEY([OrderId])
REFERENCES [dbo].[Order] ([OrderId])
GO
ALTER TABLE [dbo].[OrderItem] CHECK CONSTRAINT [FK_OrderItem_Order]
GO
ALTER TABLE [dbo].[OrderItem]  WITH CHECK ADD  CONSTRAINT [FK_OrderItem_Product] FOREIGN KEY([ProductId])
REFERENCES [dbo].[Product] ([ProductId])
GO
ALTER TABLE [dbo].[OrderItem] CHECK CONSTRAINT [FK_OrderItem_Product]
GO
USE [master]
GO
ALTER DATABASE [BetSoftwareOnlineShop] SET  READ_WRITE 
GO
