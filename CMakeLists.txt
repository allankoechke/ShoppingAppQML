cmake_minimum_required(VERSION 3.16)

project(AEShopping VERSION 0.1 LANGUAGES CXX)

set(CMAKE_CXX_STANDARD_REQUIRED ON)

find_package(Qt6 6.4 REQUIRED COMPONENTS Quick)

qt_standard_project_setup()

qt_add_executable(appAEShopping
    main.cpp
)

qt_add_qml_module(appAEShopping
    URI AEShopping
    VERSION 1.0
    RESOURCES
        assets/arrow-l.svg assets/arrow-r.svg assets/cart.svg assets/pin.svg assets/share.svg assets/shop.svg
        qml/theme/qmldir
        assets/more.svg assets/image.svg assets/star.svg assets/truck.svg
        assets/products/im1.jpg assets/products/im2.jpg assets/products/im3.jpg assets/products/im4.jpg assets/products/im5.jpg assets/products/im6.jpg assets/products/im7.jpg assets/products/im8.jpg assets/products/im9.jpg assets/products/im10.jpg assets/products/im11.jpg assets/products/im12.jpg assets/products/im13.jpg assets/products/im14.jpg assets/products/im15.jpg
        assets/logo.png
    QML_FILES
        qml/Main.qml
        qml/views/Dashboard.qml qml/views/ProductView.qml
        qml/theme/AppTheme.qml
        qml/models/ProductsModel.qml
        qml/components/AddCartBtn.qml qml/components/AddToCartWidget.qml qml/components/AppStack.qml qml/components/HeaderWidget.qml qml/components/IconButton.qml qml/components/ProductDelegate.qml
        qml/components/RoundedImage.qml
        qml/components/MorePopup.qml
)

# Qt for iOS sets MACOSX_BUNDLE_GUI_IDENTIFIER automatically since Qt 6.1.
# If you are developing for iOS or macOS you should consider setting an
# explicit, fixed bundle identifier manually though.
set_target_properties(appAEShopping PROPERTIES
#    MACOSX_BUNDLE_GUI_IDENTIFIER com.example.appAEShopping
    MACOSX_BUNDLE_BUNDLE_VERSION ${PROJECT_VERSION}
    MACOSX_BUNDLE_SHORT_VERSION_STRING ${PROJECT_VERSION_MAJOR}.${PROJECT_VERSION_MINOR}
    MACOSX_BUNDLE TRUE
    WIN32_EXECUTABLE TRUE
)

target_link_libraries(appAEShopping
    PRIVATE Qt6::Quick
)

include(GNUInstallDirs)
install(TARGETS appAEShopping
    BUNDLE DESTINATION .
    LIBRARY DESTINATION ${CMAKE_INSTALL_LIBDIR}
    RUNTIME DESTINATION ${CMAKE_INSTALL_BINDIR}
)
