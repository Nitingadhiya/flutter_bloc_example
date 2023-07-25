# flutter_bloc_example

A new Flutter project.

## Getting Started

This project is a starting point for a Flutter application.

A few resources to get you started if this is your first Flutter project:

- [Lab: Write your first Flutter app](https://docs.flutter.dev/get-started/codelab)
- [Cookbook: Useful Flutter samples](https://docs.flutter.dev/cookbook)

For help getting started with Flutter development, view the
[online documentation](https://docs.flutter.dev/), which offers tutorials,
samples, guidance on mobile development, and a full API reference.

##

Entities, respositories, and usecases
--------------Start Step is DOMAIN layer-------------

- step1 = start with domain layer
- step2 = create Entities, base on API response
- step3 = Handle error and server failure requests, create a "Core directory >> error directory
  failure.dart>>"
- step4 = Create a file inside "domain >> repositories >>  login_repositories""
- step 5 = Inside domain >> repositories >> login_repositories, declare methods and pass parameters
- step6 = Create domain >> usecase >> login_email_password_usecase.dart
- step7 = get data from repository, so declare repositories as constructions
- step 8 = call repository method from login_email_password_usecase
- step9 = After that we go to the >> core >> usecases >> usecases.dart
- step 10 = login_email_password_usecase, "implementation UseCase" so we can access core
- step11 = login_email_password_usecase, "Create a Params class and use it."

- step12 = Create another Usecase for "login with phone & password"
- step13 = Go to the "Domain >> entities " check the api response but it's same as it "login with
  email"
- step14 = Go to the "Domain >> repositories" create a repisitory method and pass parameters
- step15 = Create a new "login with phone & password" for usecase
- step16 = do the necessary changes as per usecase

--------------Next Step is DATA layer-------------

- step17 = models >> create "login_auth_token_model.dart"
- step18 = using login_auth_entities files data in model files. (extends in model)
- step19 = using fromJson methods, convert json to model data & return to model (json convert to
  dart
  object(class))
- step20 = Implement toJson method, return map string dynamic (Only show some values, it's convert
  dart object to json)
- step21 = create a repositories inside "data" (data > repositories)
- step22 = create a "implements" class, LoginEmailPasswordRepository class
- step23 = create missing override (Repositories need lower level data sources get actual data
  sources)
- step24 = create contract for data sources (LoginEmailPasswordRepositoryImpl class)
- step25 = before create data sources for local and remote, let's first create a network info
  contract
- step26 = create "network" directory
- step27 = create simple abstract class bcz remember we are creating simple contracts
- step28 = Now move on remote data source,
- step29 = It's almost identical of "Domain layer repository"

Repositories JOB =>
remote data source only return response not getting deal with failure part, instead throw exception
Remote data source have own boundary between our code and unfriendly & unpredictable outside world
of third party library and api

that's why it's going throw exceptions, job of repository to cache those exceptions and convert to
failure

- step30 = create a file inside dataSources >> remote_data_source && create class
- step31 = copy method from domain >> repository(login_email_password_repositories.dart file)
- step32 = Paste inside "remote_data_source" file and return only success response
- step33 = return Future<LoginAuthTokenModel> (Why?? => Because it's return api response (Only
  success
  part))
- step34 = create a exceptions.dart file << "error" directory
- step35 = create a "ServerException" class && "CacheException" class with implements
- step36 = CacheException => thrown from within local data sources whenever cache errors happen
- step37 = OPTIONAL - steps

you can use any field inside this exception
final string message;
ServerException(this.message);

if you want to pass any message inside with exception
-----------------

- step38 = Copy (ServerException and CacheException) exceptions and paste inside "failures.dart"
  Why ?? => Bcz this are general failures

- step39 = change ServerException to ServerFailure extends as a "Failures"
- step40 = back to LoginEmailPasswordRemoteDataSource => Getting data whether
  Entity => inside repositories
  model => inside remote data sources

Caching policy => always to cache and retrieve last data from the remote data sources

- step41 = create local data source "LoginEmailPasswordLocalDataSource"
- step42 = create a class for gets cached values
- step43 = Now, we are using RemoteDataSource && local data source && network info inside
  repositories (data layer)

- step44 = Data layer >> repositories >> Fresh data from API when internet connection && then we
  also
  cache locally, find out If there is no internet connection find out from cache

- step55 = first we need to check there is internet connection
- step56 = get try to data from remote data sources & cache data to local data sources (If Part)
- step57 = now, handle try & serverException => server failures
- step58 = no internet connection, get data from local data sources(cache data) (Else Part)
- step59 = now, handle try & cacheException => cache failures
- step60 = same things follow for LoginWithPhone
- step61 = create a common function and use inside both functions.
- step62 = Next part we implement local data source "localDataSourceImpl"
- step63 = Let's use sharedPreferences and create constructor
- step64 = convert to json data source & going to store json
- step65 = added if condition, if storage key null
- step66 = We do not depend on the repository from the data source we do not care at all what the
  repository is doing and that's beauty of clean architecture you can always work on just the piece
  of
  code that you are working on currently and you do not need to worry about all of the other places
  from which the code....

- step67 = Now, go to data_source and create "remoteDataSourceImpl"
- step68 = Now work on Http
- step69 = Integrate API

Domain and data layer already implemented only presentation layer remaining

--------------Next Step is Presentation layer-------------

- step70 = presentation layer which is the block or in other words presentation logic holder
  Presentation layer (widgets + presentation logic holder)
  In bloc => whole data layer implemented in the last part we finished

inside clean architecture all of the domain the business logic is already contained inside the
domain layer so the block will in fact hold only some presentation logic of transforming the input
data and all of that kind of stuff now.

Events => Bloc => State

- Events are dispatched from the ui widget and they arrive inside the bloc
- the block receives events and executes some appropriate business logic in the case of clean
  architecture it's just going to call a use case and then once the use case spits out some data
  that data will be put into a state and that state will be emitted from the block back to the ui
  widget which will do something useful with that state and the data contained inside the state and
  they will display something nice to the user on the screen.

- step71 = Now start working on bloc
- step72 = do not put any logic inside classes where it doesn't belong and that goes most definitely
  for the ui widget and also for something like events follow the single responsibility principle
  and you'll be good to go and in flutter this is absolutely necessary because as you know ui is
  written
  in the same language as the logic is written in the dart so it's really easy to put logic
  throughout
  your ui widgets but by doing that you get rid of any benefits which the clean architecture and
  test driven developments.

- step73 = convert string to int - create a "input converter dart file" inside utils folder
- step74 = create InputConverter class
- step75 = create a InvalidInputFailure class
- step76 = Work on input-converter class
- step77 = Then, start working on LoginBloc class (return output from bloc and state hold the data)
- step78 = Now, create a state class as per required
  Empty class, Loading, Loaded, Error, and
- step79 = Explanation => Bloc already works with Events, state (We define in bloc file)
- step80 = boundary between presentation and domain layer connect with use case
- step81 = Start do coding in bloc file (Inside bloc file their is no any logic)
- step82 = Register event listener & do code as per required
- step83 = Do code based on requirements
- step84 = emit state and ui rebuild (Only inside blocBuilder)
- step85 = Now, work on dependencies injected
- step86 = Fix errors or bugs
- step87 = Enjoy error free workflow!!
  //////

//Why ? meta package imports
=> construction make them required

Domain Layer completely independent of outside layers (includes json, deserialization,
serialization)
another example, If we change api response json to XML, "domain layer" will be not affected.

models => Extend entity, like conversation json,model
