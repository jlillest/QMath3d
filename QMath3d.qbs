import qbs.base 1.0

DynamicLibrary {
    name: "QMath3d"
    Depends { name: "cpp" }
    Depends { name: "Qt"; submodules: [ "core", "gui"] }

    Group {
        fileTagsFilter: ["dynamiclibrary"]
        qbs.install: true
    }

    Export {
        Depends { name: "cpp" }
        cpp.includePaths: ["."]
    }

    files: [
        "qbox3d.h",
        "qplane3d.h",
        "qray3d.h",
        "qsphere3d.h",
        "qtriangle3d.h",
        "qbox3d.cpp",
        "qplane3d.cpp",
        "qray3d.cpp",
        "qsphere3d.cpp",
        "qtriangle3d.cpp",
        "smallqt3d_global.h"
    ]

    cpp.includePaths: [
        "."
    ]

    Properties {
        condition: qbs.targetOS.contains("windows")
        cpp.defines: ["Q_MATH_3D"]
    }

    Properties {
        condition: qbs.targetOS.contains("linux")
        cpp.defines: [
			"Q_MATH_3D",
			"QT_NO_DEBUG_OUTPUT"
		     ]
    }
}
