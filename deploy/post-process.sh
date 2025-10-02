# `flutter build web` 이후에 실행할 것.
# https://lukasnevosad.medium.com/our-flutter-web-strategy-for-deferred-loading-instant-updates-happy-users-45ed90a7727c

# Get version from version.json
VERSION=$(sed -n 's|.*"version":"\([^"]*\)".*|\1|p' "$FOLDER/version.json")

# Create Distribution Directory: It creates a clean target distribution directory (e.g., `dist`).
rm -rf "$TARGET_FOLDER"
mkdir "$TARGET_FOLDER"

# FOLDER=build/web, TARGET_FOLDER=dist
mv "$FOLDER" "$TARGET_FOLDER/$VERSION"

# Elevate Key Files
mv "$TARGET_FOLDER/$VERSION/index.html" "$TARGET_FOLDER"
cp "$TARGET_FOLDER/$VERSION/version.json" "$TARGET_FOLDER"

# On macOS, sed needs an explicit extension with -i
sed -i.bak "s|<base href=\"/\" />|<base href=\"/$VERSION/\" />|g" "$TARGET_FOLDER/index.html"
rm "$TARGET_FOLDER/index.html.bak"