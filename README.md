# flutterfire_gen_todo

## Install

```sh
fvm install
fvm flutter pub get
```

If you want to connect with your Firebase Project:

```sh
flutterfire configure
```

## Generate code

This project is using flutterfire_gen and riverpod_generator. When updating existing files, run build_runner to generate codes.

```sh
fvm flutter pub run build_runner watch --delete-conflicting-outputs
```

## More information

To get more information about flutterfire_gen, see:

<https://github.com/kosukesaigusa/flutterfire_gen/blob/main/packages/flutterfire_gen/README.md>
