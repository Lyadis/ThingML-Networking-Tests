/*****************************************************
 *      THIS IS A GENERATED FILE. DO NOT EDIT.
 *      Implementation for Application testMessageForwarding
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
#include "t2.h"
#include "t1.h"
#include "t3.h"


// NO C_HEADERS Annotation


/*****************************************************************************
 * Definitions for configuration : testMessageForwarding
 *****************************************************************************/

//Declaration of instance variables
struct t3_Instance testMessageForwarding_t3_var;
struct t2_Instance testMessageForwarding_t2_var;
struct t1_Instance testMessageForwarding_t1_var;

// Enqueue of messages t2::p2::m
void enqueue_t2_send_p2_m(struct t2_Instance *_instance){
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
// Enqueue of messages t1::p::m
void enqueue_t1_send_p_m(struct t1_Instance *_instance){
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

// Dispatch for messages t1::p::m
void dispatch_t1_send_p_m(struct t1_Instance *_instance){
if (_instance == &testMessageForwarding_t1_var) {
t2_handle_p1_m(&testMessageForwarding_t2_var);
}
}
// Dispatch for messages t2::p2::m
void dispatch_t2_send_p2_m(struct t2_Instance *_instance){
if (_instance == &testMessageForwarding_t2_var) {
t3_handle_p_m(&testMessageForwarding_t3_var);
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
dispatch_t2_send_p2_m((struct t2_Instance*)instance_by_id((mbuf[0] << 8) + mbuf[1]) /* instance */);
break;
case 2:
while (mbufi < 2) mbuf[mbufi++] = fifo_dequeue();
fifo_unlock();
dispatch_t1_send_p_m((struct t1_Instance*)instance_by_id((mbuf[0] << 8) + mbuf[1]) /* instance */);
break;
}
}

void initialize_configuration_testMessageForwarding() {
// Initialize connectors
register_t1_send_p_m_listener(enqueue_t1_send_p_m);
register_t2_send_p2_m_listener(enqueue_t2_send_p2_m);

// Init the ID, state variables and properties for instance testMessageForwarding_t1
testMessageForwarding_t1_var.id = add_instance( (void*) &testMessageForwarding_t1_var);
testMessageForwarding_t1_var.t1_org.sintef.thingml.impl.StateMachineImpl_State = T1_ORG.SINTEF.THINGML.IMPL.STATEMACHINEIMPL_S1_STATE;

// Init the ID, state variables and properties for instance testMessageForwarding_t3
testMessageForwarding_t3_var.id = add_instance( (void*) &testMessageForwarding_t3_var);
testMessageForwarding_t3_var.t3_org.sintef.thingml.impl.StateMachineImpl_State = T3_ORG.SINTEF.THINGML.IMPL.STATEMACHINEIMPL_S1_STATE;

// Init the ID, state variables and properties for instance testMessageForwarding_t2
testMessageForwarding_t2_var.id = add_instance( (void*) &testMessageForwarding_t2_var);
testMessageForwarding_t2_var.t2_org.sintef.thingml.impl.StateMachineImpl_State = T2_ORG.SINTEF.THINGML.IMPL.STATEMACHINEIMPL_S1_STATE;

t2_org.sintef.thingml.impl.StateMachineImpl_OnEntry(T2_ORG.SINTEF.THINGML.IMPL.STATEMACHINEIMPL_STATE, &testMessageForwarding_t2_var);
t3_org.sintef.thingml.impl.StateMachineImpl_OnEntry(T3_ORG.SINTEF.THINGML.IMPL.STATEMACHINEIMPL_STATE, &testMessageForwarding_t3_var);
t1_org.sintef.thingml.impl.StateMachineImpl_OnEntry(T1_ORG.SINTEF.THINGML.IMPL.STATEMACHINEIMPL_STATE, &testMessageForwarding_t1_var);
}


// NO C_GLOBALS Annotation

int main(int argc, char *argv[]) {
  init_runtime();
  // NO C_MAIN Annotation
  initialize_configuration_testMessageForwarding();

  while (1) {
    
    processMessageQueue();
  }
}