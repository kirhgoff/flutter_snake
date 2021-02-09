#!/usr/bin/env bash
rm -rf ./build/*
flutter build ios-framework --xcframework --no-universal --output=./build