/*****************************************************
 *      THIS IS A GENERATED FILE. DO NOT EDIT.
 *      Implementation for Application UbberButtonControllerCfg
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
#include "bc_LEDport_Serial1.h"
#include "bc_WS_Websocket.h"





/*****************************************************************************
 * Definitions for configuration : UbberButtonControllerCfg
 *****************************************************************************/

//Declaration of connexion array
#define NB_MAX_CONNEXION 2
struct Msg_Handler * UbberButtonControllerCfg_receivers[NB_MAX_CONNEXION];

//Declaration of instance variables
//Instance UbberButtonControllerCfg_bc
struct ButtonController_Instance UbberButtonControllerCfg_bc_var;
struct Msg_Handler UbberButtonControllerCfg_bc_LEDport_handlers;
uint16_t UbberButtonControllerCfg_bc_LEDport_msgs[3];
void * UbberButtonControllerCfg_bc_LEDport_handlers_tab[3];

struct Msg_Handler UbberButtonControllerCfg_bc_WS_handlers;
uint16_t UbberButtonControllerCfg_bc_WS_msgs[4];
void * UbberButtonControllerCfg_bc_WS_handlers_tab[4];




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
}
   if(cur == tail){
       cur = NULL;}
   else {
   cur++;}
}
}
if (sender == UbberButtonControllerCfg_bc_var.id_LEDport) {
executor_dispatch_LEDControllerReady(UbberButtonControllerCfg_bc_var.LEDport_receiver_list_head,UbberButtonControllerCfg_bc_var.LEDport_receiver_list_tail);}
if (sender == Serial1_instance.listener_id) {
executor_dispatch_LEDControllerReady(Serial1_instance.LEDport_receiver_list_head,Serial1_instance.LEDport_receiver_list_tail);}
}

//Dynamic dispatcher for message clientDC
void dispatch_clientDC(uint16_t sender, uint16_t param_ClientID) {
void executor_dispatch_clientDC(struct Msg_Handler ** head, struct Msg_Handler ** tail) {
struct Msg_Handler ** cur = head;
while (cur != NULL) {
   void (*handler)(void *, uint16_t param_ClientID) = NULL;
   int i;
   for(i = 0; i < (**cur).nb_msg; i++) {
       if((**cur).msg[i] == 2) {
           handler = (void (*) (void *, uint16_t)) (**cur).msg_handler[i];
           break;
       }
   }
   if(handler != NULL) {
       handler((**cur).instance, param_ClientID);
}
   if(cur == tail){
       cur = NULL;}
   else {
   cur++;}
}
}
if (sender == Websocket_instance.listener_id) {
executor_dispatch_clientDC(Websocket_instance.WS_receiver_list_head,Websocket_instance.WS_receiver_list_tail);}
}

//Dynamic dispatcher for message newClient
void dispatch_newClient(uint16_t sender, uint16_t param_ClientID) {
void executor_dispatch_newClient(struct Msg_Handler ** head, struct Msg_Handler ** tail) {
struct Msg_Handler ** cur = head;
while (cur != NULL) {
   void (*handler)(void *, uint16_t param_ClientID) = NULL;
   int i;
   for(i = 0; i < (**cur).nb_msg; i++) {
       if((**cur).msg[i] == 1) {
           handler = (void (*) (void *, uint16_t)) (**cur).msg_handler[i];
           break;
       }
   }
   if(handler != NULL) {
       handler((**cur).instance, param_ClientID);
}
   if(cur == tail){
       cur = NULL;}
   else {
   cur++;}
}
}
if (sender == Websocket_instance.listener_id) {
executor_dispatch_newClient(Websocket_instance.WS_receiver_list_head,Websocket_instance.WS_receiver_list_tail);}
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
}
   if(cur == tail){
       cur = NULL;}
   else {
   cur++;}
}
}
if (sender == UbberButtonControllerCfg_bc_var.id_LEDport) {
executor_dispatch_LEDOFF(UbberButtonControllerCfg_bc_var.LEDport_receiver_list_head,UbberButtonControllerCfg_bc_var.LEDport_receiver_list_tail);}
if (sender == Serial1_instance.listener_id) {
executor_dispatch_LEDOFF(Serial1_instance.LEDport_receiver_list_head,Serial1_instance.LEDport_receiver_list_tail);}
if (sender == Websocket_instance.listener_id) {
executor_dispatch_LEDOFF(Websocket_instance.WS_receiver_list_head,Websocket_instance.WS_receiver_list_tail);}
}

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
}
   if(cur == tail){
       cur = NULL;}
   else {
   cur++;}
}
}
if (sender == UbberButtonControllerCfg_bc_var.id_LEDport) {
executor_dispatch_LEDON(UbberButtonControllerCfg_bc_var.LEDport_receiver_list_head,UbberButtonControllerCfg_bc_var.LEDport_receiver_list_tail);}
if (sender == Serial1_instance.listener_id) {
executor_dispatch_LEDON(Serial1_instance.LEDport_receiver_list_head,Serial1_instance.LEDport_receiver_list_tail);}
if (sender == Websocket_instance.listener_id) {
executor_dispatch_LEDON(Websocket_instance.WS_receiver_list_head,Websocket_instance.WS_receiver_list_tail);}
}

void processMessageQueue() {
fifo_lock();
while (fifo_empty()) fifo_wait();
byte mbuf[4];
uint8_t mbufi = 0;

// Read the code of the next port/message in the queue
uint16_t code = fifo_dequeue() << 8;

code += fifo_dequeue();

// Switch to call the appropriate handler
switch(code) {
case 65:
while (mbufi < 2) mbuf[mbufi++] = fifo_dequeue();
fifo_unlock();
dispatch_LEDControllerReady((mbuf[0] << 8) + mbuf[1] /* instance port*/);
break;
case 2:
while (mbufi < 4) mbuf[mbufi++] = fifo_dequeue();
fifo_unlock();
union u_clientDC_ClientID_t {
uint16_t p;
byte bytebuffer[2];
} u_clientDC_ClientID;
u_clientDC_ClientID.bytebuffer[1] = mbuf[2];
u_clientDC_ClientID.bytebuffer[0] = mbuf[3];
dispatch_clientDC((mbuf[0] << 8) + mbuf[1] /* instance port*/,
 u_clientDC_ClientID.p /* ClientID */ );
break;
case 1:
while (mbufi < 4) mbuf[mbufi++] = fifo_dequeue();
fifo_unlock();
union u_newClient_ClientID_t {
uint16_t p;
byte bytebuffer[2];
} u_newClient_ClientID;
u_newClient_ClientID.bytebuffer[1] = mbuf[2];
u_newClient_ClientID.bytebuffer[0] = mbuf[3];
dispatch_newClient((mbuf[0] << 8) + mbuf[1] /* instance port*/,
 u_newClient_ClientID.p /* ClientID */ );
break;
case 67:
while (mbufi < 2) mbuf[mbufi++] = fifo_dequeue();
fifo_unlock();
dispatch_LEDOFF((mbuf[0] << 8) + mbuf[1] /* instance port*/);
break;
case 66:
while (mbufi < 2) mbuf[mbufi++] = fifo_dequeue();
fifo_unlock();
dispatch_LEDON((mbuf[0] << 8) + mbuf[1] /* instance port*/);
break;
}
}

// Forwarding of messages ButtonController::LEDport::LEDON
void forward_ButtonController_send_LEDport_LEDON(struct ButtonController_Instance *_instance){
byte forward_buf[2];
forward_buf[0] = (66 >> 8) & 0xFF;
forward_buf[1] =  66 & 0xFF;


//Forwarding with specified function 
Serial1_forwardMessage(forward_buf, 2);
}

// Forwarding of messages ButtonController::LEDport::LEDOFF
void forward_ButtonController_send_LEDport_LEDOFF(struct ButtonController_Instance *_instance){
byte forward_buf[2];
forward_buf[0] = (67 >> 8) & 0xFF;
forward_buf[1] =  67 & 0xFF;


//Forwarding with specified function 
Serial1_forwardMessage(forward_buf, 2);
}

// Forwarding of messages ButtonController::LEDport::LEDControllerReady
void forward_ButtonController_send_LEDport_LEDControllerReady(struct ButtonController_Instance *_instance){
byte forward_buf[2];
forward_buf[0] = (65 >> 8) & 0xFF;
forward_buf[1] =  65 & 0xFF;


//Forwarding with specified function 
Serial1_forwardMessage(forward_buf, 2);
}

// Forwarding of messages ButtonController::WS::LEDisON
void forward_ButtonController_send_WS_LEDisON(struct ButtonController_Instance *_instance, uint16_t ClientID){
byte forward_buf[4];
forward_buf[0] = (101 >> 8) & 0xFF;
forward_buf[1] =  101 & 0xFF;


// parameter ClientID

//Forwarding with specified function 
Websocket_forwardMessage(forward_buf, 2, ClientID);
}

// Forwarding of messages ButtonController::WS::LEDisOFF
void forward_ButtonController_send_WS_LEDisOFF(struct ButtonController_Instance *_instance, uint16_t ClientID){
byte forward_buf[4];
forward_buf[0] = (102 >> 8) & 0xFF;
forward_buf[1] =  102 & 0xFF;


// parameter ClientID

//Forwarding with specified function 
Websocket_forwardMessage(forward_buf, 2, ClientID);
}


//external Message enqueue
void externalMessageEnqueue(uint8_t * msg, uint8_t msgSize, uint16_t listener_id) {
if ((msgSize >= 2) && (msg != NULL)) {
uint8_t msgSizeOK = 0;
switch(msg[0] * 256 + msg[1]) {
case 65:
if(msgSize == 2) {
msgSizeOK = 1;}
break;
case 2:
if(msgSize == 4) {
msgSizeOK = 1;}
break;
case 1:
if(msgSize == 4) {
msgSizeOK = 1;}
break;
case 67:
if(msgSize == 2) {
msgSizeOK = 1;}
break;
case 66:
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

void initialize_configuration_UbberButtonControllerCfg() {
// Initialize connectors
register_external_ButtonController_send_LEDport_LEDON_listener(forward_ButtonController_send_LEDport_LEDON);
register_external_ButtonController_send_LEDport_LEDOFF_listener(forward_ButtonController_send_LEDport_LEDOFF);
register_external_ButtonController_send_LEDport_LEDControllerReady_listener(forward_ButtonController_send_LEDport_LEDControllerReady);
register_external_ButtonController_send_WS_LEDisON_listener(forward_ButtonController_send_WS_LEDisON);
register_external_ButtonController_send_WS_LEDisOFF_listener(forward_ButtonController_send_WS_LEDisOFF);

// Init the ID, state variables and properties for instance UbberButtonControllerCfg_bc
printf("Initialization of UbberButtonControllerCfg_bc\n");
UbberButtonControllerCfg_bc_var.id_LEDport = add_instance( (void*) &UbberButtonControllerCfg_bc_var);
UbberButtonControllerCfg_bc_LEDport_msgs[0] = 66;
UbberButtonControllerCfg_bc_LEDport_handlers_tab[0] = (void*) &ButtonController_handle_LEDport_LEDON;
UbberButtonControllerCfg_bc_LEDport_msgs[1] = 67;
UbberButtonControllerCfg_bc_LEDport_handlers_tab[1] = (void*) &ButtonController_handle_LEDport_LEDOFF;
UbberButtonControllerCfg_bc_LEDport_msgs[2] = 65;
UbberButtonControllerCfg_bc_LEDport_handlers_tab[2] = NULL;
UbberButtonControllerCfg_bc_LEDport_handlers.nb_msg = 3;
UbberButtonControllerCfg_bc_LEDport_handlers.msg = (uint16_t *) &UbberButtonControllerCfg_bc_LEDport_msgs;
UbberButtonControllerCfg_bc_LEDport_handlers.msg_handler = (void **) &UbberButtonControllerCfg_bc_LEDport_handlers_tab;
UbberButtonControllerCfg_bc_LEDport_handlers.instance = &UbberButtonControllerCfg_bc_var;
UbberButtonControllerCfg_bc_var.LEDport_handlers = &UbberButtonControllerCfg_bc_LEDport_handlers;
UbberButtonControllerCfg_bc_var.LEDport_receiver_list_head = NULL;
UbberButtonControllerCfg_bc_var.LEDport_receiver_list_tail = &UbberButtonControllerCfg_receivers[0];
UbberButtonControllerCfg_bc_var.id_WS = add_instance( (void*) &UbberButtonControllerCfg_bc_var);
UbberButtonControllerCfg_bc_WS_msgs[0] = 66;
UbberButtonControllerCfg_bc_WS_handlers_tab[0] = (void*) &ButtonController_handle_WS_LEDON;
UbberButtonControllerCfg_bc_WS_msgs[1] = 67;
UbberButtonControllerCfg_bc_WS_handlers_tab[1] = (void*) &ButtonController_handle_WS_LEDOFF;
UbberButtonControllerCfg_bc_WS_msgs[2] = 1;
UbberButtonControllerCfg_bc_WS_handlers_tab[2] = (void*) &ButtonController_handle_WS_newClient;
UbberButtonControllerCfg_bc_WS_msgs[3] = 2;
UbberButtonControllerCfg_bc_WS_handlers_tab[3] = NULL;
UbberButtonControllerCfg_bc_WS_handlers.nb_msg = 4;
UbberButtonControllerCfg_bc_WS_handlers.msg = (uint16_t *) &UbberButtonControllerCfg_bc_WS_msgs;
UbberButtonControllerCfg_bc_WS_handlers.msg_handler = (void **) &UbberButtonControllerCfg_bc_WS_handlers_tab;
UbberButtonControllerCfg_bc_WS_handlers.instance = &UbberButtonControllerCfg_bc_var;
UbberButtonControllerCfg_bc_var.WS_handlers = &UbberButtonControllerCfg_bc_WS_handlers;
UbberButtonControllerCfg_bc_var.WS_receiver_list_head = NULL;
UbberButtonControllerCfg_bc_var.WS_receiver_list_tail = &UbberButtonControllerCfg_receivers[0];
UbberButtonControllerCfg_bc_var.ButtonController_LEDControllerChart_State = BUTTONCONTROLLER_LEDCONTROLLERCHART_INIT_STATE;

// Init the ID, state variables and properties for external connector Serial1
Serial1_instance.listener_id = add_instance( (void*) &Serial1_instance);
UbberButtonControllerCfg_receivers[0] = &UbberButtonControllerCfg_bc_LEDport_handlers;
Serial1_instance.LEDport_receiver_list_head = &UbberButtonControllerCfg_receivers[0];
Serial1_instance.LEDport_receiver_list_tail = &UbberButtonControllerCfg_receivers[0];
// Init the ID, state variables and properties for external connector Websocket
Websocket_instance.listener_id = add_instance( (void*) &Websocket_instance);
UbberButtonControllerCfg_receivers[1] = &UbberButtonControllerCfg_bc_WS_handlers;
Websocket_instance.WS_receiver_list_head = &UbberButtonControllerCfg_receivers[1];
Websocket_instance.WS_receiver_list_tail = &UbberButtonControllerCfg_receivers[1];

// Network Initilization 
//Serial1:
Serial1_setup();
pthread_t thread_bc_LEDport_Serial1;
pthread_create( &thread_bc_LEDport_Serial1, NULL, Serial1_start_receiver_process, NULL);
//Websocket:
Websocket_setup();
pthread_t thread_bc_WS_Websocket;
pthread_create( &thread_bc_WS_Websocket, NULL, Websocket_start_receiver_process, NULL);


// End Network Initilization 

ButtonController_LEDControllerChart_OnEntry(BUTTONCONTROLLER_LEDCONTROLLERCHART_STATE, &UbberButtonControllerCfg_bc_var);
}




int main(int argc, char *argv[]) {
  init_runtime();
  
  initialize_configuration_UbberButtonControllerCfg();

  while (1) {
    
// Network Listener
ButtonController_handle_empty_event(&UbberButtonControllerCfg_bc_var);

    processMessageQueue();
  }
}