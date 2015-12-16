#ifndef Websocket_PosixWebsocketForward_h
#define  Websocket_PosixWebsocketForward_h



#include "lws_config.h"
#include <stdio.h>
#include <stdlib.h>
#include <libwebsockets.h>

#include "bc_WS_Websocket.c" Websocket_instance;

struct Websocket_instance_type Websocket_instance;


void Websocket_set_listener_id(uint16_t id);
void Websocket_setup();
void Websocket_start_receiver_process() ;
void Websocket_forwardMessage(char * msg, int length, uint16_t clientID);

#endif
