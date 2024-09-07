#!/bin/sh

echo "Deleting old framework..."
rm -rf UIConfig.xcframework

echo "Archiving iOS framework..."
xcodebuild archive -scheme UIConfig -destination "generic/platform=iOS" -archivePath ./UIConfig SKIP_INSTALL=NO BUILD_LIBRARY_FOR_DISTRIBUTION=YES

echo "Archivomg iOS Simulator framework..."
xcodebuild archive -scheme UIConfig -destination "generic/platform=iOS Simulator" -archivePath ./UIConfig-Sim SKIP_INSTALL=NO BUILD_LIBRARY_FOR_DISTRIBUTION=YES

echo "Creating framework..."
xcodebuild -create-xcframework -framework ./UIConfig.xcarchive/Products/Library/Frameworks/UIConfig.framework/ -framework ./UIConfig-Sim.xcarchive/Products/Library/Frameworks/UIConfig.framework/ -output ./UIConfig.xcframework
