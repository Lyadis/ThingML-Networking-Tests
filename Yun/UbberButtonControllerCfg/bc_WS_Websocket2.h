#ifndef Websocket2_PosixWebsocketForward_h
#define  Websocket2_PosixWebsocketForward_h



#include "lws_config.h"
#include <stdio.h>
#include <stdlib.h>
#include <libwebsockets.h>

#include "bc_WS_Websocket2.c"Websocket2_instance;

struct Websocket2_instance_type Websocket2_instance;


void Websocket2_set_listener_id(uint16_t id);
void Websocket2_setup();
void Websocket2_start_receiver_process() ;
void Websocket2_forwardMessage(char * msg, int length, uint16_t clientID);

#endif
