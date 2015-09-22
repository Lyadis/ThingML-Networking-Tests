/*****************************************************
 *      THIS IS A GENERATED FILE. DO NOT EDIT.
 *      Implementation for Application LinuxClockTest
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
#include "ClockLinux.h"
#include "ClockTestApp.h"





/*****************************************************************************
 * Definitions for configuration : LinuxClockTest
 *****************************************************************************/

//Declaration of connexion array
#define NB_MAX_CONNEXION 4
struct Msg_Handler * LinuxClockTest_receivers[NB_MAX_CONNEXION];

//Declaration of instance variables
//Instance LinuxClockTest_c1
struct ClockLinux_Instance LinuxClockTest_c1_var;
//Instance LinuxClockTest_c2
struct ClockLinux_Instance LinuxClockTest_c2_var;
//Instance LinuxClockTest_app
struct ClockTestApp_Instance LinuxClockTest_app_var;
struct Msg_Handler LinuxClockTest_app_clock1_handlers;
uint16_t LinuxClockTest_app_clock1_msgs[1];
void * LinuxClockTest_app_clock1_handlers_tab[1];

struct Msg_Handler LinuxClockTest_app_clock2_handlers;
uint16_t LinuxClockTest_app_clock2_msgs[1];
void * LinuxClockTest_app_clock2_handlers_tab[1];


// Enqueue of messages ClockLinux::signal::clock_tick
void enqueue_ClockLinux_send_signal_clock_tick(struct ClockLinux_Instance *_instance){
fifo_lock();
if ( fifo_byte_available() > 4 ) {

_fifo_enqueue( (1 >> 8) & 0xFF );
_fifo_enqueue( 1 & 0xFF );

// ID of the source port of the instance
_fifo_enqueue( (_instance->id_signal >> 8) & 0xFF );
_fifo_enqueue( _instance->id_signal & 0xFF );
}
else {
}
fifo_unlock_and_notify();
}


//Dynamic dispatcher for message clock_tick
void dispatch_clock_tick(uint16_t sender) {
void executor_dispatch_clock_tick(struct Msg_Handler ** head, struct Msg_Handler ** tail) {
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
if (sender == LinuxClockTest_c2_var.id_signal) {
executor_dispatch_clock_tick(LinuxClockTest_c2_var.signal_receiver_list_head,LinuxClockTest_c2_var.signal_receiver_list_tail);}
if (sender == LinuxClockTest_c1_var.id_signal) {
executor_dispatch_clock_tick(LinuxClockTest_c1_var.signal_receiver_list_head,LinuxClockTest_c1_var.signal_receiver_list_tail);}
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
dispatch_clock_tick((mbuf[0] << 8) + mbuf[1] /* instance port*/);
break;
}
}


//external Message enqueue

void initialize_configuration_LinuxClockTest() {
// Initialize connectors
register_ClockLinux_send_signal_clock_tick_listener(enqueue_ClockLinux_send_signal_clock_tick);

// Init the ID, state variables and properties for instance LinuxClockTest_app
LinuxClockTest_app_var.id_clock1 = add_instance( (void*) &LinuxClockTest_app_var);
LinuxClockTest_app_clock1_msgs[0] = 1;
LinuxClockTest_app_clock1_handlers_tab[0] = &ClockTestApp_handle_clock1_clock_tick;
LinuxClockTest_app_clock1_handlers.nb_msg = 1;
LinuxClockTest_app_clock1_handlers.msg = &LinuxClockTest_app_clock1_msgs;
LinuxClockTest_app_clock1_handlers.msg_handler = &LinuxClockTest_app_clock1_handlers_tab;
LinuxClockTest_app_clock1_handlers.instance = &LinuxClockTest_app_var;
LinuxClockTest_app_var.clock1_handlers = &LinuxClockTest_app_clock1_handlers;
LinuxClockTest_app_var.id_clock2 = add_instance( (void*) &LinuxClockTest_app_var);
LinuxClockTest_app_clock2_msgs[0] = 1;
LinuxClockTest_app_clock2_handlers_tab[0] = &ClockTestApp_handle_clock2_clock_tick;
LinuxClockTest_app_clock2_handlers.nb_msg = 1;
LinuxClockTest_app_clock2_handlers.msg = &LinuxClockTest_app_clock2_msgs;
LinuxClockTest_app_clock2_handlers.msg_handler = &LinuxClockTest_app_clock2_handlers_tab;
LinuxClockTest_app_clock2_handlers.instance = &LinuxClockTest_app_var;
LinuxClockTest_app_var.clock2_handlers = &LinuxClockTest_app_clock2_handlers;
LinuxClockTest_app_var.ClockTestApp_LinuxClockTestAppImpl_State = CLOCKTESTAPP_LINUXCLOCKTESTAPPIMPL_RUNNING_STATE;

// Init the ID, state variables and properties for instance LinuxClockTest_c2
LinuxClockTest_c2_var.id_signal = add_instance( (void*) &LinuxClockTest_c2_var);
LinuxClockTest_receivers[0] = &LinuxClockTest_app_clock2_handlers;
LinuxClockTest_c2_var.signal_receiver_list_head = &LinuxClockTest_receivers[0];
LinuxClockTest_c2_var.signal_receiver_list_tail = &LinuxClockTest_receivers[0];
LinuxClockTest_c2_var.ClockLinux_ClockImpl_State = CLOCKLINUX_CLOCKIMPL_TICKING_STATE;
LinuxClockTest_c2_var.Clock_period__var = 5000;

// Init the ID, state variables and properties for instance LinuxClockTest_c1
LinuxClockTest_c1_var.id_signal = add_instance( (void*) &LinuxClockTest_c1_var);
LinuxClockTest_receivers[1] = &LinuxClockTest_app_clock1_handlers;
LinuxClockTest_c1_var.signal_receiver_list_head = &LinuxClockTest_receivers[1];
LinuxClockTest_c1_var.signal_receiver_list_tail = &LinuxClockTest_receivers[1];
LinuxClockTest_c1_var.ClockLinux_ClockImpl_State = CLOCKLINUX_CLOCKIMPL_TICKING_STATE;
LinuxClockTest_c1_var.Clock_period__var = 2000;


// Network Initilization 


// End Network Initilization 

ClockTestApp_LinuxClockTestAppImpl_OnEntry(CLOCKTESTAPP_LINUXCLOCKTESTAPPIMPL_STATE, &LinuxClockTest_app_var);
ClockLinux_ClockImpl_OnEntry(CLOCKLINUX_CLOCKIMPL_STATE, &LinuxClockTest_c1_var);
ClockLinux_ClockImpl_OnEntry(CLOCKLINUX_CLOCKIMPL_STATE, &LinuxClockTest_c2_var);
}




int main(int argc, char *argv[]) {
  init_runtime();
  
  initialize_configuration_LinuxClockTest();

  while (1) {
    
// Network Listener

    processMessageQueue();
  }
}