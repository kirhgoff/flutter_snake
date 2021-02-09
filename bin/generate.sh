#!/usr/bin/env bash
mkdir -p ./android/app/src/main/java/dev/flutter/pigeon/

flutter pub run pigeon \
  --input pigeon/messages.dart \
  --dart_out lib/messages.dart \
  --objc_header_out ./ios/Runner/pigeon.h \
  --objc_source_out ./ios/Runner/pigeon.m \
  --java_out ./android/app/src/main/java/dev/flutter/pigeon/Pigeon.java \
  --java_package "dev.flutter.pigeon"