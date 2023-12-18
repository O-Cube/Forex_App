cmake_minimum_required(VERSION 3.16)

project(DataScrapping VERSION 0.1 LANGUAGES CXX)

set(CMAKE_CXX_STANDARD_REQUIRED ON)

find_package(Qt6 6.4 REQUIRED COMPONENTS Quick)

qt_standard_project_setup()

qt_add_executable(appDataScrapping
    main.cpp
)

qt_add_qml_module(appDataScrapping
    URI DataScrapping
    VERSION 1.0
    QML_FILES Main.qml
    RESOURCES images/green_arrow.png images/red_arrow.png
    QML_FILES content/StockInfoBlock.qml
    QML_FILES content/StockInfoBelt.qml
    SOURCES stockinformation.h stockinformation.cpp
    QML_FILES content/StockCanvas.qml
    QML_FILES content/StockLegend.qml
    QML_FILES content/StockDisplay.qml
)

# Qt for iOS sets MACOSX_BUNDLE_GUI_IDENTIFIER automatically since Qt 6.1.
# If you are developing for iOS or macOS you should consider setting an
# explicit, fixed bundle identifier manually though.
set_target_properties(appDataScrapping PROPERTIES
#    MACOSX_BUNDLE_GUI_IDENTIFIER com.example.appDataScrapping
    MACOSX_BUNDLE_BUNDLE_VERSION ${PROJECT_VERSION}
    MACOSX_BUNDLE_SHORT_VERSION_STRING ${PROJECT_VERSION_MAJOR}.${PROJECT_VERSION_MINOR}
    MACOSX_BUNDLE TRUE
    WIN32_EXECUTABLE TRUE
)

target_link_libraries(appDataScrapping
    PRIVATE Qt6::Quick
)

include(GNUInstallDirs)
install(TARGETS appDataScrapping
    BUNDLE DESTINATION .
    LIBRARY DESTINATION ${CMAKE_INSTALL_LIBDIR}
    RUNTIME DESTINATION ${CMAKE_INSTALL_BINDIR}
)
