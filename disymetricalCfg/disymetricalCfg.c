/*****************************************************
 *      THIS IS A GENERATED FILE. DO NOT EDIT.
 *      Implementation for Application disymetricalCfg
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
#include "t1.h"
#include "t2.h"





/*****************************************************************************
 * Definitions for configuration : disymetricalCfg
 *****************************************************************************/

//Declaration of connexion array
#define NB_MAX_CONNEXION 2
struct Msg_Handler * disymetricalCfg_receivers[NB_MAX_CONNEXION];

//Declaration of instance variables
//Instance disymetricalCfg_t1bis
struct t1_Instance disymetricalCfg_t1bis_var;
//Instance disymetricalCfg_t1
struct t1_Instance disymetricalCfg_t1_var;
//Instance disymetricalCfg_t2
struct t2_Instance disymetricalCfg_t2_var;
struct Msg_Handler disymetricalCfg_t2_pin_handlers;
uint16_t disymetricalCfg_t2_pin_msgs[2];
void * disymetricalCfg_t2_pin_handlers_tab[2];


// Enqueue of messages t1::pout::m
void enqueue_t1_send_pout_m(struct t1_Instance *_instance){
fifo_lock();
if ( fifo_byte_available() > 4 ) {

_fifo_enqueue( (1 >> 8) & 0xFF );
_fifo_enqueue( 1 & 0xFF );

// ID of the source port of the instance
_fifo_enqueue( (_instance->id_pout >> 8) & 0xFF );
_fifo_enqueue( _instance->id_pout & 0xFF );
}
fifo_unlock_and_notify();
}


//Dynamic dispatcher for message m
void dispatch_m(uint16_t sender) {
void executor_dispatch_m(struct Msg_Handler ** head, struct Msg_Handler ** tail) {
struct Msg_Handler ** cur = head;
while (cur != NULL) {
   void (*handler)(void *) = NULL;
   int i;
   for(i = 0; i < (**cur).nb_msg; i++) {
       if((**cur).msg[i] == 1) {
           handler = (void (*) (void *)) (**cur).msg_handler[i];
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
if (sender == disymetricalCfg_t1_var.id_pout) {
executor_dispatch_m(disymetricalCfg_t1_var.pout_receiver_list_head,disymetricalCfg_t1_var.pout_receiver_list_tail);}
if (sender == disymetricalCfg_t1bis_var.id_pout) {
executor_dispatch_m(disymetricalCfg_t1bis_var.pout_receiver_list_head,disymetricalCfg_t1bis_var.pout_receiver_list_tail);}
}

//Dynamic dispatcher for message m3
void dispatch_m3(uint16_t sender) {
void executor_dispatch_m3(struct Msg_Handler ** head, struct Msg_Handler ** tail) {
struct Msg_Handler ** cur = head;
while (cur != NULL) {
   void (*handler)(void *) = NULL;
   int i;
   for(i = 0; i < (**cur).nb_msg; i++) {
       if((**cur).msg[i] == 2) {
           handler = (void (*) (void *)) (**cur).msg_handler[i];
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
if (sender == disymetricalCfg_t2_var.id_pin) {
executor_dispatch_m3(disymetricalCfg_t2_var.pin_receiver_list_head,disymetricalCfg_t2_var.pin_receiver_list_tail);}
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
dispatch_m((mbuf[0] << 8) + mbuf[1] /* instance port*/);
break;
case 2:
while (mbufi < 2) mbuf[mbufi++] = fifo_dequeue();
fifo_unlock();
dispatch_m3((mbuf[0] << 8) + mbuf[1] /* instance port*/);
break;
}
}


//external Message enqueue

void initialize_configuration_disymetricalCfg() {
// Initialize connectors
register_t1_send_pout_m_listener(enqueue_t1_send_pout_m);

// Init the ID, state variables and properties for instance disymetricalCfg_t1bis
disymetricalCfg_t1bis_var.id_pout = add_instance( (void*) &disymetricalCfg_t1bis_var);
disymetricalCfg_t1bis_var.pout_receiver_list_head = NULL;
disymetricalCfg_t1bis_var.pout_receiver_list_tail = &disymetricalCfg_receivers[0];
disymetricalCfg_t1bis_var.t1_Chart_State = T1_CHART_INIT_STATE;

// Init the ID, state variables and properties for instance disymetricalCfg_t1
disymetricalCfg_t1_var.id_pout = add_instance( (void*) &disymetricalCfg_t1_var);
disymetricalCfg_receivers[0] = &disymetricalCfg_t2_pin_handlers;
disymetricalCfg_t1_var.pout_receiver_list_head = &disymetricalCfg_receivers[0];
disymetricalCfg_t1_var.pout_receiver_list_tail = &disymetricalCfg_receivers[0];
disymetricalCfg_t1_var.t1_Chart_State = T1_CHART_INIT_STATE;

// Init the ID, state variables and properties for instance disymetricalCfg_t2
disymetricalCfg_t2_var.id_pin = add_instance( (void*) &disymetricalCfg_t2_var);
disymetricalCfg_t2_pin_msgs[0] = 1;
disymetricalCfg_t2_pin_handlers_tab[0] = (void*) &t2_handle_pin_m;
disymetricalCfg_t2_pin_msgs[1] = 2;
disymetricalCfg_t2_pin_handlers_tab[1] = (void*) &t2_handle_pin_m3;
disymetricalCfg_t2_pin_handlers.nb_msg = 2;
disymetricalCfg_t2_pin_handlers.msg = (uint16_t *) &disymetricalCfg_t2_pin_msgs;
disymetricalCfg_t2_pin_handlers.msg_handler = (void **) &disymetricalCfg_t2_pin_handlers_tab;
disymetricalCfg_t2_pin_handlers.instance = &disymetricalCfg_t2_var;
disymetricalCfg_t2_var.pin_handlers = &disymetricalCfg_t2_pin_handlers;
disymetricalCfg_t2_var.pin_receiver_list_head = NULL;
disymetricalCfg_t2_var.pin_receiver_list_tail = &disymetricalCfg_receivers[1];
disymetricalCfg_t2_var.t2_Chart_State = T2_CHART_INIT_STATE;


// Network Initilization 


// End Network Initilization 

t1_Chart_OnEntry(T1_CHART_STATE, &disymetricalCfg_t1_var);
t2_Chart_OnEntry(T2_CHART_STATE, &disymetricalCfg_t2_var);
t1_Chart_OnEntry(T1_CHART_STATE, &disymetricalCfg_t1bis_var);
}




int main(int argc, char *argv[]) {
  init_runtime();
  
  initialize_configuration_disymetricalCfg();

  while (1) {
    
// Network Listener

    processMessageQueue();
  }
}