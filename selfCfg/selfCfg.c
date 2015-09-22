/*****************************************************
 *      THIS IS A GENERATED FILE. DO NOT EDIT.
 *      Implementation for Application selfCfg
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
 * Definitions for configuration : selfCfg
 *****************************************************************************/

//Declaration of connexion array
#define NB_MAX_CONNEXION 2
struct Msg_Handler * selfCfg_receivers[NB_MAX_CONNEXION];

//Declaration of instance variables
//Instance selfCfg_a
struct antisocial_Instance selfCfg_a_var;
struct Msg_Handler selfCfg_a_pin_handlers;
uint16_t selfCfg_a_pin_msgs[1];
void * selfCfg_a_pin_handlers_tab[1];




//Dynamic dispatcher for message m
void dispatch_m(uint16_t sender, char * param_s) {
void executor_dispatch_m(struct Msg_Handler ** head, struct Msg_Handler ** tail) {
struct Msg_Handler ** cur = head;
while (cur != NULL) {
   void (*handler)(void *, char * param_s) = NULL;
   int i;
   for(i = 0; i < (**cur).nb_msg; i++) {
       if((**cur).msg[i] == 1) {
           handler = (void *) (**cur).msg_handler[i];
           break;
       }
   }
   if(handler != NULL)
       handler((**cur).instance, param_s);
   if(cur == tail){
       cur = NULL;}
   else {
   cur++;}
}
}
if (sender == selfCfg_a_var.id_pout) {
executor_dispatch_m(selfCfg_a_var.pout_receiver_list_head,selfCfg_a_var.pout_receiver_list_tail);}
}
void sync_dispatch_antisocial_send_pout_m(struct antisocial_Instance *_instance, char * s){
dispatch_m(_instance->id_pout, s);
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
}
}


//external Message enqueue

void initialize_configuration_selfCfg() {
// Initialize connectors
register_antisocial_send_pout_m_listener(sync_dispatch_antisocial_send_pout_m);

// Init the ID, state variables and properties for instance selfCfg_a
selfCfg_a_var.id_pout = add_instance( (void*) &selfCfg_a_var);
selfCfg_receivers[0] = &selfCfg_a_pin_handlers;
selfCfg_a_var.pout_receiver_list_head = &selfCfg_receivers[0];
selfCfg_a_var.pout_receiver_list_tail = &selfCfg_receivers[0];
selfCfg_a_var.id_pin = add_instance( (void*) &selfCfg_a_var);
selfCfg_a_pin_msgs[0] = 1;
selfCfg_a_pin_handlers_tab[0] = &antisocial_handle_pin_m;
selfCfg_a_pin_handlers.nb_msg = 1;
selfCfg_a_pin_handlers.msg = &selfCfg_a_pin_msgs;
selfCfg_a_pin_handlers.msg_handler = &selfCfg_a_pin_handlers_tab;
selfCfg_a_pin_handlers.instance = &selfCfg_a_var;
selfCfg_a_var.pin_handlers = &selfCfg_a_pin_handlers;
selfCfg_a_var.antisocial_Chart_State = ANTISOCIAL_CHART_INIT_STATE;


// Network Initilization 


// End Network Initilization 

antisocial_Chart_OnEntry(ANTISOCIAL_CHART_STATE, &selfCfg_a_var);
}




int main(int argc, char *argv[]) {
  init_runtime();
  
  initialize_configuration_selfCfg();

  while (1) {
    
// Network Listener

    processMessageQueue();
  }
}