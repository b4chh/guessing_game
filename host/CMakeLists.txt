add_custom_command(
  OUTPUT game_u.h game_u.c game_args.h
  DEPENDS ${CMAKE_SOURCE_DIR}/game.edl
  COMMAND
    openenclave::oeedger8r --untrusted ${CMAKE_SOURCE_DIR}/game.edl
    --search-path ${OE_INCLUDEDIR} --search-path
    ${OE_INCLUDEDIR}/openenclave/edl/sgx)

add_executable(game_host
               host.cpp ${CMAKE_CURRENT_BINARY_DIR}/game_u.c)

if (WIN32)
  copy_oedebugrt_target(game_host_oedebugrt)
  add_dependencies(game_host game_host_oedebugrt)
endif ()

target_include_directories(
  game_host PRIVATE # Needed for the generated file game_u.h
                              ${CMAKE_CURRENT_BINARY_DIR})

target_link_libraries(game_host openenclave::oehost)
