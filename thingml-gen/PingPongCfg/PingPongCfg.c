/*****************************************************
 *      THIS IS A GENERATED FILE. DO NOT EDIT.
 *      Implementation for Application PingPongCfg
 *  Generated from ThingML (http://www.thingml.org)
 *****************************************************/

#include <unistd.h>
#include <stdlib.h>
#include <stdio.h>
#include <ctype.h>
#include <string.h>
#include <math.h>
#include <signal.h>
#include <pthread.h>
#include "thingml_typedefs.h"
#include "runtime.h"
#include "PingClient.h"
#include "PingServer.h"





/*****************************************************************************
 * Definitions for configuration : PingPongCfg
 *****************************************************************************/

//Declaration of instance variables
struct PingServer_Instance PingPongCfg_server2_var;
struct PingClient_Instance PingPongCfg_client2_var;
struct PingClient_Instance PingPongCfg_client1_var;
struct PingServer_Instance PingPongCfg_server1_var;

// Enqueue of messages PingServer::ping_service::pong
void enqueue_PingServer_send_ping_service_pong(struct PingServer_Instance *_instance){
fifo_lock();
if ( fifo_byte_available() > 4 ) {

_fifo_enqueue( (1 >> 8) & 0xFF );
_fifo_enqueue( 1 & 0xFF );

// ID of the source instance
_fifo_enqueue( (_instance->id >> 8) & 0xFF );
_fifo_enqueue( _instance->id & 0xFF );
}
fifo_unlock_and_notify();
}
// Enqueue of messages PingClient::ping_service::ping
void enqueue_PingClient_send_ping_service_ping(struct PingClient_Instance *_instance){
fifo_lock();
if ( fifo_byte_available() > 4 ) {

_fifo_enqueue( (2 >> 8) & 0xFF );
_fifo_enqueue( 2 & 0xFF );

// ID of the source instance
_fifo_enqueue( (_instance->id >> 8) & 0xFF );
_fifo_enqueue( _instance->id & 0xFF );
}
fifo_unlock_and_notify();
}

// Dispatch for messages PingServer::ping_service::pong
void dispatch_PingServer_send_ping_service_pong(struct PingServer_Instance *_instance){
if (_instance == &PingPongCfg_server1_var) {
PingClient_handle_ping_service_pong(&PingPongCfg_client1_var);
PingClient_handle_ping_service_pong(&PingPongCfg_client2_var);
}
if (_instance == &PingPongCfg_server2_var) {
PingClient_handle_ping_service_pong(&PingPongCfg_client1_var);
}
}
// Dispatch for messages PingClient::ping_service::ping
void dispatch_PingClient_send_ping_service_ping(struct PingClient_Instance *_instance){
if (_instance == &PingPongCfg_client1_var) {
PingServer_handle_ping_service_ping(&PingPongCfg_server2_var);
PingServer_handle_ping_service_ping(&PingPongCfg_server1_var);
}
if (_instance == &PingPongCfg_client2_var) {
PingServer_handle_ping_service_ping(&PingPongCfg_server1_var);
}
}

void processMessageQueue() {
fifo_lock();
while (fifo_empty()) fifo_wait();
byte mbuf[2];
uint8_t mbufi = 0;

// Read the code of the next port/message in the queue
uint16_t code = fifo_dequeue() << 8;

code += fifo_dequeue();

// Switch to call the appropriate handler
switch(code) {
case 2:
while (mbufi < 2) mbuf[mbufi++] = fifo_dequeue();
fifo_unlock();
dispatch_PingClient_send_ping_service_ping((struct PingClient_Instance*)instance_by_id((mbuf[0] << 8) + mbuf[1]) /* instance */);
break;
case 1:
while (mbufi < 2) mbuf[mbufi++] = fifo_dequeue();
fifo_unlock();
dispatch_PingServer_send_ping_service_pong((struct PingServer_Instance*)instance_by_id((mbuf[0] << 8) + mbuf[1]) /* instance */);
break;
}
}

void initialize_configuration_PingPongCfg() {
// Initialize connectors
register_PingServer_send_ping_service_pong_listener(enqueue_PingServer_send_ping_service_pong);
register_PingClient_send_ping_service_ping_listener(enqueue_PingClient_send_ping_service_ping);

// Init the ID, state variables and properties for instance PingPongCfg_server1
PingPongCfg_server1_var.id = add_instance( (void*) &PingPongCfg_server1_var);
PingPongCfg_server1_var.PingServer_PongServerMachine_State = PINGSERVER_PONGSERVERMACHINE_ACTIVE_STATE;

// Init the ID, state variables and properties for instance PingPongCfg_client2
PingPongCfg_client2_var.id = add_instance( (void*) &PingPongCfg_client2_var);
PingPongCfg_client2_var.PingClient_PingClientMachine_State = PINGCLIENT_PINGCLIENTMACHINE_PING_STATE;

// Init the ID, state variables and properties for instance PingPongCfg_client1
PingPongCfg_client1_var.id = add_instance( (void*) &PingPongCfg_client1_var);
PingPongCfg_client1_var.PingClient_PingClientMachine_State = PINGCLIENT_PINGCLIENTMACHINE_PING_STATE;

// Init the ID, state variables and properties for instance PingPongCfg_server2
PingPongCfg_server2_var.id = add_instance( (void*) &PingPongCfg_server2_var);
PingPongCfg_server2_var.PingServer_PongServerMachine_State = PINGSERVER_PONGSERVERMACHINE_ACTIVE_STATE;

PingServer_PongServerMachine_OnEntry(PINGSERVER_PONGSERVERMACHINE_STATE, &PingPongCfg_server1_var);
PingClient_PingClientMachine_OnEntry(PINGCLIENT_PINGCLIENTMACHINE_STATE, &PingPongCfg_client1_var);
PingServer_PongServerMachine_OnEntry(PINGSERVER_PONGSERVERMACHINE_STATE, &PingPongCfg_server2_var);
PingClient_PingClientMachine_OnEntry(PINGCLIENT_PINGCLIENTMACHINE_STATE, &PingPongCfg_client2_var);
}




int main(int argc, char *argv[]) {
  init_runtime();
  
  initialize_configuration_PingPongCfg();

  while (1) {
    PingClient_handle_empty_event(&PingPongCfg_client1_var);
PingClient_handle_empty_event(&PingPongCfg_client2_var);

    processMessageQueue();
  }
}