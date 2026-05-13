# Qt for Qt Bridge - Swift

> Copyright (C) 2025 The Qt Company Ltd.
> SPDX-License-Identifier: LicenseRef-Qt-Commercial OR LGPL-3.0-only

This folder contains the files required to build a local Qt package for Qt Bridge for Swift.

## Building Qt package

### 1. Create Qt package folder

Create a folder named Qt next to the qtbridges-swift folder. Then copy the following files
and directories into the Qt folder:

- Package.swift
- bundle.swift
- include/_spmQtQmlIntegration.cpp
- lib/_spmQtCore.cpp
- lib/_spmQtCorePrivate
- lib/_spmQtCorePrivateWithoutPrefix
- lib/_spmQtGui
- lib/_spmQtQml
- lib/_spmQtTest

Make sure the directory structure inside the Qt folder matches the paths listed above.

**This newly created Qt folder is our local Qt package and will be referred to as `/path/to/Qt` in these instructions.**

### 2. Build Qt 6.11.1 from source

Check out the tutorial on how to [build Qt from source](https://wiki.qt.io/Building_Qt_6_from_Git), or follow the simplified instructions below.

Navigate to the directory that will contain the top-level **qt6** repository and run the following command to clone it:
```sh
git clone git://code.qt.io/qt/qt5.git qt6
```

Qt Bridge depends on **Qt 6.11.1**, so switch to the corresponding branch:
```sh
cd qt6
git switch 6.11.1
```

Next, fetch the submodule source code by running the following command from the `qt6` directory:
```sh
./init-repository
```

Create a separate build directory parallel to the source directory:
```sh
cd ..
mkdir qt6-build
cd qt6-build
```

From the build directory, configure, build, and install Qt 6. Pass the desired installation path using the `-prefix` parameter:

```sh
../qt6/configure \
   -release \
   -prefix your_qt_install_dir \
   -nomake tests \
   -nomake examples \
   -force-debug-info \
   -disable-deprecated-up-to 0x070000 \
   -no-feature-widgets \
   -no-feature-sql \
   -no-feature-printsupport \
   -no-feature-dbus \
   -no-feature-vnc \
   -no-feature-picture \
   -no-feature-pdf \
   --module-subset=qtbase,qtdeclarative

cmake --build . --parallel

cmake --install .
```
### 3. Create .xcframeworks for the Qt package

Navigate to `your_qt_install_dir/lib` folder and create .xcframework from each .framework:
```sh
cd your_qt_install_dir/lib

for fw in *.framework; do
  name="${fw%.framework}"
  xcodebuild -create-xcframework \
    -framework "$fw" \
    -output "${name}.xcframework"
done
```

### 4. Copy .xcframeworks into local Qt package folder

Place the newly created .xcframeworks into the `path/to/Qt/lib/Frameworks` directory:

```sh
mkdir /path/to/Qt/lib/Frameworks
mv *.xcframework /path/to/Qt/lib/Frameworks
```

### 5. Copy Qt headers into the Qt package

Copy `QtQmlIntegration` folder from `your_qt_install_dir/include` into the `path/to/Qt/include` directory:

```sh
cp -R ../include/QtQmlIntegration /path/to/Qt/include
```

### 6. Copy plugins into the Qt package

Copy `qml` and `plugins` folders from `your_qt_install_dir` into the root of the Qt package:

```sh
cp -R ../qml /path/to/Qt
cp -R ../plugins /path/to/Qt
```

### 7. Qt package is ready
At this point, the Qt package is ready and its structure should look like this:

```
Qt
├── Package.swift
├── bundle.swift
├── include
│ ├── QtQmlIntegration
│ └── _spmQtQmlIntegration.cpp
├── lib
│ ├── Frameworks
│ │ ├── QtCore.xcframework
│ │ ├── QtGui.xcframework
│ │ ├── QtQml.xcframework
│ │ └── ...
│ ├── _spmQtCore.cpp
│ └── ...
├── plugins
│ ├── platforms
│ └── ...
└── qml
  ├── QtCore
  └──...
```

### 8. Build Qt package
To check if the package compiles without issues, run from terminal:
```sh
cd Qt
swift build
```

## Need help?

Feel free to ask on our [Qt Bridges forum](https://forum.qt.io/category/78/qt-bridges)
or join the [Qt Bridges Discord](https://discord.com/invite/WNdGHnHagP) server.

## Terms and Conditions

If you, your employer, or the legal entity you act on behalf of hold commercial license(s) with a Qt
Group entity, Qt Bridges constitutes Pre-Release Code under the Qt License/Frame Agreement governing
those licenses, and that agreement's terms and conditions relating to Pre-Release Code apply to your
use of Qt Bridges as found in this repo.
This Qt Bridges repo may provide links or access to third-party libraries or code (collectively
"Third-Party Software") to implement various functions. Use or distribution of Third-Party Software
is discretionary and in all respects subject to applicable license terms of applicable third-party
right holders.

### Additional Terms and Conditions

The Qt Bridge for Swift is built using the Swift programming language and related tools provided by
the Swift Project.
Swift and its associated components are licensed under the Apache License, Version 2.0 with Runtime
Library Exception
