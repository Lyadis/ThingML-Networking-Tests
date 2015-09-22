/*****************************************************
 *      THIS IS A GENERATED FILE. DO NOT EDIT.
 *      Implementation for Application testGroupCfg
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
#include "sender.h"
#include "t1.h"
#include "gateway.h"





/*****************************************************************************
 * Definitions for configuration : testGroupCfg
 *****************************************************************************/

//Declaration of connexion array
#define NB_MAX_CONNEXION 36
struct Msg_Handler * testGroupCfg_receivers[NB_MAX_CONNEXION];

//Declaration of instance variables
//Instance testGroupCfg_s2
struct sender_Instance testGroupCfg_s2_var;
//Instance testGroupCfg_g1_g
struct gateway_Instance testGroupCfg_g1_g_var;
struct Msg_Handler testGroupCfg_g1_g_listen_handlers;
uint16_t testGroupCfg_g1_g_listen_msgs[1];
void * testGroupCfg_g1_g_listen_handlers_tab[1];

//Instance testGroupCfg_g2_t1
struct t1_Instance testGroupCfg_g2_t1_var;
struct Msg_Handler testGroupCfg_g2_t1_p_handlers;
uint16_t testGroupCfg_g2_t1_p_msgs[1];
void * testGroupCfg_g2_t1_p_handlers_tab[1];

//Instance testGroupCfg_g1_t2
struct t2_Instance testGroupCfg_g1_t2_var;
struct Msg_Handler testGroupCfg_g1_t2_p_handlers;
uint16_t testGroupCfg_g1_t2_p_msgs[1];
void * testGroupCfg_g1_t2_p_handlers_tab[1];

struct Msg_Handler testGroupCfg_g1_t2_p2_handlers;
uint16_t testGroupCfg_g1_t2_p2_msgs[1];
void * testGroupCfg_g1_t2_p2_handlers_tab[1];

struct Msg_Handler testGroupCfg_g1_t2_p3_handlers;
uint16_t testGroupCfg_g1_t2_p3_msgs[1];
void * testGroupCfg_g1_t2_p3_handlers_tab[1];

struct Msg_Handler testGroupCfg_g1_t2_p4_handlers;
uint16_t testGroupCfg_g1_t2_p4_msgs[1];
void * testGroupCfg_g1_t2_p4_handlers_tab[1];

//Instance testGroupCfg_s1
struct sender_Instance testGroupCfg_s1_var;
//Instance testGroupCfg_g2_g
struct gateway_Instance testGroupCfg_g2_g_var;
struct Msg_Handler testGroupCfg_g2_g_listen_handlers;
uint16_t testGroupCfg_g2_g_listen_msgs[1];
void * testGroupCfg_g2_g_listen_handlers_tab[1];

//Instance testGroupCfg_g1_t1
struct t1_Instance testGroupCfg_g1_t1_var;
struct Msg_Handler testGroupCfg_g1_t1_p_handlers;
uint16_t testGroupCfg_g1_t1_p_msgs[1];
void * testGroupCfg_g1_t1_p_handlers_tab[1];

//Instance testGroupCfg_g2_t2
struct t2_Instance testGroupCfg_g2_t2_var;
struct Msg_Handler testGroupCfg_g2_t2_p_handlers;
uint16_t testGroupCfg_g2_t2_p_msgs[1];
void * testGroupCfg_g2_t2_p_handlers_tab[1];

struct Msg_Handler testGroupCfg_g2_t2_p2_handlers;
uint16_t testGroupCfg_g2_t2_p2_msgs[1];
void * testGroupCfg_g2_t2_p2_handlers_tab[1];

struct Msg_Handler testGroupCfg_g2_t2_p3_handlers;
uint16_t testGroupCfg_g2_t2_p3_msgs[1];
void * testGroupCfg_g2_t2_p3_handlers_tab[1];

struct Msg_Handler testGroupCfg_g2_t2_p4_handlers;
uint16_t testGroupCfg_g2_t2_p4_msgs[1];
void * testGroupCfg_g2_t2_p4_handlers_tab[1];


// Enqueue of messages sender::p::printHello
void enqueue_sender_send_p_printHello(struct sender_Instance *_instance){
fifo_lock();
if ( fifo_byte_available() > 4 ) {

_fifo_enqueue( (1 >> 8) & 0xFF );
_fifo_enqueue( 1 & 0xFF );

// ID of the source port of the instance
_fifo_enqueue( (_instance->id_p >> 8) & 0xFF );
_fifo_enqueue( _instance->id_p & 0xFF );
}
fifo_unlock_and_notify();
}
// Enqueue of messages sender::p2::printHello
void enqueue_sender_send_p2_printHello(struct sender_Instance *_instance){
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
// Enqueue of messages gateway::send::printHello
void enqueue_gateway_send_send_printHello(struct gateway_Instance *_instance){
fifo_lock();
if ( fifo_byte_available() > 4 ) {

_fifo_enqueue( (1 >> 8) & 0xFF );
_fifo_enqueue( 1 & 0xFF );

// ID of the source port of the instance
_fifo_enqueue( (_instance->id_send >> 8) & 0xFF );
_fifo_enqueue( _instance->id_send & 0xFF );
}
fifo_unlock_and_notify();
}
// Enqueue of messages gateway::send2::printHello
void enqueue_gateway_send_send2_printHello(struct gateway_Instance *_instance){
fifo_lock();
if ( fifo_byte_available() > 4 ) {

_fifo_enqueue( (1 >> 8) & 0xFF );
_fifo_enqueue( 1 & 0xFF );

// ID of the source port of the instance
_fifo_enqueue( (_instance->id_send2 >> 8) & 0xFF );
_fifo_enqueue( _instance->id_send2 & 0xFF );
}
fifo_unlock_and_notify();
}


//Dynamic dispatcher for message printHello
void dispatch_printHello(uint16_t sender) {
void executor_dispatch_printHello(struct Msg_Handler ** head, struct Msg_Handler ** tail) {
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
if (sender == testGroupCfg_g1_g_var.id_send) {
executor_dispatch_printHello(testGroupCfg_g1_g_var.send_receiver_list_head,testGroupCfg_g1_g_var.send_receiver_list_tail);}
if (sender == testGroupCfg_s2_var.id_p) {
executor_dispatch_printHello(testGroupCfg_s2_var.p_receiver_list_head,testGroupCfg_s2_var.p_receiver_list_tail);}
if (sender == testGroupCfg_s1_var.id_p2) {
executor_dispatch_printHello(testGroupCfg_s1_var.p2_receiver_list_head,testGroupCfg_s1_var.p2_receiver_list_tail);}
if (sender == testGroupCfg_g1_g_var.id_send2) {
executor_dispatch_printHello(testGroupCfg_g1_g_var.send2_receiver_list_head,testGroupCfg_g1_g_var.send2_receiver_list_tail);}
if (sender == testGroupCfg_s2_var.id_p2) {
executor_dispatch_printHello(testGroupCfg_s2_var.p2_receiver_list_head,testGroupCfg_s2_var.p2_receiver_list_tail);}
if (sender == testGroupCfg_g2_g_var.id_send2) {
executor_dispatch_printHello(testGroupCfg_g2_g_var.send2_receiver_list_head,testGroupCfg_g2_g_var.send2_receiver_list_tail);}
if (sender == testGroupCfg_g2_g_var.id_send) {
executor_dispatch_printHello(testGroupCfg_g2_g_var.send_receiver_list_head,testGroupCfg_g2_g_var.send_receiver_list_tail);}
if (sender == testGroupCfg_s1_var.id_p) {
executor_dispatch_printHello(testGroupCfg_s1_var.p_receiver_list_head,testGroupCfg_s1_var.p_receiver_list_tail);}
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
dispatch_printHello((mbuf[0] << 8) + mbuf[1] /* instance port*/);
break;
}
}


//external Message enqueue

void initialize_configuration_testGroupCfg() {
// Initialize connectors
register_sender_send_p_printHello_listener(enqueue_sender_send_p_printHello);
register_sender_send_p2_printHello_listener(enqueue_sender_send_p2_printHello);
register_gateway_send_send_printHello_listener(enqueue_gateway_send_send_printHello);
register_gateway_send_send2_printHello_listener(enqueue_gateway_send_send2_printHello);

// Init the ID, state variables and properties for instance testGroupCfg_s1
testGroupCfg_s1_var.id_p = add_instance( (void*) &testGroupCfg_s1_var);
testGroupCfg_receivers[0] = &testGroupCfg_g2_g_listen_handlers;
testGroupCfg_receivers[1] = &testGroupCfg_g1_g_listen_handlers;
testGroupCfg_s1_var.p_receiver_list_head = &testGroupCfg_receivers[0];
testGroupCfg_s1_var.p_receiver_list_tail = &testGroupCfg_receivers[1];
testGroupCfg_s1_var.id_p2 = add_instance( (void*) &testGroupCfg_s1_var);
testGroupCfg_s1_var.p2_receiver_list_head = NULL;
testGroupCfg_s1_var.p2_receiver_list_tail = &testGroupCfg_receivers[2];
testGroupCfg_s1_var.sender_chrt_State = SENDER_CHRT_ACTIVE_STATE;

// Init the ID, state variables and properties for instance testGroupCfg_g1_g
testGroupCfg_g1_g_var.id_listen = add_instance( (void*) &testGroupCfg_g1_g_var);
testGroupCfg_g1_g_listen_msgs[0] = 1;
testGroupCfg_g1_g_listen_handlers_tab[0] = &gateway_handle_listen_printHello;
testGroupCfg_g1_g_listen_handlers.nb_msg = 1;
testGroupCfg_g1_g_listen_handlers.msg = &testGroupCfg_g1_g_listen_msgs;
testGroupCfg_g1_g_listen_handlers.msg_handler = &testGroupCfg_g1_g_listen_handlers_tab;
testGroupCfg_g1_g_listen_handlers.instance = &testGroupCfg_g1_g_var;
testGroupCfg_g1_g_var.listen_handlers = &testGroupCfg_g1_g_listen_handlers;
testGroupCfg_g1_g_var.id_send = add_instance( (void*) &testGroupCfg_g1_g_var);
testGroupCfg_receivers[2] = &testGroupCfg_g1_t1_p_handlers;
testGroupCfg_receivers[3] = &testGroupCfg_g1_t2_p2_handlers;
testGroupCfg_receivers[4] = &testGroupCfg_g1_t2_p_handlers;
testGroupCfg_g1_g_var.send_receiver_list_head = &testGroupCfg_receivers[2];
testGroupCfg_g1_g_var.send_receiver_list_tail = &testGroupCfg_receivers[4];
testGroupCfg_g1_g_var.id_send2 = add_instance( (void*) &testGroupCfg_g1_g_var);
testGroupCfg_receivers[5] = &testGroupCfg_g1_t2_p4_handlers;
testGroupCfg_receivers[6] = &testGroupCfg_g1_t2_p3_handlers;
testGroupCfg_g1_g_var.send2_receiver_list_head = &testGroupCfg_receivers[5];
testGroupCfg_g1_g_var.send2_receiver_list_tail = &testGroupCfg_receivers[6];
testGroupCfg_g1_g_var.gateway_chrt_State = GATEWAY_CHRT_ACTIVE_STATE;

// Init the ID, state variables and properties for instance testGroupCfg_g1_t2
testGroupCfg_g1_t2_var.id_p = add_instance( (void*) &testGroupCfg_g1_t2_var);
testGroupCfg_g1_t2_p_msgs[0] = 1;
testGroupCfg_g1_t2_p_handlers_tab[0] = &t2_handle_p_printHello;
testGroupCfg_g1_t2_p_handlers.nb_msg = 1;
testGroupCfg_g1_t2_p_handlers.msg = &testGroupCfg_g1_t2_p_msgs;
testGroupCfg_g1_t2_p_handlers.msg_handler = &testGroupCfg_g1_t2_p_handlers_tab;
testGroupCfg_g1_t2_p_handlers.instance = &testGroupCfg_g1_t2_var;
testGroupCfg_g1_t2_var.p_handlers = &testGroupCfg_g1_t2_p_handlers;
testGroupCfg_g1_t2_var.id_p2 = add_instance( (void*) &testGroupCfg_g1_t2_var);
testGroupCfg_g1_t2_p2_msgs[0] = 1;
testGroupCfg_g1_t2_p2_handlers_tab[0] = &t2_handle_p2_printHello;
testGroupCfg_g1_t2_p2_handlers.nb_msg = 1;
testGroupCfg_g1_t2_p2_handlers.msg = &testGroupCfg_g1_t2_p2_msgs;
testGroupCfg_g1_t2_p2_handlers.msg_handler = &testGroupCfg_g1_t2_p2_handlers_tab;
testGroupCfg_g1_t2_p2_handlers.instance = &testGroupCfg_g1_t2_var;
testGroupCfg_g1_t2_var.p2_handlers = &testGroupCfg_g1_t2_p2_handlers;
testGroupCfg_g1_t2_var.id_p3 = add_instance( (void*) &testGroupCfg_g1_t2_var);
testGroupCfg_g1_t2_p3_msgs[0] = 1;
testGroupCfg_g1_t2_p3_handlers_tab[0] = &t2_handle_p3_printHello;
testGroupCfg_g1_t2_p3_handlers.nb_msg = 1;
testGroupCfg_g1_t2_p3_handlers.msg = &testGroupCfg_g1_t2_p3_msgs;
testGroupCfg_g1_t2_p3_handlers.msg_handler = &testGroupCfg_g1_t2_p3_handlers_tab;
testGroupCfg_g1_t2_p3_handlers.instance = &testGroupCfg_g1_t2_var;
testGroupCfg_g1_t2_var.p3_handlers = &testGroupCfg_g1_t2_p3_handlers;
testGroupCfg_g1_t2_var.id_p4 = add_instance( (void*) &testGroupCfg_g1_t2_var);
testGroupCfg_g1_t2_p4_msgs[0] = 1;
testGroupCfg_g1_t2_p4_handlers_tab[0] = &t2_handle_p4_printHello;
testGroupCfg_g1_t2_p4_handlers.nb_msg = 1;
testGroupCfg_g1_t2_p4_handlers.msg = &testGroupCfg_g1_t2_p4_msgs;
testGroupCfg_g1_t2_p4_handlers.msg_handler = &testGroupCfg_g1_t2_p4_handlers_tab;
testGroupCfg_g1_t2_p4_handlers.instance = &testGroupCfg_g1_t2_var;
testGroupCfg_g1_t2_var.p4_handlers = &testGroupCfg_g1_t2_p4_handlers;
testGroupCfg_g1_t2_var.t2_chrt_State = T2_CHRT_ACTIVE_STATE;

// Init the ID, state variables and properties for instance testGroupCfg_s2
testGroupCfg_s2_var.id_p = add_instance( (void*) &testGroupCfg_s2_var);
testGroupCfg_receivers[7] = &testGroupCfg_g2_g_listen_handlers;
testGroupCfg_receivers[8] = &testGroupCfg_g2_t2_p_handlers;
testGroupCfg_receivers[9] = &testGroupCfg_g2_t2_p2_handlers;
testGroupCfg_receivers[10] = &testGroupCfg_g1_g_listen_handlers;
testGroupCfg_s2_var.p_receiver_list_head = &testGroupCfg_receivers[7];
testGroupCfg_s2_var.p_receiver_list_tail = &testGroupCfg_receivers[10];
testGroupCfg_s2_var.id_p2 = add_instance( (void*) &testGroupCfg_s2_var);
testGroupCfg_receivers[11] = &testGroupCfg_g2_t2_p4_handlers;
testGroupCfg_receivers[12] = &testGroupCfg_g2_t2_p3_handlers;
testGroupCfg_s2_var.p2_receiver_list_head = &testGroupCfg_receivers[11];
testGroupCfg_s2_var.p2_receiver_list_tail = &testGroupCfg_receivers[12];
testGroupCfg_s2_var.sender_chrt_State = SENDER_CHRT_ACTIVE_STATE;

// Init the ID, state variables and properties for instance testGroupCfg_g2_t1
testGroupCfg_g2_t1_var.id_p = add_instance( (void*) &testGroupCfg_g2_t1_var);
testGroupCfg_g2_t1_p_msgs[0] = 1;
testGroupCfg_g2_t1_p_handlers_tab[0] = &t1_handle_p_printHello;
testGroupCfg_g2_t1_p_handlers.nb_msg = 1;
testGroupCfg_g2_t1_p_handlers.msg = &testGroupCfg_g2_t1_p_msgs;
testGroupCfg_g2_t1_p_handlers.msg_handler = &testGroupCfg_g2_t1_p_handlers_tab;
testGroupCfg_g2_t1_p_handlers.instance = &testGroupCfg_g2_t1_var;
testGroupCfg_g2_t1_var.p_handlers = &testGroupCfg_g2_t1_p_handlers;
testGroupCfg_g2_t1_var.t1_chrt_State = T1_CHRT_ACTIVE_STATE;

// Init the ID, state variables and properties for instance testGroupCfg_g2_t2
testGroupCfg_g2_t2_var.id_p = add_instance( (void*) &testGroupCfg_g2_t2_var);
testGroupCfg_g2_t2_p_msgs[0] = 1;
testGroupCfg_g2_t2_p_handlers_tab[0] = &t2_handle_p_printHello;
testGroupCfg_g2_t2_p_handlers.nb_msg = 1;
testGroupCfg_g2_t2_p_handlers.msg = &testGroupCfg_g2_t2_p_msgs;
testGroupCfg_g2_t2_p_handlers.msg_handler = &testGroupCfg_g2_t2_p_handlers_tab;
testGroupCfg_g2_t2_p_handlers.instance = &testGroupCfg_g2_t2_var;
testGroupCfg_g2_t2_var.p_handlers = &testGroupCfg_g2_t2_p_handlers;
testGroupCfg_g2_t2_var.id_p2 = add_instance( (void*) &testGroupCfg_g2_t2_var);
testGroupCfg_g2_t2_p2_msgs[0] = 1;
testGroupCfg_g2_t2_p2_handlers_tab[0] = &t2_handle_p2_printHello;
testGroupCfg_g2_t2_p2_handlers.nb_msg = 1;
testGroupCfg_g2_t2_p2_handlers.msg = &testGroupCfg_g2_t2_p2_msgs;
testGroupCfg_g2_t2_p2_handlers.msg_handler = &testGroupCfg_g2_t2_p2_handlers_tab;
testGroupCfg_g2_t2_p2_handlers.instance = &testGroupCfg_g2_t2_var;
testGroupCfg_g2_t2_var.p2_handlers = &testGroupCfg_g2_t2_p2_handlers;
testGroupCfg_g2_t2_var.id_p3 = add_instance( (void*) &testGroupCfg_g2_t2_var);
testGroupCfg_g2_t2_p3_msgs[0] = 1;
testGroupCfg_g2_t2_p3_handlers_tab[0] = &t2_handle_p3_printHello;
testGroupCfg_g2_t2_p3_handlers.nb_msg = 1;
testGroupCfg_g2_t2_p3_handlers.msg = &testGroupCfg_g2_t2_p3_msgs;
testGroupCfg_g2_t2_p3_handlers.msg_handler = &testGroupCfg_g2_t2_p3_handlers_tab;
testGroupCfg_g2_t2_p3_handlers.instance = &testGroupCfg_g2_t2_var;
testGroupCfg_g2_t2_var.p3_handlers = &testGroupCfg_g2_t2_p3_handlers;
testGroupCfg_g2_t2_var.id_p4 = add_instance( (void*) &testGroupCfg_g2_t2_var);
testGroupCfg_g2_t2_p4_msgs[0] = 1;
testGroupCfg_g2_t2_p4_handlers_tab[0] = &t2_handle_p4_printHello;
testGroupCfg_g2_t2_p4_handlers.nb_msg = 1;
testGroupCfg_g2_t2_p4_handlers.msg = &testGroupCfg_g2_t2_p4_msgs;
testGroupCfg_g2_t2_p4_handlers.msg_handler = &testGroupCfg_g2_t2_p4_handlers_tab;
testGroupCfg_g2_t2_p4_handlers.instance = &testGroupCfg_g2_t2_var;
testGroupCfg_g2_t2_var.p4_handlers = &testGroupCfg_g2_t2_p4_handlers;
testGroupCfg_g2_t2_var.t2_chrt_State = T2_CHRT_ACTIVE_STATE;

// Init the ID, state variables and properties for instance testGroupCfg_g1_t1
testGroupCfg_g1_t1_var.id_p = add_instance( (void*) &testGroupCfg_g1_t1_var);
testGroupCfg_g1_t1_p_msgs[0] = 1;
testGroupCfg_g1_t1_p_handlers_tab[0] = &t1_handle_p_printHello;
testGroupCfg_g1_t1_p_handlers.nb_msg = 1;
testGroupCfg_g1_t1_p_handlers.msg = &testGroupCfg_g1_t1_p_msgs;
testGroupCfg_g1_t1_p_handlers.msg_handler = &testGroupCfg_g1_t1_p_handlers_tab;
testGroupCfg_g1_t1_p_handlers.instance = &testGroupCfg_g1_t1_var;
testGroupCfg_g1_t1_var.p_handlers = &testGroupCfg_g1_t1_p_handlers;
testGroupCfg_g1_t1_var.t1_chrt_State = T1_CHRT_ACTIVE_STATE;

// Init the ID, state variables and properties for instance testGroupCfg_g2_g
testGroupCfg_g2_g_var.id_listen = add_instance( (void*) &testGroupCfg_g2_g_var);
testGroupCfg_g2_g_listen_msgs[0] = 1;
testGroupCfg_g2_g_listen_handlers_tab[0] = &gateway_handle_listen_printHello;
testGroupCfg_g2_g_listen_handlers.nb_msg = 1;
testGroupCfg_g2_g_listen_handlers.msg = &testGroupCfg_g2_g_listen_msgs;
testGroupCfg_g2_g_listen_handlers.msg_handler = &testGroupCfg_g2_g_listen_handlers_tab;
testGroupCfg_g2_g_listen_handlers.instance = &testGroupCfg_g2_g_var;
testGroupCfg_g2_g_var.listen_handlers = &testGroupCfg_g2_g_listen_handlers;
testGroupCfg_g2_g_var.id_send = add_instance( (void*) &testGroupCfg_g2_g_var);
testGroupCfg_receivers[13] = &testGroupCfg_g2_t2_p2_handlers;
testGroupCfg_receivers[14] = &testGroupCfg_g2_t1_p_handlers;
testGroupCfg_receivers[15] = &testGroupCfg_g2_t2_p_handlers;
testGroupCfg_g2_g_var.send_receiver_list_head = &testGroupCfg_receivers[13];
testGroupCfg_g2_g_var.send_receiver_list_tail = &testGroupCfg_receivers[15];
testGroupCfg_g2_g_var.id_send2 = add_instance( (void*) &testGroupCfg_g2_g_var);
testGroupCfg_receivers[16] = &testGroupCfg_g2_t2_p3_handlers;
testGroupCfg_receivers[17] = &testGroupCfg_g2_t2_p4_handlers;
testGroupCfg_g2_g_var.send2_receiver_list_head = &testGroupCfg_receivers[16];
testGroupCfg_g2_g_var.send2_receiver_list_tail = &testGroupCfg_receivers[17];
testGroupCfg_g2_g_var.gateway_chrt_State = GATEWAY_CHRT_ACTIVE_STATE;


// Network Initilization 


// End Network Initilization 

t2_chrt_OnEntry(T2_CHRT_STATE, &testGroupCfg_g2_t2_var);
gateway_chrt_OnEntry(GATEWAY_CHRT_STATE, &testGroupCfg_g1_g_var);
t2_chrt_OnEntry(T2_CHRT_STATE, &testGroupCfg_g1_t2_var);
t1_chrt_OnEntry(T1_CHRT_STATE, &testGroupCfg_g2_t1_var);
t1_chrt_OnEntry(T1_CHRT_STATE, &testGroupCfg_g1_t1_var);
gateway_chrt_OnEntry(GATEWAY_CHRT_STATE, &testGroupCfg_g2_g_var);
sender_chrt_OnEntry(SENDER_CHRT_STATE, &testGroupCfg_s2_var);
sender_chrt_OnEntry(SENDER_CHRT_STATE, &testGroupCfg_s1_var);
}




int main(int argc, char *argv[]) {
  init_runtime();
  
  initialize_configuration_testGroupCfg();

  while (1) {
    
// Network Listener

    processMessageQueue();
  }
}