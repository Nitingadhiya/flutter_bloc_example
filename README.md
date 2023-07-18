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

step1 = start with domain layer
step2 = create Entities, base on API response
step3 = Handle error and server failure requests, create a "Core directory >> error directory
failure.dart>>"
step4 = Create a file inside "domain >> repositories >>  login_repositories""
step 5 = Inside domain >> repositories >> login_repositories, declare methods and pass parameters
step6 = Create domain >> usecase >> login_email_password_usecase.dart
step7 = get data from repository, so declare repositories as constructions
step 8 = call repository method from login_email_password_usecase
step9 = After that we go to the >> core >> usecases >> usecases.dart
step 10 = login_email_password_usecase, "implementation UseCase" so we can access core
step11 = login_email_password_usecase, "Create a Params class and use it."

step12 = Create another Usecase for "login with phone & password"
step13 = Go to the "Domain >> entities " check the api response but it's same as it "login with
email"
step14 = Go to the "Domain >> repositories" create a repisitory method and pass parameters
step15 = Create a new "login with phone & password" for usecase
step16 = do the necessary changes as per usecase

--------------Next Step is DATA-------------

step17 = models >> create "login_auth_token_model.dart"
step18 = using login_auth_entities files data in model files.
step19 = using fromJson methods, convert json to model data & return to model

1:55:16

//Why ? meta package imports
=> construction make them required

Domain Layer completely independent of outside layers (includes json, deserialization, serilization)
anohter exmaple, If we change api response json to XML, "domain layer" will be not affected.

models => Extend entity, like conversation json,model
