/*****************************************************
 *      THIS IS A GENERATED FILE. DO NOT EDIT.
 *      Implementation for Application minCfg
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
#include "ButtonController.h"
#include "test_WS_MQTT.h"





/*****************************************************************************
 * Definitions for configuration : minCfg
 *****************************************************************************/

//Declaration of connexion array
#define NB_MAX_CONNEXION 1
struct Msg_Handler * minCfg_receivers[NB_MAX_CONNEXION];

//Declaration of instance variables
//Instance minCfg_test
struct ButtonController_Instance minCfg_test_var;
struct Msg_Handler minCfg_test_LEDport_handlers;
uint16_t minCfg_test_LEDport_msgs[3];
void * minCfg_test_LEDport_handlers_tab[3];

struct Msg_Handler minCfg_test_WS_handlers;
uint16_t minCfg_test_WS_msgs[2];
void * minCfg_test_WS_handlers_tab[2];




//Dynamic dispatcher for message LEDON
void dispatch_LEDON(uint16_t sender) {
void executor_dispatch_LEDON(struct Msg_Handler ** head, struct Msg_Handler ** tail) {
struct Msg_Handler ** cur = head;
while (cur != NULL) {
   void (*handler)(void *) = NULL;
   int i;
   for(i = 0; i < (**cur).nb_msg; i++) {
       if((**cur).msg[i] == 66) {
           handler = (void (*) (void *)) (**cur).msg_handler[i];
           break;
       }
   }
   if(handler != NULL) {
       handler((**cur).instance);
printf("[Dispatcher] Calling handler for LEDON\n");
}
   if(cur == tail){
       cur = NULL;}
   else {
   cur++;}
}
}
if (sender == minCfg_test_var.id_LEDport) {
executor_dispatch_LEDON(minCfg_test_var.LEDport_receiver_list_head,minCfg_test_var.LEDport_receiver_list_tail);}
if (sender == MQTT_instance.listener_id) {
executor_dispatch_LEDON(MQTT_instance.WS_receiver_list_head,MQTT_instance.WS_receiver_list_tail);}
}

//Dynamic dispatcher for message LEDOFF
void dispatch_LEDOFF(uint16_t sender) {
void executor_dispatch_LEDOFF(struct Msg_Handler ** head, struct Msg_Handler ** tail) {
struct Msg_Handler ** cur = head;
while (cur != NULL) {
   void (*handler)(void *) = NULL;
   int i;
   for(i = 0; i < (**cur).nb_msg; i++) {
       if((**cur).msg[i] == 67) {
           handler = (void (*) (void *)) (**cur).msg_handler[i];
           break;
       }
   }
   if(handler != NULL) {
       handler((**cur).instance);
printf("[Dispatcher] Calling handler for LEDOFF\n");
}
   if(cur == tail){
       cur = NULL;}
   else {
   cur++;}
}
}
if (sender == minCfg_test_var.id_LEDport) {
executor_dispatch_LEDOFF(minCfg_test_var.LEDport_receiver_list_head,minCfg_test_var.LEDport_receiver_list_tail);}
if (sender == MQTT_instance.listener_id) {
executor_dispatch_LEDOFF(MQTT_instance.WS_receiver_list_head,MQTT_instance.WS_receiver_list_tail);}
}

//Dynamic dispatcher for message LEDControllerReady
void dispatch_LEDControllerReady(uint16_t sender) {
void executor_dispatch_LEDControllerReady(struct Msg_Handler ** head, struct Msg_Handler ** tail) {
struct Msg_Handler ** cur = head;
while (cur != NULL) {
   void (*handler)(void *) = NULL;
   int i;
   for(i = 0; i < (**cur).nb_msg; i++) {
       if((**cur).msg[i] == 65) {
           handler = (void (*) (void *)) (**cur).msg_handler[i];
           break;
       }
   }
   if(handler != NULL) {
       handler((**cur).instance);
printf("[Dispatcher] Calling handler for LEDControllerReady\n");
}
   if(cur == tail){
       cur = NULL;}
   else {
   cur++;}
}
}
if (sender == minCfg_test_var.id_LEDport) {
executor_dispatch_LEDControllerReady(minCfg_test_var.LEDport_receiver_list_head,minCfg_test_var.LEDport_receiver_list_tail);}
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
case 66:
while (mbufi < 2) mbuf[mbufi++] = fifo_dequeue();
printf("[PMQ] Dequeue LEDON\n");
printf("[PMQ] Dequeue |");
printf("%i", mbuf[0]);
printf("|");
printf("%i", mbuf[1]);
printf("|");
printf("\n");
fifo_unlock();
dispatch_LEDON((mbuf[0] << 8) + mbuf[1] /* instance port*/);
break;
case 67:
while (mbufi < 2) mbuf[mbufi++] = fifo_dequeue();
printf("[PMQ] Dequeue LEDOFF\n");
printf("[PMQ] Dequeue |");
printf("%i", mbuf[0]);
printf("|");
printf("%i", mbuf[1]);
printf("|");
printf("\n");
fifo_unlock();
dispatch_LEDOFF((mbuf[0] << 8) + mbuf[1] /* instance port*/);
break;
case 65:
while (mbufi < 2) mbuf[mbufi++] = fifo_dequeue();
printf("[PMQ] Dequeue LEDControllerReady\n");
printf("[PMQ] Dequeue |");
printf("%i", mbuf[0]);
printf("|");
printf("%i", mbuf[1]);
printf("|");
printf("\n");
fifo_unlock();
dispatch_LEDControllerReady((mbuf[0] << 8) + mbuf[1] /* instance port*/);
break;
}
}

// Forwarding of messages ButtonController::WS::LEDisON
void forward_ButtonController_send_WS_LEDisON(struct ButtonController_Instance *_instance, uint16_t ClientID){
byte forward_buf[4];
forward_buf[0] = (101 >> 8) & 0xFF;
forward_buf[1] =  101 & 0xFF;


// parameter ClientID
union u_ClientID_t {
uint16_t p;
byte bytebuffer[2];
} u_ClientID;
u_ClientID.p = ClientID;
forward_buf[2] =  (u_ClientID.bytebuffer[1] & 0xFF);
forward_buf[3] =  (u_ClientID.bytebuffer[0] & 0xFF);

//Forwarding with specified function 
MQTT_forwardMessage(forward_buf, 4);
}

// Forwarding of messages ButtonController::WS::LEDisOFF
void forward_ButtonController_send_WS_LEDisOFF(struct ButtonController_Instance *_instance, uint16_t ClientID){
byte forward_buf[4];
forward_buf[0] = (102 >> 8) & 0xFF;
forward_buf[1] =  102 & 0xFF;


// parameter ClientID
union u_ClientID_t {
uint16_t p;
byte bytebuffer[2];
} u_ClientID;
u_ClientID.p = ClientID;
forward_buf[2] =  (u_ClientID.bytebuffer[1] & 0xFF);
forward_buf[3] =  (u_ClientID.bytebuffer[0] & 0xFF);

//Forwarding with specified function 
MQTT_forwardMessage(forward_buf, 4);
}


//external Message enqueue
void externalMessageEnqueue(uint8_t * msg, uint8_t msgSize, uint16_t listener_id) {
if ((msgSize >= 2) && (msg != NULL)) {
uint8_t msgSizeOK = 0;
switch(msg[0] * 256 + msg[1]) {
case 66:
if(msgSize == 2) {
msgSizeOK = 1;}
break;
case 67:
if(msgSize == 2) {
msgSizeOK = 1;}
break;
default:{
printf("[External Enqueue] Unknown message ID:");
printf("%i", (msg[0] * 256 + msg[1]));
printf("\n");
break;}
}

if(msgSizeOK == 1) {
fifo_lock();
if ( fifo_byte_available() > (msgSize + 2) ) {
	uint8_t i;
	for (i = 0; i < 2; i++) {
		_fifo_enqueue(msg[i]);
	}
	_fifo_enqueue((listener_id >> 8) & 0xFF);
	_fifo_enqueue(listener_id & 0xFF);
	for (i = 2; i < msgSize; i++) {
		_fifo_enqueue(msg[i]);
	}
}
fifo_unlock_and_notify();
}
else {printf("[External Enqueue] Malformed message (ID:");
printf("%i", (msg[0] * 256 + msg[1]));
printf(")\n");
}
}
else {printf("[External Enqueue] Unreadable message ID\n");
}
}

void initialize_configuration_minCfg() {
// Initialize connectors
register_external_ButtonController_send_WS_LEDisON_listener(forward_ButtonController_send_WS_LEDisON);
register_external_ButtonController_send_WS_LEDisOFF_listener(forward_ButtonController_send_WS_LEDisOFF);

// Init the ID, state variables and properties for instance minCfg_test
printf("Initialization of minCfg_test\n");
minCfg_test_var.id_LEDport = add_instance( (void*) &minCfg_test_var);
minCfg_test_LEDport_msgs[0] = 66;
minCfg_test_LEDport_handlers_tab[0] = (void*) &ButtonController_handle_LEDport_LEDON;
minCfg_test_LEDport_msgs[1] = 67;
minCfg_test_LEDport_handlers_tab[1] = (void*) &ButtonController_handle_LEDport_LEDOFF;
minCfg_test_LEDport_msgs[2] = 65;
minCfg_test_LEDport_handlers_tab[2] = NULL;
minCfg_test_LEDport_handlers.nb_msg = 3;
minCfg_test_LEDport_handlers.msg = (uint16_t *) &minCfg_test_LEDport_msgs;
minCfg_test_LEDport_handlers.msg_handler = (void **) &minCfg_test_LEDport_handlers_tab;
minCfg_test_LEDport_handlers.instance = &minCfg_test_var;
minCfg_test_var.LEDport_handlers = &minCfg_test_LEDport_handlers;
minCfg_test_var.LEDport_receiver_list_head = NULL;
minCfg_test_var.LEDport_receiver_list_tail = &minCfg_receivers[0];
minCfg_test_var.id_WS = add_instance( (void*) &minCfg_test_var);
minCfg_test_WS_msgs[0] = 66;
minCfg_test_WS_handlers_tab[0] = (void*) &ButtonController_handle_WS_LEDON;
minCfg_test_WS_msgs[1] = 67;
minCfg_test_WS_handlers_tab[1] = (void*) &ButtonController_handle_WS_LEDOFF;
minCfg_test_WS_handlers.nb_msg = 2;
minCfg_test_WS_handlers.msg = (uint16_t *) &minCfg_test_WS_msgs;
minCfg_test_WS_handlers.msg_handler = (void **) &minCfg_test_WS_handlers_tab;
minCfg_test_WS_handlers.instance = &minCfg_test_var;
minCfg_test_var.WS_handlers = &minCfg_test_WS_handlers;
minCfg_test_var.WS_receiver_list_head = NULL;
minCfg_test_var.WS_receiver_list_tail = &minCfg_receivers[0];
minCfg_test_var.ButtonController_LEDControllerChart_State = BUTTONCONTROLLER_LEDCONTROLLERCHART_INIT_STATE;

// Init the ID, state variables and properties for external connector MQTT
MQTT_instance.listener_id = add_instance( (void*) &MQTT_instance);
minCfg_receivers[0] = &minCfg_test_WS_handlers;
MQTT_instance.WS_receiver_list_head = &minCfg_receivers[0];
MQTT_instance.WS_receiver_list_tail = &minCfg_receivers[0];

// Network Initilization 
//MQTT:
MQTT_setup();
MQTT_set_listener_id(minCfg_test_var.id_WS);
pthread_t thread_test_WS_MQTT;
pthread_create( &thread_test_WS_MQTT, NULL, MQTT_start_receiver_process, NULL);


// End Network Initilization 

ButtonController_LEDControllerChart_OnEntry(BUTTONCONTROLLER_LEDCONTROLLERCHART_STATE, &minCfg_test_var);
}




int main(int argc, char *argv[]) {
  init_runtime();
  
  initialize_configuration_minCfg();

  while (1) {
    
// Network Listener
ButtonController_handle_empty_event(&minCfg_test_var);

    processMessageQueue();
  }
}