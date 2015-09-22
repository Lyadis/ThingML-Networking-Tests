/*****************************************************
 *      THIS IS A GENERATED FILE. DO NOT EDIT.
 *      Implementation for Application disymetrical_selfCfg
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
#include "antisocial.h"





/*****************************************************************************
 * Definitions for configuration : disymetrical_selfCfg
 *****************************************************************************/

//Declaration of connexion array
#define NB_MAX_CONNEXION 2
struct Msg_Handler * disymetrical_selfCfg_receivers[NB_MAX_CONNEXION];

//Declaration of instance variables
//Instance disymetrical_selfCfg_a
struct antisocial_Instance disymetrical_selfCfg_a_var;
struct Msg_Handler disymetrical_selfCfg_a_pin_handlers;
uint16_t disymetrical_selfCfg_a_pin_msgs[2];
void * disymetrical_selfCfg_a_pin_handlers_tab[2];


// Enqueue of messages antisocial::pout::m
void enqueue_antisocial_send_pout_m(struct antisocial_Instance *_instance){
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
if (sender == disymetrical_selfCfg_a_var.id_pout) {
executor_dispatch_m(disymetrical_selfCfg_a_var.pout_receiver_list_head,disymetrical_selfCfg_a_var.pout_receiver_list_tail);}
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
}
}


//external Message enqueue

void initialize_configuration_disymetrical_selfCfg() {
// Initialize connectors
register_antisocial_send_pout_m_listener(enqueue_antisocial_send_pout_m);

// Init the ID, state variables and properties for instance disymetrical_selfCfg_a
disymetrical_selfCfg_a_var.id_pout = add_instance( (void*) &disymetrical_selfCfg_a_var);
disymetrical_selfCfg_receivers[0] = &disymetrical_selfCfg_a_pin_handlers;
disymetrical_selfCfg_a_var.pout_receiver_list_head = &disymetrical_selfCfg_receivers[0];
disymetrical_selfCfg_a_var.pout_receiver_list_tail = &disymetrical_selfCfg_receivers[0];
disymetrical_selfCfg_a_var.id_pin = add_instance( (void*) &disymetrical_selfCfg_a_var);
disymetrical_selfCfg_a_pin_msgs[0] = 1;
disymetrical_selfCfg_a_pin_handlers_tab[0] = &antisocial_handle_pin_m;
disymetrical_selfCfg_a_pin_msgs[1] = 2;
disymetrical_selfCfg_a_pin_handlers_tab[1] = &antisocial_handle_pin_m3;
disymetrical_selfCfg_a_pin_handlers.nb_msg = 2;
disymetrical_selfCfg_a_pin_handlers.msg = (uint16_t *) &disymetrical_selfCfg_a_pin_msgs;
disymetrical_selfCfg_a_pin_handlers.msg_handler = (void **) &disymetrical_selfCfg_a_pin_handlers_tab;
disymetrical_selfCfg_a_pin_handlers.instance = &disymetrical_selfCfg_a_var;
disymetrical_selfCfg_a_var.pin_handlers = &disymetrical_selfCfg_a_pin_handlers;
disymetrical_selfCfg_a_var.antisocial_Chart_State = ANTISOCIAL_CHART_INIT_STATE;


// Network Initilization 


// End Network Initilization 

antisocial_Chart_OnEntry(ANTISOCIAL_CHART_STATE, &disymetrical_selfCfg_a_var);
}




int main(int argc, char *argv[]) {
  init_runtime();
  
  initialize_configuration_disymetrical_selfCfg();

  while (1) {
    
// Network Listener

    processMessageQueue();
  }
}