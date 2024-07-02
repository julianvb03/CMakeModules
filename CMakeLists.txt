CMAKE_MINIMUM_REQUIRED(VERSION 3.18)
PROJECT(ModulesTests LANGUAGES NONE
        DESCRIPTION "CMake for thest the correct functionality of the modules")

LIST(APPEND CMAKE_MODULE_PATH "${CMAKE_CURRENT_LIST_DIR}/CMake")
INCLUDE(FindModulesPF)
INCLUDE(ColorizedMessages)

SET(TESTS_PKG "uuid" "openblas" "ompi")

FOREACH(TEST ${TESTS_PKG})
    search_with_pkg(${TEST})
    IF(FOUND_PKG)
        MESSAGE(STATUS "${TEST} Founded")
    ELSE()
        MESSAGE(STATUS "${TEST} Not founded")
    ENDIF()
ENDFOREACH()


print_colored_message(0 "Este es un mensaje en negro")
print_colored_message(1 "Este es un mensaje en rojo")
print_colored_message(2 "Este es un mensaje en azul")
