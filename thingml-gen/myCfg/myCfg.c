/*****************************************************
 *      THIS IS A GENERATED FILE. DO NOT EDIT.
 *      Implementation for Application myCfg
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
#include "T2.h"
#include "T1.h"





/*****************************************************************************
 * Definitions for configuration : myCfg
 *****************************************************************************/

//Declaration of instance variables
struct T1_Instance myCfg_t1_var;
struct T2_Instance myCfg_t2_var;

// Enqueue of messages T1::p1::m2
void enqueue_T1_send_p1_m2(struct T1_Instance *_instance){
fifo_lock();
if ( fifo_byte_available() > 4 ) {

_fifo_enqueue( (1 >> 8) & 0xFF );
_fifo_enqueue( 1 & 0xFF );

// ID of the source port of the instance
_fifo_enqueue( (_instance->id_p1 >> 8) & 0xFF );
_fifo_enqueue( _instance->id_p1 & 0xFF );
}
fifo_unlock_and_notify();
}
// Enqueue of messages T1::p1::m
void enqueue_T1_send_p1_m(struct T1_Instance *_instance){
fifo_lock();
if ( fifo_byte_available() > 4 ) {

_fifo_enqueue( (2 >> 8) & 0xFF );
_fifo_enqueue( 2 & 0xFF );

// ID of the source port of the instance
_fifo_enqueue( (_instance->id_p1 >> 8) & 0xFF );
_fifo_enqueue( _instance->id_p1 & 0xFF );
}
fifo_unlock_and_notify();
}
// Enqueue of messages T1::p2::m2
void enqueue_T1_send_p2_m2(struct T1_Instance *_instance){
fifo_lock();
if ( fifo_byte_available() > 4 ) {

_fifo_enqueue( (1 >> 8) & 0xFF );
_fifo_enqueue( 1 & 0xFF );

// ID of the source port of the instance
_fifo_enqueue( (_instance->id_p2 >> 8) & 0xFF );
_fifo_enqueue( _instance->id_p2 & 0xFF );
}
fifo_unlock_and_notify();
}
// Enqueue of messages T1::p2::m
void enqueue_T1_send_p2_m(struct T1_Instance *_instance){
fifo_lock();
if ( fifo_byte_available() > 4 ) {

_fifo_enqueue( (2 >> 8) & 0xFF );
_fifo_enqueue( 2 & 0xFF );

// ID of the source port of the instance
_fifo_enqueue( (_instance->id_p2 >> 8) & 0xFF );
_fifo_enqueue( _instance->id_p2 & 0xFF );
}
fifo_unlock_and_notify();
}


//New dispatcher for messages
void dispatch_m2(uint16_t sender) {
if (sender == myCfg_t1_var.id_p1) {
T2_handle_p2_m2(&myCfg_t2_var);
T2_handle_p1_m2(&myCfg_t2_var);

}
if (sender == myCfg_t1_var.id_p2) {
T2_handle_p2_m2(&myCfg_t2_var);

}

}


//New dispatcher for messages
void dispatch_m(uint16_t sender) {
if (sender == myCfg_t1_var.id_p2) {
T2_handle_p2_m(&myCfg_t2_var);

}
if (sender == myCfg_t1_var.id_p1) {
T2_handle_p2_m(&myCfg_t2_var);
T2_handle_p1_m(&myCfg_t2_var);

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
case 1:
while (mbufi < 2) mbuf[mbufi++] = fifo_dequeue();
fifo_unlock();
dispatch_m2((mbuf[0] << 8) + mbuf[1] /* instance port*/);
break;
case 2:
while (mbufi < 2) mbuf[mbufi++] = fifo_dequeue();
fifo_unlock();
dispatch_m((mbuf[0] << 8) + mbuf[1] /* instance port*/);
break;
}
}


//external Message enqueue

void initialize_configuration_myCfg() {
// Initialize connectors
register_T1_send_p1_m_listener(enqueue_T1_send_p1_m);
register_T1_send_p1_m2_listener(enqueue_T1_send_p1_m2);
register_T1_send_p2_m_listener(enqueue_T1_send_p2_m);
register_T1_send_p2_m2_listener(enqueue_T1_send_p2_m2);

// Init the ID, state variables and properties for instance myCfg_t2
myCfg_t2_var.id = add_instance( (void*) &myCfg_t2_var);
myCfg_t2_var.id_p1 = add_instance( (void*) &myCfg_t2_var);
myCfg_t2_var.id_p2 = add_instance( (void*) &myCfg_t2_var);
myCfg_t2_var.T2_chart_State = T2_CHART_INIT_STATE;

// Init the ID, state variables and properties for instance myCfg_t1
myCfg_t1_var.id = add_instance( (void*) &myCfg_t1_var);
myCfg_t1_var.id_p1 = add_instance( (void*) &myCfg_t1_var);
myCfg_t1_var.id_p2 = add_instance( (void*) &myCfg_t1_var);
myCfg_t1_var.T1_chart_State = T1_CHART_INIT_STATE;


// Network Initilization 


// End Network Initilization 

T1_chart_OnEntry(T1_CHART_STATE, &myCfg_t1_var);
T2_chart_OnEntry(T2_CHART_STATE, &myCfg_t2_var);
}




int main(int argc, char *argv[]) {
  init_runtime();
  
  initialize_configuration_myCfg();

  while (1) {
    
// Network Listener

    processMessageQueue();
  }
}