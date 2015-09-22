/*****************************************************
 *      THIS IS A GENERATED FILE. DO NOT EDIT.
 *      Implementation for Application TmyCfg
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
 * Definitions for configuration : TmyCfg
 *****************************************************************************/

//Declaration of connexion array
#define NB_MAX_CONNEXION 6
struct Msg_Handler * TmyCfg_receivers[NB_MAX_CONNEXION];

//Declaration of instance variables
//Instance TmyCfg_t1
struct T1_Instance TmyCfg_t1_var;
//Instance TmyCfg_t2
struct T2_Instance TmyCfg_t2_var;
struct Msg_Handler TmyCfg_t2_p1_handlers;
uint16_t TmyCfg_t2_p1_msgs[3];
void * TmyCfg_t2_p1_handlers_tab[3];

struct Msg_Handler TmyCfg_t2_p2_handlers;
uint16_t TmyCfg_t2_p2_msgs[3];
void * TmyCfg_t2_p2_handlers_tab[3];


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


//Dynamic dispatcher for message m2
void dispatch_m2(uint16_t sender) {
void executor_dispatch_m2(struct Msg_Handler ** head, struct Msg_Handler ** tail) {
struct Msg_Handler ** cur = head;
while (cur != NULL) {
   void (*handler)(void *) = NULL;
   int i;
   for(i = 0; i < (**cur).nb_msg; i++) {
       if((**cur).msg[i] == 1) {
           handler = (void *) (**cur).msg_handler[i];
           break;
       }
   }
   if(handler != NULL)
       handler((**cur).instance);
   if(cur == tail){
       cur = NULL;}
   else {
   cur++;}
}
}
if (sender == TmyCfg_t1_var.id_p1) {
executor_dispatch_m2(TmyCfg_t1_var.p1_receiver_list_head,TmyCfg_t1_var.p1_receiver_list_tail);}
if (sender == TmyCfg_t1_var.id_p2) {
executor_dispatch_m2(TmyCfg_t1_var.p2_receiver_list_head,TmyCfg_t1_var.p2_receiver_list_tail);}
}

//Dynamic dispatcher for message m
void dispatch_m(uint16_t sender) {
void executor_dispatch_m(struct Msg_Handler ** head, struct Msg_Handler ** tail) {
struct Msg_Handler ** cur = head;
while (cur != NULL) {
   void (*handler)(void *) = NULL;
   int i;
   for(i = 0; i < (**cur).nb_msg; i++) {
       if((**cur).msg[i] == 2) {
           handler = (void *) (**cur).msg_handler[i];
           break;
       }
   }
   if(handler != NULL)
       handler((**cur).instance);
   if(cur == tail){
       cur = NULL;}
   else {
   cur++;}
}
}
if (sender == TmyCfg_t1_var.id_p1) {
executor_dispatch_m(TmyCfg_t1_var.p1_receiver_list_head,TmyCfg_t1_var.p1_receiver_list_tail);}
if (sender == TmyCfg_t1_var.id_p2) {
executor_dispatch_m(TmyCfg_t1_var.p2_receiver_list_head,TmyCfg_t1_var.p2_receiver_list_tail);}
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

void initialize_configuration_TmyCfg() {
// Initialize connectors
register_T1_send_p1_m_listener(enqueue_T1_send_p1_m);
register_T1_send_p1_m2_listener(enqueue_T1_send_p1_m2);
register_T1_send_p2_m_listener(enqueue_T1_send_p2_m);
register_T1_send_p2_m2_listener(enqueue_T1_send_p2_m2);

// Init the ID, state variables and properties for instance TmyCfg_t2
TmyCfg_t2_var.id_p1 = add_instance( (void*) &TmyCfg_t2_var);
TmyCfg_t2_p1_msgs[0] = 2;
TmyCfg_t2_p1_handlers_tab[0] = &T2_handle_p1_m;
TmyCfg_t2_p1_msgs[1] = 1;
TmyCfg_t2_p1_handlers_tab[1] = &T2_handle_p1_m2;
TmyCfg_t2_p1_msgs[2] = 3;
TmyCfg_t2_p1_handlers_tab[2] = &T2_handle_p1_m3;
TmyCfg_t2_p1_handlers.nb_msg = 3;
TmyCfg_t2_p1_handlers.msg = &TmyCfg_t2_p1_msgs;
TmyCfg_t2_p1_handlers.msg_handler = &TmyCfg_t2_p1_handlers_tab;
TmyCfg_t2_p1_handlers.instance = &TmyCfg_t2_var;
TmyCfg_t2_var.p1_handlers = &TmyCfg_t2_p1_handlers;
TmyCfg_t2_var.id_p2 = add_instance( (void*) &TmyCfg_t2_var);
TmyCfg_t2_p2_msgs[0] = 2;
TmyCfg_t2_p2_handlers_tab[0] = &T2_handle_p2_m;
TmyCfg_t2_p2_msgs[1] = 1;
TmyCfg_t2_p2_handlers_tab[1] = &T2_handle_p2_m2;
TmyCfg_t2_p2_msgs[2] = 3;
TmyCfg_t2_p2_handlers_tab[2] = &T2_handle_p2_m3;
TmyCfg_t2_p2_handlers.nb_msg = 3;
TmyCfg_t2_p2_handlers.msg = &TmyCfg_t2_p2_msgs;
TmyCfg_t2_p2_handlers.msg_handler = &TmyCfg_t2_p2_handlers_tab;
TmyCfg_t2_p2_handlers.instance = &TmyCfg_t2_var;
TmyCfg_t2_var.p2_handlers = &TmyCfg_t2_p2_handlers;
TmyCfg_t2_var.T2_chart_State = T2_CHART_INIT_STATE;

// Init the ID, state variables and properties for instance TmyCfg_t1
TmyCfg_t1_var.id_p1 = add_instance( (void*) &TmyCfg_t1_var);
TmyCfg_receivers[0] = &TmyCfg_t2_p2_handlers;
TmyCfg_receivers[1] = &TmyCfg_t2_p1_handlers;
TmyCfg_t1_var.p1_receiver_list_head = &TmyCfg_receivers[0];
TmyCfg_t1_var.p1_receiver_list_tail = &TmyCfg_receivers[1];
TmyCfg_t1_var.id_p2 = add_instance( (void*) &TmyCfg_t1_var);
TmyCfg_receivers[2] = &TmyCfg_t2_p2_handlers;
TmyCfg_t1_var.p2_receiver_list_head = &TmyCfg_receivers[2];
TmyCfg_t1_var.p2_receiver_list_tail = &TmyCfg_receivers[2];
TmyCfg_t1_var.T1_chart_State = T1_CHART_INIT_STATE;


// Network Initilization 


// End Network Initilization 

T2_chart_OnEntry(T2_CHART_STATE, &TmyCfg_t2_var);
T1_chart_OnEntry(T1_CHART_STATE, &TmyCfg_t1_var);
}




int main(int argc, char *argv[]) {
  init_runtime();
  
  initialize_configuration_TmyCfg();

  while (1) {
    
// Network Listener

    processMessageQueue();
  }
}