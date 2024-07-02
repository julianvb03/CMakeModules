# ColorizedMessages.cmake

SET(COLORIZED_MESSAGES ON)

IF(${CMAKE_SYSTEM_NAME} STREQUAL "Linux" AND COLORIZED_MESSAGES)
    STRING(ASCII 27 ESC)
    SET(COLORIZED ON)

    SET(COLOR_BLACK 0)
    SET(COLOR_RED 1)
    SET(COLOR_GREEN 2)
    SET(COLOR_YELLOW 3)
    SET(COLOR_BLUE 4)
    SET(COLOR_MAGENTA 5)
    SET(COLOR_CYAN 6)
    SET(COLOR_WHITE 7)

    SET(COLOR_BRIGHT_YELLOW 8)
    SET(COLOR_BRIGHT_MAGENTA 9)
    SET(COLOR_BRIGHT_CYAN 10)
ELSE()
    SET(COLORRIZED OFF)
ENDIF()

FUNCTION(get_color_code COLOR_CODE COLOR_VAR)
    IF(${COLOR_CODE} EQUAL ${COLOR_BLACK})
        SET(${COLOR_VAR} "${ESC}[30m" PARENT_SCOPE)
    ELSEIF(${COLOR_CODE} EQUAL ${COLOR_RED})
        SET(${COLOR_VAR} "${ESC}[31m" PARENT_SCOPE)
    ELSEIF(${COLOR_CODE} EQUAL ${COLOR_GREEN})
        SET(${COLOR_VAR} "${ESC}[32m" PARENT_SCOPE)
    ELSEIF(${COLOR_CODE} EQUAL ${COLOR_YELLOW})
        SET(${COLOR_VAR} "${ESC}[33m" PARENT_SCOPE)
    ELSEIF(${COLOR_CODE} EQUAL ${COLOR_BLUE})
        SET(${COLOR_VAR} "${ESC}[34m" PARENT_SCOPE)
    ELSEIF(${COLOR_CODE} EQUAL ${COLOR_MAGENTA})
        SET(${COLOR_VAR} "${ESC}[35m" PARENT_SCOPE)
    ELSEIF(${COLOR_CODE} EQUAL ${COLOR_CYAN})
        SET(${COLOR_VAR} "${ESC}[36m" PARENT_SCOPE)
    ELSEIF(${COLOR_CODE} EQUAL ${COLOR_WHITE})
        SET(${COLOR_VAR} "${ESC}[37m" PARENT_SCOPE)
    ELSEIF(${COLOR_CODE} EQUAL ${COLOR_BRIGHT_YELLOW})
        SET(${COLOR_VAR} "${ESC}[93m" PARENT_SCOPE)
    ELSEIF(${COLOR_CODE} EQUAL ${COLOR_BRIGHT_MAGENTA})
        SET(${COLOR_VAR} "${ESC}[95m" PARENT_SCOPE)
    ELSEIF(${COLOR_CODE} EQUAL ${COLOR_BRIGHT_CYAN})
        SET(${COLOR_VAR} "${ESC}[96m" PARENT_SCOPE)
    ELSE()
        MESSAGE(WARNING "Unknown color code: ${COLOR_CODE}")
        SET(${COLOR_VAR} "${ESC}" PARENT_SCOPE)
    ENDIF()
ENDFUNCTION()

MACRO(print_colored_message COLOR_CODE MESSAGE)
    IF(NOT COLORIZED)
        MESSAGE(STATUS "${MESSAGE}")
    ELSE()
        get_color_code(${COLOR_CODE} COLOR)
        MESSAGE(STATUS "${COLOR}${MESSAGE}${ESC}[0m")
    ENDIF()
ENDMACRO()